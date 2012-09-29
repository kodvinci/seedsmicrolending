//
//  LoginViewController.m
//  Microlending
//
//  Created by Leonard Ngeno on 06/08/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "SBJson.h"
#import "SBJsonParser.h"
#import "Grabber.h"
#import "Lender.h"
#import "Badge.h"
#import "LoginGrabber.h"
#import "GrabberTwo.h"
#import "KeychainItemWrapper.h"

/*
enum {
	kUsernameSection = 0,
	kPasswordSection
}; */

// Defined UI constants.
// Tag table view cells that contain a text field to support secure text entry.
//static NSInteger kPasswordTag	= 2;

@class Grabber;
@class Badge;
@class LoginGrabber;
@class GrabberTwo;
@class KeychainItemWrapper;

@implementation LoginViewController

@synthesize emailField;
@synthesize passwordField;
@synthesize tempUserID;
@synthesize spinner;
@synthesize authentication_token;
@synthesize myuid;
@synthesize email;
@synthesize password;


-(void)userWasFound:(NSArray *)dictionaries {
    NSLog (@"%@", @"in user was found");

  	Lender *newLender = [[Lender alloc] initWithUserID:[dictionaries valueForKey:@"id"]];
    NSLog(@"userID is: %@", [dictionaries valueForKey:@"id"]);
	newLender.lenderDelegate = self;
    
    appDelegate.totalXP = [dictionaries valueForKey:@"exp"];
    appDelegate.email =[dictionaries valueForKey:@"email"];
    appDelegate.uid = [dictionaries valueForKey:@"id"];
    appDelegate.credit = [[dictionaries valueForKey:@"credit"] intValue];
    appDelegate.userclass = [dictionaries valueForKey:@"class_type"];
    
    NSLog(@"EMAIL is: %@", [dictionaries valueForKey:@"email"]);

    [newLender initializeEverythingFromServer];
//    [newLender initializeExistingBadges];
//    [newLender initializeExistingBorrowers];
//    [newLender initializeExistingTransactions];

}

//This is called by the Lender Delegate to make sure the everything is finished
//loading from the database before the login screen is dismissed

-(void)didFinishSettingUpLender:(BOOL)result withLender:(id)thisLender {
    NSLog(result ? @"Yes" : @"No");
	[spinner stopAnimating];
    
    NSLog(result ? @"Yes" : @"No");
	
	if (result) {
	
		appDelegate.currentLender = thisLender;
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];

//		[self.presentingViewController dismissModalViewControllerAnimated:YES];
		
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
												message:@"Enter in a different email/password or sign up" 
											   delegate:nil cancelButtonTitle:@"Ok" 
									  otherButtonTitles:nil];
	[warningMessage show];
	[warningMessage release];
	
	
	
}

-(IBAction)login
{
    [spinner startAnimating];
    
    KeychainItemWrapper *keychainItem1 = [[KeychainItemWrapper alloc] initWithIdentifier:@"SeedsLogin" accessGroup:nil];
    
/*    if ([keychainItem1 objectForKey:kSecValueData]!=nil)
    {
        email = [keychainItem1 objectForKey:kSecAttrAccount];
        password = [keychainItem1 objectForKey:kSecValueData];
    } */
//    else
 //   {
        [keychainItem1 setObject:passwordField.text forKey:kSecValueData];
        [keychainItem1 setObject:emailField.text forKey:kSecAttrAccount];
        
        email = [keychainItem1 objectForKey:kSecAttrAccount];
        password = [keychainItem1 objectForKey:kSecValueData];
//    }
//    [keychainItem resetKeychainItem];
    NSLog(@"The email is: %@", email);
    NSLog(@"The password is: %@", password); 

    LoginGrabber *newGrabber = [[LoginGrabber alloc] initWithParams:@"users" apiName:@"login" argument1:email argument2:password apiCall:@"POST" typeOfGrabber:@"user"];
    
    newGrabber.logingrabberDelegate = self;
	[newGrabber release];

    
}

-(IBAction)pressedSignUp {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://seedsmicroloans.herokuapp.com/users/sign_up"]];
}

// This is the delegate method that is automatically 
// called when the grabber recieves the data from the server.
// Do what you want with the resulting array of NSDictionaries

-(void)didGetUser:(NSArray *)recievedData withType:(NSString *)thisType {
    
    if ([thisType isEqualToString:@"user"]) {
        if ([recievedData count] == 0) {
            [self userWasNotFound];
        } else {

            self.authentication_token = [recievedData objectForKey:@"token"];
            
            NSLog(@"The authentication token is: %@", authentication_token);
            NSLog(@"receivedData from didGetUser is %@", recievedData);
            
            GrabberTwo *newGrabber = [[GrabberTwo alloc] initWithParams:@"users" 
                                                          apiName:@"byAuthToken" 
                                                         argument:authentication_token
                                                          apiCall:@"GET" 
                                                    typeOfGrabber:@"user"];
            
            
            newGrabber.grabbertwoDelegate = self;
            [newGrabber release];

        }
    }	
	
}

-(void)didGetUID:(NSArray *)recievedData withType:(NSString *)thisType {
    NSLog (@"%@", @"Got to LoginViewController didGetUID!");
    NSLog(@"recievedUID is: %@", recievedData);
    if ([thisType isEqualToString:@"user"]) {
        if ([recievedData count] == 0) {
            [self userWasNotFound];
        } else {
            
            self.myuid = [recievedData objectForKey:@"id"];

            [self userWasFound:recievedData];
/*
            
            NSLog (@"%@", @"calling anotherGrabber!");

            Grabber *anotherGrabber = [[Grabber alloc] initWithParams:@"users"
                                                              apiName:@"show" 
                                                             argument:myuid
                                                              apiCall:@"GET" 
                                                        typeOfGrabber:@"user"];
            
            
            anotherGrabber.grabberDelegate = self;
            [anotherGrabber release];
*/            
        }
    }	
	
}

-(void)didGetData:(NSArray *)recievedData withType:(NSString *)thisType {
    NSLog (@"%@", @"Got to LoginViewController didGetData!");
    NSLog(@"recievedData is: %@", recievedData);
    if ([thisType isEqualToString:@"user"]) {
        if ([recievedData count] == 0) {
            [self userWasNotFound];
        } else {
            [self userWasFound:recievedData];
            
        }
    }
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    NSLog (@"%@", @"Login view loaded!");

	[spinner stopAnimating];
	appDelegate = [[UIApplication sharedApplication] delegate];
    [emailField becomeFirstResponder];
    [passwordField becomeFirstResponder];
    [super viewDidLoad];
}
/*
-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

} */

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
    NSLog (@"%@", @"At viewDidUnload!");
    [emailField release];
    emailField = nil;
    [passwordField release];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



- (void)dealloc {
	[tempUserID release];
	[emailField release];
	[passwordField release];
	[spinner release];
    [authentication_token release];
    [myuid release];
    [email release];
    [password release];
    
    [super dealloc];
}

@end

