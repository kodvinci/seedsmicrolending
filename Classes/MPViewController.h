//
//  MPViewController.h
//  Microlending
//
//  Created by Sam Baek on 10/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Grabber.h"

@class MicrolendingAppDelegate;

@interface MPViewController : UITableViewController <GrabberDelegate, UIActionSheetDelegate> {
    
    NSString *currentCategory;
	NSMutableArray *categories;
	NSDictionary *businesses;
	NSMutableArray *allBusinesses;
	NSMutableArray *specificBusinesses;
	MicrolendingAppDelegate *appDelegate;
	NSString *selectedCategory;

}

@property (nonatomic, retain) NSString *currentCategory;
@property (nonatomic, retain) NSMutableArray *allBusinesses;
@property (nonatomic, retain) NSMutableArray *specificBusinesses;
@property (nonatomic, retain) NSString *selectedCategory;


@end
