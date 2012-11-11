//
//  TwoFloorsViewController.h
//  Microlending
//
//  Created by guest user on 11/9/12.
//
//

#import <UIKit/UIKit.h>
#import "MicrolendingAppDelegate.h"

@interface TwoFloorsViewController : UIViewController
{
    IBOutlet UIImageView *floor1;
    IBOutlet UIImageView *floor2;
    IBOutlet UIButton *addFloor;
    MicrolendingAppDelegate *appDelegate;
}

@property(nonatomic, retain) UIImageView *floor1;
@property(nonatomic, retain) UIImageView *floor2;
@property(nonatomic, retain) UIButton *addFloor;

-(IBAction)buyFloor;

@end
