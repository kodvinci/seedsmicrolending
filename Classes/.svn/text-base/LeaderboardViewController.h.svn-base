//
//  LeaderboardViewController.h
//  Microlending
//
//  Created by Cody Kolodziejzyk on 11/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MicrolendingAppDelegate.h"
#import "Grabber.h"
#import "Transaction.h"

@class MicrolendingAppDelegate;


@interface LeaderboardViewController : UITableViewController <GrabberDelegate> {
	
	MicrolendingAppDelegate *appDelegate;
	NSMutableArray *allTransactions;
	Lender *currentLender;
	UISegmentedControl *topControl;


}

@property (nonatomic, retain) NSMutableArray *allTransactions;
@property (nonatomic, retain) Lender *currentLender;
@property (nonatomic, retain) UISegmentedControl *topControl;

@end
