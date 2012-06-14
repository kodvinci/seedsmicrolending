//
//  MPViewController.m
//  Microlending
//
//  Created by Sam Baek on 10/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MPViewController.h"
#import "BorrowerSingleViewController.h"
#import "MicrolendingAppDelegate.h"
#import "SBJson.h"
#import "SBJsonParser.h"

@class BorrowerSingleViewController;
@class MicrolendingAppDelegate;

@implementation MPViewController

@synthesize allBusinesses, specificBusinesses, currentCategory, selectedCategory;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void)pressedFilter:(id)sender {
	
	UIActionSheet *asheet = [[UIActionSheet alloc] initWithTitle:@"Select a category" 
														delegate:self 
											   cancelButtonTitle:@"Cancel" 
										  destructiveButtonTitle:nil 
											   otherButtonTitles:@"fish", @"cake", @"self-help",@"all", nil];
    [asheet showFromTabBar:appDelegate.tabBarController.tabBar];
    [asheet release];
	
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	
	if (buttonIndex == 3) {
		[specificBusinesses removeAllObjects];
		for (int x = 0; x < [allBusinesses count]; x++) {
			NSDictionary *info = [allBusinesses objectAtIndex:x];
			[specificBusinesses addObject:info];
		}
		[self.tableView reloadData];
	}
	
	if (buttonIndex != actionSheet.cancelButtonIndex && buttonIndex != 3) {
		
		[specificBusinesses removeAllObjects];
		
		for (int x = 0; x < [allBusinesses count]; x++) {
			
			NSDictionary *info = [allBusinesses objectAtIndex:x];
			
			if ([[info valueForKey:@"category"] isEqualToString:selectedCategory]) {
				[specificBusinesses addObject:info];
			}
		}
		
		[selectedCategory release];
		[self.tableView reloadData];
		
	}
	
	
	
	
}

-(void)createGrabber {
	
	[specificBusinesses removeAllObjects];
	[allBusinesses removeAllObjects];
	[self.tableView reloadData];
	
	Grabber *newGrabber = [[Grabber alloc] initWithParams:@"borrowers" apiName:@"" argument:@"" apiCall:@"GET" typeOfGrabber:@""];
    newGrabber.grabberDelegate = self;
	[newGrabber release];
	
}

-(void)actionRefresh:(id)sender {
	
	
	[self createGrabber];
	
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
	allBusinesses = [[NSMutableArray alloc] init];
	specificBusinesses = [[NSMutableArray alloc] init];
	appDelegate = [[UIApplication sharedApplication] delegate];
	categories = [[NSMutableArray alloc] init];
	
	//[self createGrabber];
		    
   //Aesthetics
	
	UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
	[background setImage:[UIImage imageNamed:@"canvas.jpg"]];
	[background setAlpha:0.30];
	self.tableView.backgroundView = background;
	[background release];
	//self.tableView.backgroundColor = [UIColor clearColor];
	
	
	self.title = @"Marketplace";
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] 
											  initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh 
											  target:self 
											  action:@selector(actionRefresh:)];  
	
	
	[super viewDidLoad];
	
    
    
}

-(void)sortListForCertainCategory {
	
	
	for (int y = 0; y < [allBusinesses count]; y++) {
		
		NSDictionary *info = [allBusinesses objectAtIndex:y];
		
		//NSLog(@"%@",[info valueForKey:@"category"]);
		NSLog(@"%@",selectedCategory);
		
		if ([[info valueForKey:@"category"] isEqualToString:selectedCategory]) {
			[specificBusinesses addObject:info];
		}
	}
	
	[self.tableView reloadData];
	
	
	
}

-(void)didGetData:(NSArray *)recievedData withType:(NSString *)thisType {
    
	for (int x = 0; x < [recievedData count]; x++) {
	
		NSDictionary *userInfo = [recievedData objectAtIndex:x];
		if (![categories containsObject:[userInfo valueForKey:@"category"]]) {
			[categories addObject:[userInfo valueForKey:@"category"]];
		}
				
		[allBusinesses addObject:userInfo];	
	}

	[self sortListForCertainCategory];
	
			
}




- (void)viewDidUnload
{
	[allBusinesses release];
	[specificBusinesses release];
	[currentCategory release];
	[selectedCategory release];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
	[self createGrabber];
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [specificBusinesses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
	
	
	
	NSDictionary *info = [specificBusinesses objectAtIndex:indexPath.row];
	NSString *labelString = [[NSString alloc] initWithFormat:@"%@ %@",
							 [info valueForKey:@"first_name"],
							 [info valueForKey:@"last_name"]];
	NSString *category = [[NSString alloc] initWithFormat:@"%@",[info valueForKey:@"category"]];
	[cell.textLabel setText:labelString];
	[cell.detailTextLabel setText:category];
	[labelString release];
	[category release];
    
    // Configure the cell...
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSDictionary *info = [specificBusinesses objectAtIndex:indexPath.row];
	
	NSString *labelString = [[NSString alloc] initWithFormat:@"%@ %@",
							 [info valueForKey:@"first_name"],
							 [info valueForKey:@"last_name"]];
	
	NSString *category = [[NSString alloc] initWithFormat:@"%@",[info valueForKey:@"category"]];
	NSString *description = [[NSString alloc] initWithFormat:@"%@",[info valueForKey:@"description"]];
	NSString *BID = [[NSString alloc] initWithFormat:@"%@",[info valueForKey:@"buid"]];

	BorrowerSingleViewController *singleBorrower = [[BorrowerSingleViewController alloc] initWithNibName:@"BorrowerSingleViewController" bundle:nil];
	
	[appDelegate.currentLender incrementProfilesNumber];
	
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:singleBorrower animated:YES];
	singleBorrower.nameLabel.text = labelString;
	singleBorrower.categoryLabel.text = category;
	singleBorrower.description.text = description;
	singleBorrower.borrowerID = [[NSString alloc] initWithString:BID];
	singleBorrower.howMuchTheyHave = [[info objectForKey:@"current_amount"] intValue];
	singleBorrower.howMuchTheyNeed = [[info objectForKey:@"sum"] intValue];
	singleBorrower.description.editable = NO;
	[labelString release];
	[category release];
	[singleBorrower release];
	[BID release];
	
     
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
