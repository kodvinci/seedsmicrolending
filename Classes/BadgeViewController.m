//
//  BadgeViewController.m
//  Microlending
//
//  Created by Cody Kolodziejzyk on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BadgeViewController.h"
#import "Grabber.h"
#import "Badge.h"
#import "MicrolendingAppDelegate.h"
#import "SingleBadgeViewController.h"


@class Badge;
@class Grabber;
@class SingleBadgeViewController;

@implementation BadgeViewController

@synthesize badges;


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
	
	spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
	[spinner hidesWhenStopped];
	[self.view addSubview:spinner];
	[spinner startAnimating];
	
	badges = [[NSMutableArray alloc] init];
	appDelegate = [[UIApplication sharedApplication] delegate];

	
	self.title = @"Badges";
	
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
											  initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
											  target:self
											  action:@selector(actionRefresh:)];

	
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(void)actionRefresh:(id)sender {
	
	
	[self viewWillAppear:YES];
	
}


- (void)viewWillAppear:(BOOL)animated {
    [badges removeAllObjects];
	Grabber *newGrabber = [[Grabber alloc] initWithParams:@"badges" apiName:@"" argument:@"" apiCall:@"GET" typeOfGrabber:@""];
    newGrabber.grabberDelegate = self;
	[newGrabber release];
	
	
	[[[appDelegate.tabBarController.tabBar items] objectAtIndex:1] setBadgeValue:nil];
    [super viewWillAppear:animated];
}


//UNCOMMENTED THIS SECTION! 
//it seems to have fixed the problem of the same badges duplicating themselves. but now it takes awhile to reload the badges...does it reload the information from the server??
- (void)viewDidAppear:(BOOL)animated {
	
	//[badges removeAllObjects];
	[self.tableView reloadData];
	
		
    [super viewDidAppear:animated];
}

-(void)didGetData:(NSArray *)recievedData withType:(NSString *)thisType {
	
	
	[spinner stopAnimating];
	
	for (int x = 0; x < [recievedData count]; x++) {
		
		NSDictionary *newDic = [recievedData objectAtIndex:x];
		NSString *titleString = [[NSString alloc] initWithString:[newDic objectForKey:@"name"]];
		NSString *descriptionString = [[NSString alloc] initWithString:[newDic objectForKey:@"description"]];
		NSString *BIDString = [[NSString alloc] initWithFormat:@"%@",[newDic objectForKey:@"bid"]];
		Badge *newBadge = [[Badge alloc] initWithParams:titleString badgeDescription:descriptionString badgeID:BIDString];
		[badges addObject:newBadge];
		
		[titleString release];
		[descriptionString release];
		[BIDString release];
		[newBadge release];
		
	}
	
	//NSLog(@"%i",[badges count]);
	//NSLog(@"Reloading tableview data");
	[self.tableView reloadData];
	
	
}


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
    return [badges count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
	if ([[[badges objectAtIndex:indexPath.row] getBadgeBID] isEqualToString:@"1"]) {
        [cell.imageView setImage:[UIImage imageNamed:@"green.png"]];
        NSLog(@"bid is: %@", [[badges objectAtIndex:indexPath.row] getBadgeBID]);
    }
    if ([[[badges objectAtIndex:indexPath.row] getBadgeBID] isEqualToString:@"2"]) {
        [cell.imageView setImage:[UIImage imageNamed:@"red.png"]];
        NSLog(@"bid is: %@", [[badges objectAtIndex:indexPath.row] getBadgeBID]);
    }
    if ([[[badges objectAtIndex:indexPath.row] getBadgeBID] isEqualToString:@"3"]) {
        [cell.imageView setImage:[UIImage imageNamed:@"yellow.png"]];
        NSLog(@"bid is: %@", [[badges objectAtIndex:indexPath.row] getBadgeBID]);
    }
    if ([[[badges objectAtIndex:indexPath.row] getBadgeBID] isEqualToString:@"4"]) {
        [cell.imageView setImage:[UIImage imageNamed:@"orange.png"]];
        NSLog(@"bid is: %@", [[badges objectAtIndex:indexPath.row] getBadgeBID]);
    }
    if ([[[badges objectAtIndex:indexPath.row] getBadgeBID] isEqualToString:@"5"] ) {
        [cell.imageView setImage:[UIImage imageNamed:@"master.png"]];
        NSLog(@"bid is: %@", [[badges objectAtIndex:indexPath.row] getBadgeBID]);
    }
		
	//if ([appDelegate.currentLender.badges containsObject:[[badges objectAtIndex:indexPath.row] getBadgeBID]]) {
      //  NSLog(@"bid is: %@", [[badges objectAtIndex:indexPath.row] getBadgeBID]);
		//cell.accessoryType = UITableViewCellAccessoryCheckmark;
	//}
	
	[cell.textLabel setText:[[badges objectAtIndex:indexPath.row] getBadgeTitle]];
	[cell.detailTextLabel setText:[[badges objectAtIndex:indexPath.row] getBadgeDescription]];
	[cell.imageView setImage:[[badges objectAtIndex:indexPath.row] getBadgeImage]];
    
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
	
	SingleBadgeViewController *singleBadge = [[SingleBadgeViewController alloc] init];
	
	singleBadge.nameString = [[NSString alloc] initWithString:[[badges objectAtIndex:indexPath.row] getBadgeTitle]];
	singleBadge.descriptionString = [[NSString alloc] initWithString:[[badges objectAtIndex:indexPath.row] getBadgeDescription]];

	
	[self.navigationController pushViewController:singleBadge animated:YES];

	[singleBadge release];

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
    [super viewDidUnload];
}


- (void)dealloc {
	[spinner release];
	[badges release];
    [super dealloc];
}


@end

