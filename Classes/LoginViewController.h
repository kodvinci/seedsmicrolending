//
//  LoginViewController.h
//  Microlending
//
//  Created by Leonard Ng'eno on 06/08/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Grabber.h"
#import "Lender.h"
#import "MicrolendingAppDelegate.h"
#import "GrabberTwo.h"
#import "LoginGrabber.h"
#import "KeychainItemWrapper.h"

@class MicrolendingAppDelegate;
@class Lender;
@class KeychainItemWrapper;

@interface LoginViewController : UIViewController <GrabberDelegate, LenderDelegate, UITextFieldDelegate, LoginGrabberDelegate, GrabberTwoDelegate> {
	
	IBOutlet UITextField *emailField;
//    KeychainItemWrapper *emailField;
	IBOutlet UITextField *passwordField;
//  KeychainItemWrapper *passwordField;
	IBOutlet UIActivityIndicatorView *spinner;
	NSString *tempUserID;
	MicrolendingAppDelegate *appDelegate;
    NSString *authentication_token;
    NSString *myuid;
    NSString *email;
    NSString *password;
}

@property (nonatomic, retain) UITextField *emailField;
@property (nonatomic, retain) UITextField *passwordField;
//@property (nonatomic, retain) KeychainItemWrapper *emailField;
//@property (nonatomic, retain) KeychainItemWrapper *passwordField;

@property (nonatomic, retain) NSString *authentication_token;
@property (nonatomic, retain) NSString *myuid;
@property (nonatomic, retain) NSString *tempUserID;
@property (nonatomic, retain) UIActivityIndicatorView *spinner;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *password;

-(IBAction)pressedLogin;
-(IBAction)pressedSignUp; 
-(IBAction)login; 

@end
