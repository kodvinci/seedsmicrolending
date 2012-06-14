//
//  BorrowerSingleViewController.h
//  Microlending
//
//  Created by guest user on 10/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMessageComposeViewController.h>
#import "Borrower.h"

@class Borrower;
@class MicrolendingAppDelegate;

@interface BorrowerSingleViewController : UIViewController <UIActionSheetDelegate, 
UIAlertViewDelegate, MFMessageComposeViewControllerDelegate> {
    
    IBOutlet UIImageView *borrowerImage;
	IBOutlet UILabel *nameLabel;
	IBOutlet UILabel *categoryLabel;
	IBOutlet UILabel *loansRecievedLabel;
	IBOutlet UILabel *statusBar;
	IBOutlet UILabel *amountNeededLabel;
	IBOutlet UILabel *amountReceivedLabel;
	IBOutlet UITextView *description;
	IBOutlet UIButton *investButton;
	NSString *borrowerID;
	NSInteger howMuchTheyHave;
	NSInteger howMuchTheyNeed;
	UITextField *nameField;
	MicrolendingAppDelegate *appDelegate;
}

@property (nonatomic, retain) UIImageView *borrowerImage;
@property (nonatomic, retain) UILabel *nameLabel;
@property (nonatomic, retain) UILabel *categoryLabel;
@property (nonatomic, retain) UILabel *loansRecievedLabel;
@property (nonatomic, retain) UILabel *statusBar;
@property (nonatomic, retain) UILabel *amountNeededLabel;
@property (nonatomic, retain) UILabel *amountReceivedLabel;
@property (nonatomic, retain) UITextView *description;
@property (nonatomic, retain) UIButton *investButton;
@property (nonatomic, retain) NSString *borrowerID;
@property (nonatomic, retain) UITextField *nameField;
@property (nonatomic, assign) NSInteger howMuchTheyHave;
@property (nonatomic, assign) NSInteger howMuchTheyNeed;



-(IBAction)pressedInvest;



@end
