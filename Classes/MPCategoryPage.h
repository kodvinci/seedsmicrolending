//
//  MPCategoryPage.h
//  Microlending
//
//  Created by Leonard Ng'eno on 09/25/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "MicrolendingAppDelegate.h"
#import "PayButtonViewController.h"

@class PayButtonViewController;

@interface MPCategoryPage : UIViewController <UIActionSheetDelegate, UINavigationControllerDelegate, UISplitViewControllerDelegate> {

	IBOutlet UIScrollView *scrollView;
    NSDecimalNumber *thisAmount;
    MicrolendingAppDelegate *appDelegate;
    
}

@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) NSDecimalNumber *thisAmount;

-(IBAction)pressedAgriculture;
-(IBAction)pressedHealth;
-(IBAction)pressedHandmade;
-(IBAction)pressedZaBiashara;
- (IBAction)pressedOthers;

@end
