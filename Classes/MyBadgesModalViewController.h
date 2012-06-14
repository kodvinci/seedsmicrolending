//
//  MyBadgesModalViewController.h
//  Microlending
//
//  Created by Cody Kolodziejzyk on 11/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MicrolendingAppDelegate.h"

@class MicrolendingAppDelegate;


@interface MyBadgesModalViewController : UITableViewController {
	
	NSMutableArray *badges;
	MicrolendingAppDelegate *appDelegate;


}

@end
