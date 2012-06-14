//
//  DecisionViewController.h
//  Microlending
//
//  Created by Cody Kolodziejzyk on 11/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MicrolendingAppDelegate.h"
#import "Grabber.h"

@class MicrolendingAppDelegate;


@interface DecisionViewController : UIViewController <GrabberDelegate> {
	
	IBOutlet UILabel *storyLabel;
	IBOutlet UILabel *decisionOneLabel;
	IBOutlet UILabel *decisionTwoLabel;
	NSMutableArray *choices;
	BOOL *shouldUpdate;
	
	MicrolendingAppDelegate *appDelegate;

	

}

@property (nonatomic, retain) UILabel *storyLabel;
@property (nonatomic, retain) UILabel *decisionOneLabel;
@property (nonatomic, retain) UILabel *decisionTwoLabel;
@property (nonatomic, retain) NSMutableArray *choices;


@end
