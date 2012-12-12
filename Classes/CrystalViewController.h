//
//  CrystalViewController.h
//  Microlending
//
//  Created by Leonard Ng'eno on 12/11/12.
//
//

/*
 This class displays crystalls - earned by making loans to various types of businesses, and the loving heart - required in order to bring a new seedling into the world.
 */

#import <UIKit/UIKit.h>
#import "MicrolendingAppDelegate.h"

@interface CrystalViewController : UITableViewController
{
    NSMutableArray *crystals;
	MicrolendingAppDelegate *appDelegate;
    NSString *red;
}

@property(nonatomic, retain) NSMutableArray *crystals;
@property(nonatomic, retain) MicrolendingAppDelegate *appDelegate;

@end
