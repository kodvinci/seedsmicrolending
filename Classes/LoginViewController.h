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


@class MicrolendingAppDelegate;

@interface LoginViewController : UIViewController <GrabberDelegate, LenderDelegate> {
	
	IBOutlet UITextField *usernameField;
	IBOutlet UITextField *passwordField;
	IBOutlet UIActivityIndicatorView *spinner;
	NSString *tempUserID;
	MicrolendingAppDelegate *appDelegate;

}



@property (nonatomic, retain) UITextField *usernameField;
@property (nonatomic, retain) UITextField *passwordField;
@property (nonatomic, retain) NSString *tempUserID;
@property (nonatomic, retain) UIActivityIndicatorView *spinner;

-(IBAction)pressedLogin;

@end
