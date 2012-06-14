//
//  MPCategoryPage.m
//  Microlending
//
//  Created by Cody Kolodziejzyk on 11/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MPCategoryPage.h"
#import "MPViewController.h"
#import "MicrolendingAppDelegate.h"

@class MPViewController;
@class MicrolendingAppDelegate;


@implementation MPCategoryPage

@synthesize scrollView;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

-(IBAction)pressedCake:(id)sender {
	
	//MicrolendingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	//[appDelegate.currentLender incrementCategoriesNumber];
	
	MPViewController *newMP = [[MPViewController alloc] init];
	newMP.selectedCategory = [[NSString alloc] initWithString:@"Cake"];
	[self.navigationController pushViewController:newMP animated:YES];
	[newMP release];
	
	
	
}

-(IBAction)pressedFish:(id)sender {
	
	//MicrolendingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	//[appDelegate.currentLender incrementCategoriesNumber];
	
	MPViewController *newMP = [[MPViewController alloc] init];
	newMP.selectedCategory = [[NSString alloc] initWithString:@"Fish"];
	[self.navigationController pushViewController:newMP animated:YES];
	[newMP release];
	
	
}


-(IBAction)pressedSelf:(id)sender {
	
	//MicrolendingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	//[appDelegate.currentLender incrementCategoriesNumber];
	
	MPViewController *newMP = [[MPViewController alloc] init];
	newMP.selectedCategory = [[NSString alloc] initWithString:@"Self-Help"];
	[self.navigationController pushViewController:newMP animated:YES];
	[newMP release];
	
	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	self.navigationItem.title = @"Choose a Category";
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[scrollView release];
    [super dealloc];
}


@end
