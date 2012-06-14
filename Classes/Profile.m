//
//  Profile.m
//  Microlending
//
//  Created by Cody Kolodziejzyk on 10/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Profile.h"
#import "SBJson.h"
#import "SBJsonParser.h"
#import "Friends.h"


@implementation Profile

@synthesize username;
@synthesize userclass;
@synthesize badges;
@synthesize investments;
@synthesize userNumber;


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

- (void)getData {
	
	
	NSURL *jsonurl = [NSURL URLWithString:@"http://10.180.140.234:3000/profiles.json"];
	
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL: jsonurl];
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	[connection release];
	[request release];
	
	
}

-(void)pressedFriends:(id)sender {
	
	Friends *friendsController = [[Friends alloc] initWithNibName:@"Friends" bundle:nil];
	[self.navigationController pushViewController:friendsController animated:YES];
	[friendsController release];
	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	self.navigationItem.title = @"Profile";
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] 
											   initWithTitle:@"Friends" 
											   style:UIBarButtonItemStyleBordered 
											   target:self action:@selector(pressedFriends:)] autorelease]; 
	
	[self getData];
	
    [super viewDidLoad];
}



- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data

{
	
	SBJsonParser *parser = [[SBJsonParser alloc] init];
	
	
	
	// Store incoming data into a string
	
	
	
	
	// Create a dictionary from the JSON string
	NSArray *results = [parser objectWithData:data];
	NSDictionary *userInfo = [results objectAtIndex:userNumber];
	[self.username setText:[userInfo objectForKey:@"username"]];
	[self.userclass setText:[userInfo objectForKey:@"class_type"]];
	[self.badges setText:[userInfo objectForKey:@"badges"]];
	//[self.investments setText:[userInfo objectForKey:@"investment_count"]];
	//NSDictionary *test = [[results objectAtIndex:1] JSONValue];
	
	
	
	// Build an array from the dictionary for easy access to each entry
	//NSArray *photos = [[results objectForKey:@"photos"] objectForKey:@"photo"];
	
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
	[username release];
	[userclass release];
	[badges release];
	[investments release];
    [super dealloc];
}


@end
