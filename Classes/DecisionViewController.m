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

@synthesize storyLabel, decisionOneLabel, decisionTwoLabel, choices; //, level;

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
    
	NSLog (@"%@", @"Decision View appeared!");
	NSString *level = [[NSString alloc] initWithFormat:@"%i", appDelegate.currentLender.currentLevel + 3];
//    level = [[NSString alloc] initWithFormat:@"%@",appDelegate.currentLender.currentLevel + 3]; //appDelegate.currentLender.currentLevel + 3];

	NSLog (@"%@\n", level);
    NSLog(@"%@\n", [[[appDelegate.tabBarController.tabBar items]objectAtIndex:2]badgeValue]);
	
//	if ([[[[appDelegate.tabBarController.tabBar items] objectAtIndex:1] badgeValue] isEqualToString:@"1"]) {
        
		NSLog (@"%@", @"we are IN!!");
        
		storyLabel.text = @"";
		decisionOneLabel.text = @"";
		decisionTwoLabel.text = @"";
		
		[[[appDelegate.tabBarController.tabBar items] objectAtIndex:2] setBadgeValue:nil];

		
		[UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.7];
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
							   forView:self.view
								 cache:YES];
		[self.navigationItem.titleView	 setAlpha:1.00];
		
		[UIView commitAnimations];
//	}
	
    NSLog (@"%@", @"We're out!!");

  //  NSString *level = 1;
    
	Grabber *grabber = [[Grabber alloc] initWithParams:@"stories" apiName:@"byId" argument:level apiCall:@"GET" typeOfGrabber:@""];
    
	grabber.grabberDelegate = self;
	[grabber release];
	[level release];
	
	
	
	[super viewDidAppear:YES];	
	
}

-(void)didGetData:(NSArray *) recievedData withType:(NSString *)thisType {
//	NSLog (@"%@", @"Did we get any data...");
	[choices removeAllObjects];	
    NSLog(@"ReceivedData is: %@",recievedData);
 
  //  NSDictionary *newDic = [recievedData objectAtIndex: 0];
    
//    NSDictionary *newDic = [recievedData objectForKey:@"description"];
    
//	NSString *story = [[NSString alloc] initWithString:[newDic objectForKey:@"description"]];//objectForKey
    
    NSString *story = [[NSString alloc] initWithString:[recievedData objectForKey:@"description"]];
	self.storyLabel.text = story;
	[story release];
	
	NSInteger decision1 = [recievedData objectForKey:@"decision_id_1"];
    NSInteger decision2 = [recievedData objectForKey:@"decision_id_2"];
    self.decisionOneLabel.tag = decision1;
    self.decisionTwoLabel.tag = decision2;

    NSLog(@"decision 1 is: %@",decision1);
    NSLog(@"decision 2 is: %@",decision2);

//    NSString *decision1 = [[NSString alloc] initWithString:[recievedData objectForKey:@"decision_id_1"]];
//    NSString *decision2 = [[NSString alloc] initWithString:[recievedData objectForKey:@"decision_id_2"]];
//    self.decisionOneLabel.tag = *(decision1);
//    self.decisionTwoLabel.tag = *(decision2);
    
//    [decision1 release];
//    [decision2 release];
//	NSLog(@"this is how big decisions is: %i",[decisions count]);
	
//    if ([decisions count] == 0) {
//        NSLog (@"%@", @"We've got no decisions!");
//    }
//    else {
 //       for (int x = 0; x < [decisions count]; x++) {
 //           NSDictionary *decisionsDic = [decisions objectAtIndex:x];
 //           [choices addObject:[decisionsDic objectForKey:@"choices"]];
 //       }
	
 //       self.decisionOneLabel.text = [choices objectAtIndex:0];
 //       self.decisionTwoLabel.text = [choices objectAtIndex:1];
//    }
	
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
//    [level release];
//    [shouldUpdate release];
    [super dealloc];
}


@end
