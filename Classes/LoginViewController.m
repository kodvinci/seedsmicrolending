//
//  LoginViewController.m
//  Microlending
//
//  Created by Leonard Ngeno on 06/08/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "MicrolendingAppDelegate.h"
#import "SBJson.h"
#import "SBJsonParser.h"
#import "Grabber.h"
#import "Lender.h"
#import "Badge.h"
//#import "ProfileViewController.h" 


@class MicrolendingAppDelegate;
@class Grabber;
@class Badge;


@implementation LoginViewController

@synthesize usernameField;
@synthesize passwordField;
@synthesize tempUserID;
@synthesize spinner;



-(void)userWasFound:(NSArray *)dictionaries {

	NSDictionary *userInfo = [dictionaries objectAtIndex:0];
		
	Lender *newLender = [[Lender alloc] initWithUserID:[userInfo valueForKey:@"luid"]]; 
	newLender.lenderDelegate = self;
	[newLender initializeEverythingFromServer];
//	what happens next?
	NSLog(@"The content is%@",userInfo);
   //addition 
 //   appDelegate.currentLender = newLender;
 //   [self.parentViewController dismissModalViewControllerAnimated:YES];
    
    
}

//This is called by the Lender Delegate to make sure the everything is finished
//loading from the database before the login screen is dismissed

-(void)didFinishSettingUpLender:(BOOL)result withLender:(id)thisLender {
	
    NSLog(result ? @"Yes" : @"No");
	[spinner stopAnimating];
    
    NSLog(result ? @"Yes" : @"No");
	
	if (result) {
	
		appDelegate.currentLender = thisLender;
		[self.parentViewController dismissModalViewControllerAnimated:YES];
		
	} else {
		
		UIAlertView *warningMessage;
		warningMessage = [[UIAlertView alloc] initWithTitle:@"Error setting up user" 
													message:nil 
												   delegate:nil cancelButtonTitle:@"Ok" 
										  otherButtonTitles:nil];
		[warningMessage show];
		[warningMessage release];
	}
	
	
}

//If the user was not found, create a warning message		

-(void)userWasNotFound {
	
	[spinner stopAnimating];

	
	UIAlertView *warningMessage;
	warningMessage = [[UIAlertView alloc] initWithTitle:@"Not Found" 
												message:@"Enter in a different uid or sign up" 
											   delegate:nil cancelButtonTitle:@"Ok" 
									  otherButtonTitles:nil];
	[warningMessage show];
	[warningMessage release];
	
	
	
}

-(IBAction)pressedLogin {
	
	[spinner startAnimating];
	
	// Creates a new Grabber with the specified parameters and then sets the grabber delegate to itself

    Grabber *newGrabber = [[Grabber alloc] initWithParams:@"lenders" 
												  apiName:@"byUid" 
                                                argument:usernameField.text 
												  apiCall:@"GET" 
											typeOfGrabber:@"user"];

    
    newGrabber.grabberDelegate = self;
	[newGrabber release];
	
	
}

// This is the delegate method that is automatically 
// called when the grabber recieves the data from the server.
// Do what you want with the resulting array of NSDictionaries

-(void)didGetData:(NSArray *)recievedData withType:(NSString *)thisType {
		
if ([thisType isEqualToString:@"user"]) {
	if ([recievedData count] == 0) {
		[self userWasNotFound];
	} else {
		[self userWasFound:recievedData];
	}
}	
	
}



// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
//REMOVED START COMMENT
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
//REMOVED END COMMENT
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[spinner stopAnimating];
	appDelegate = [[UIApplication sharedApplication] delegate];

	[usernameField becomeFirstResponder];
  //  [self ProfileViewController];
    [super viewDidLoad];
}

/*
//REMOVED START COMMENT
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
//REMOVED END COMMENT
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [usernameField release];
    usernameField = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[tempUserID release];
	[usernameField release];
	[passwordField release];
	[spinner release];
    [usernameField release];
    [super dealloc];
}


@end

