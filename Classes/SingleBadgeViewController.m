//
//  SingleBadgeViewController.m
//  Microlending
//
//  Created by Cody Kolodziejzyk on 11/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SingleBadgeViewController.h"


@implementation SingleBadgeViewController

@synthesize nameString, descriptionString, nameLabel, descriptionLabel;

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
	NSLog(@"name: %@",nameString);
	[super viewDidAppear:YES];	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	nameLabel.text = nameString;
	descriptionLabel.text = descriptionString;
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
	[nameString release];
	[nameLabel release];
	[descriptionString release];
	[descriptionLabel release];
    [super dealloc];
}


@end
