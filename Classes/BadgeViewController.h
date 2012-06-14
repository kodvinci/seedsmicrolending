//
//  BadgeViewController.h
//  Microlending
//
//  Created by Cody Kolodziejzyk on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Grabber.h"
#import "MicrolendingAppDelegate.h"

@class MicrolendingAppDelegate;


@interface BadgeViewController : UITableViewController <GrabberDelegate> {
	
	NSMutableArray *badges;
	MicrolendingAppDelegate *appDelegate;
	UIActivityIndicatorView *spinner;

}

@property (nonatomic, retain) NSMutableArray *badges;

@end
