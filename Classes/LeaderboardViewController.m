//
//  LeaderboardViewController.m
//  Microlending
//
//  Created by Cody Kolodziejzyk on 11/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LeaderboardViewController.h"
#import "Grabber.h"
#import "Transaction.h"

@class Grabber;
@class Transaction;


@implementation LeaderboardViewController

@synthesize allTransactions;
@synthesize currentLender;
@synthesize topControl;


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
	
	appDelegate = [[UIApplication sharedApplication] delegate];
	allTransactions = [[NSMutableArray alloc] init];

	
	Grabber *newGrabber = [[Grabber alloc] initWithParams:@"transactions" 
												  apiName:@"" 
												 argument:@"" 
												  apiCall:@"GET" 
											typeOfGrabber:@"initial"];
	
	newGrabber.grabberDelegate = self;
	[newGrabber release];
	
	
	//Add segmented control to nav bar
	
	NSArray *items = [NSArray arrayWithObjects:@"Top Transactions", @"Top Lenders",nil];
	topControl = [[UISegmentedControl alloc] initWithItems:items];
	topControl.segmentedControlStyle = UISegmentedControlStyleBar;
	[topControl addTarget:self action:@selector(changedSelectedSegment:) forControlEvents:UIControlEventValueChanged];
	topControl.selectedSegmentIndex = 0;
	self.navigationItem.titleView = topControl;
	[topControl release];
	

    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)changedSelectedSegment:(id)sender {
	
	NSLog(@"%i",topControl.selectedSegmentIndex);
	
}

-(void)didGetData:(NSArray *)recievedData withType:(NSString *)thisType {
		
	if ([thisType isEqualToString:@"initial"]) {
	
	for (int x = 0; x < [recievedData count]; x++) {
		
		NSDictionary *newDic = [recievedData objectAtIndex:x];
		Transaction *newTrans = [[Transaction alloc] initFromLender:[newDic objectForKey:@"luid"] 
														 toBorrower:[newDic objectForKey:@"buid"] 
													 withThisAmount:[newDic objectForKey:@"amount"]];
		[allTransactions addObject:newTrans];

		[newTrans release];
		
		}
				
		[allTransactions sortUsingSelector:@selector(compare:)];
		[self.tableView reloadData];
	
	}
	

	

}

- (void)segmentedControl:(UISegmentedControl*)segmentedControl didSelectIndex:(NSUInteger)index {
	
	
}

//-(void)didFinishSettingUpTransaction:(BOOL)result withTransaction:(id)thisTransaction {
//	
//	NSLog(@"got here");
//
//	
//	if (result) {
//		
//
//	}
//	
//	
//}




/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [allTransactions count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
	
	Transaction *temp = [allTransactions objectAtIndex:indexPath.row]; 
	NSString *labelString = [[NSString alloc] initWithFormat:@"From Lender: %@ to Borrower: %@",temp.fromUID,temp.toUID];
	NSString *subtitleString = [[NSString alloc] initWithFormat:@"Amount: %@",temp.amount];
	[cell.textLabel setText:labelString];
	[cell.detailTextLabel setText:subtitleString];
	cell.textLabel.font = [UIFont fontWithName:@"Garamond" size:10];
	[labelString release];
	[subtitleString release];
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    */
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[allTransactions release];
	[currentLender release];
	[topControl release];
    [super dealloc];
}


@end

