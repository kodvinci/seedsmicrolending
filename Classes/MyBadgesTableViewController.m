//
//  MyBadgesModalViewController.m
//  Microlending
//
//  Created by Cody Kolodziejzyk on 11/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyBadgesTableViewController.h"
#import "MicrolendingAppDelegate.h"
#import "SBJson.h"
#import "SBJsonParser.h"
#import "Lender.h"
#import "Grabber.h"
#import "Badge.h"
#import "SingleBadgeViewController.h"

@class SingleBadgeViewController;
@class Grabber;
@class Badge;

@implementation MyBadgesTableViewController

@synthesize badges;


#pragma mark -
#pragma mark Initialization

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    NSLog (@"%@", @"MyBadges View DidLoad!!");
   
//    MicrolendingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate = [[UIApplication sharedApplication] delegate];
    
	badges = [[NSMutableArray alloc] initWithArray:appDelegate.currentLender.badges];
    NSLog(@"The content of badges is: %@",badges);

	NSLog(@"appdeli: %i",[appDelegate.currentLender.badges count]);
	numBadges = [appDelegate.currentLender.badges count];
    NSLog(@"The size of numBadges is %i",numBadges);

  //  appDelegate = [[UIApplication sharedApplication] delegate]; //deleted
    //addition
    self.navigationItem.title = @"My Badges";
    
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//UNCOMMENTED IT...

- (void)viewWillAppear:(BOOL)animated {
    NSLog (@"%@", @"MyBadges viewWillAppear Loaded!!");
    /*
    MicrolendingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    if (numBadges > 0) {
        for (int x=0; x < numBadges; x++) {
            Grabber *newGrabber = [[Grabber alloc] initWithParams:@"badges" apiName:@"byBid" argument:[badges objectAtIndex:x] apiCall:@"GET" typeOfGrabber:@"badge"];
  
    //        newGrabber.grabberDelegate = self;
        
            [newGrabber release];
            [[[appDelegate.tabBarController.tabBar items] objectAtIndex:1] setBadgeValue:nil];
        }
	}
    else {
        NSLog (@"%@", @"NOTHING!!");
    }
//	[[[appDelegate.tabBarController.tabBar items] objectAtIndex:1] setBadgeValue:nil];
    */
    [super viewWillAppear:animated];
} 


- (void)viewDidAppear:(BOOL)animated {
//    [badges removeAllObjects];
//	[self.tableView reloadData];
    
    [super viewDidAppear:animated];
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
//	NSLog(@"%i",[badges count]);
    return [badges count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    //STUFF GOES HERE
    [cell.imageView setImage:[UIImage imageNamed:@"badge.png"]];

 /*   if ([appDelegate.currentLender.badges containsObject:[[badges objectAtIndex:indexPath.row] getBadgeBID]]) {
        //cell.accessoryType = UITableViewCellAccessoryCheckmark;

	}   */
//    NSLog (@"%@", @"No badges!!");

//	[cell.textLabel setText:[[badges objectAtIndex:indexPath.row] getBadgeTitle]];
//	[cell.detailTextLabel setText:[[badges objectAtIndex:indexPath.row] getBadgeDescription]];
    
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
	[badges release];
    [super dealloc];
}


@end
