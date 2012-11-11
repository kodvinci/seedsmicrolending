//
//  ThreeFloorsViewController.h
//  Microlending
//
//  Created by guest user on 11/9/12.
//
//

#import <UIKit/UIKit.h>
#import "MicrolendingAppDelegate.h"

@interface ThreeFloorsViewController : UIViewController
{
    IBOutlet UIButton *addFloor;
    MicrolendingAppDelegate *appDelegate;
}

@property(nonatomic, retain) UIButton *addFloor;

-(IBAction)buyFloor;

@end
