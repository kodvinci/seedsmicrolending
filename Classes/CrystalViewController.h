//
//  CrystalViewController.h
//  Microlending
//
//  Created by guest user on 12/11/12.
//
//

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
