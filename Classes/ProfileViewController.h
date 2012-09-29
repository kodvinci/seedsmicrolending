//
//  ProfileViewController.h
//  Microlending
//
//  Created by Leonard Ngeno 09/22/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <QuartzCore/QuartzCore.h>
#import "Lender.h"
#import "Grabber.h"
#import "Logout.h"
#import "PayButtonViewController.h"

@class MicrolendingAppDelegate;
@class Lender;
@class PayButtonViewController;

@interface ProfileViewController : UIViewController <GrabberDelegate, LogoutDelegate, UIActionSheetDelegate, UISplitViewControllerDelegate, MFMessageComposeViewControllerDelegate, UINavigationControllerDelegate > {
	
	IBOutlet UIImageView *userImage;
	IBOutlet UILabel *roundedCorners;
	IBOutlet UILabel *roundedCorners2;
	IBOutlet UILabel *usernameLabel;
	IBOutlet UILabel *userClassLabel;
	IBOutlet UILabel *totalInvestmentsLabel;
	IBOutlet UILabel *totalXPLabel;
	IBOutlet UILabel *statusBar;
	IBOutlet UILabel *statusBar2;
	IBOutlet UILabel *creditLabel;
	IBOutlet UIButton *buttonOne;
	IBOutlet UIButton *buttonTwo;
	IBOutlet UIButton *buttonThree;
	IBOutlet UIButton *buttonFour;
    IBOutlet UIButton *buttonFive;
    IBOutlet UIButton *buttonSix;
    UITextField *nameField;
    NSDecimalNumber *thisAmount;

	Grabber *newGrabber;
	MicrolendingAppDelegate *appDelegate;
	Lender *currentUser;

}

@property (nonatomic, retain) NSDecimalNumber *thisAmount;
@property (nonatomic, retain) UIImageView *userImage;
@property (nonatomic, retain) UILabel *roundedCorners;
@property (nonatomic, retain) UILabel *roundedCorners2;
@property (nonatomic, retain) Lender *currentUser;
@property (nonatomic, retain) UILabel *usernameLabel;
@property (nonatomic, retain) UILabel *userClassLabel;
@property (nonatomic, retain) UILabel *totalInvestmentsLabel;
@property (nonatomic, retain) UILabel *totalXPLabel;
@property (nonatomic, retain) UILabel *statusBar;
@property (nonatomic, retain) UILabel *statusBar2;
@property (nonatomic, retain) UILabel *creditLabel;
@property (nonatomic, retain) UIButton *buttonOne;
@property (nonatomic, retain) UIButton *buttonTwo;
@property (nonatomic, retain) UIButton *buttonThree;
@property (nonatomic, retain) UIButton *buttonFour;
@property (nonatomic, retain) UIButton *buttonFive;
@property (nonatomic, retain) UIButton *buttonSix;
@property (nonatomic, retain) UITextField *nameField;

//-(IBAction)viewBadges;
-(IBAction)viewInvestments;
//-(IBAction)viewFriends;
-(IBAction)sendInAppSMS;
//-(IBAction)addExperience;
-(IBAction)addCredit;


@end
