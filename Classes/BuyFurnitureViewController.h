//
//  BuyFurnitureViewController.h
//  Microlending
//
//  Created by guest user on 10/31/12.
//
//

#import <UIKit/UIKit.h>
#import "MicrolendingAppDelegate.h"
#import "FurnitureViewController.h"

@interface BuyFurnitureViewController : UITableViewController
{
    NSMutableArray *furniture;
	MicrolendingAppDelegate *appDelegate;
    NSString *furnitureName;
}

@property(nonatomic, retain) NSMutableArray *furniture;
@property(nonatomic, retain) NSString *furnitureName;

@end
