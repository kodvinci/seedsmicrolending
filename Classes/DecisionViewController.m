//
//  DecisionViewController.m
//  Microlending
//
//  Created by Cody Kolodziejzyk on 11/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DecisionViewController.h"
#import "Grabber.h"

@class Grabber;


@implementation DecisionViewController

@synthesize storyLabel, decisionOneLabel, decisionTwoLabel, choices;

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

-(void)viewDidAppear:(BOOL)animated {
	
	NSString *level = [[NSString alloc] initWithFormat:@"%i",appDelegate.currentLender.currentLevel + 1];
	
	
	if ([[[[appDelegate.tabBarController.tabBar items] objectAtIndex:0] badgeValue] isEqualToString:@"1"]) {
		
		storyLabel.text = @"";
		decisionOneLabel.text = @"";
		decisionTwoLabel.text = @"";
		
		[[[appDelegate.tabBarController.tabBar items] objectAtIndex:0] setBadgeValue:nil];

		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.7];
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
							   forView:self.view
								 cache:YES];
		[self.navigationItem.titleView	 setAlpha:1.00];
		
		[UIView commitAnimations];
	}
	
	Grabber *grabber = [[Grabber alloc] initWithParams:@"stories" 
													apiName:@"byId" 
												   argument:level 
													apiCall:@"GET" 
											  typeOfGrabber:@""];
	grabber.grabberDelegate = self;
	[grabber release];
	[level release];
	
	
	
	[super viewDidAppear:YES];	
	
}

-(void)didGetData:(NSArray *)recievedData withType:(NSString *)thisType {
	
	[choices removeAllObjects];	
	
	NSDictionary *newDic = [recievedData objectAtIndex:0];
	NSString *story = [[NSString alloc] initWithString:[newDic objectForKey:@"description"]];
	self.storyLabel.text = story;
	[story release];
	
	NSArray *decisions = [newDic objectForKey:@"decisions"];
	
	NSLog(@"this is how big decisions is: %i",[decisions count]);
	
	for (int x = 0; x < [decisions count]; x++) {
		NSDictionary *decisionsDic = [decisions objectAtIndex:x];
		[choices addObject:[decisionsDic objectForKey:@"choices"]];
	}
	
	self.decisionOneLabel.text = [choices objectAtIndex:0];
	self.decisionTwoLabel.text = [choices objectAtIndex:1];

	
	
	
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	storyLabel.lineBreakMode = UILineBreakModeWordWrap;
	storyLabel.numberOfLines = 0;
	
	decisionOneLabel.lineBreakMode = UILineBreakModeWordWrap;
	decisionOneLabel.numberOfLines = 0;
	
	decisionTwoLabel.lineBreakMode = UILineBreakModeWordWrap;
	decisionTwoLabel.numberOfLines = 0;
	
	
	appDelegate = [[UIApplication sharedApplication] delegate];
	choices = [[NSMutableArray alloc] init];


	
	self.navigationItem.title = @"Challenges";
	
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
	[storyLabel release];
	[decisionOneLabel release];
	[decisionTwoLabel release];
	[choices release];
    [super dealloc];
}


@end
