//
//  OneFloorViewController.h
//  Microlending
//
//  Created by guest user on 11/9/12.
//
//

#import <UIKit/UIKit.h>
#import "MicrolendingAppDelegate.h"
#import "CitadelViewController.h"

@interface OneFloorViewController : UIViewController
{
    IBOutlet UIButton *addFloor;
    MicrolendingAppDelegate *appDelegate;
    IBOutlet UILabel *coins;
    IBOutlet UILabel *leaves;
    IBOutlet UILabel *level;
    
}

@property(nonatomic, retain) UIButton *addFloor;
@property(nonatomic, retain) UILabel *coins;
@property(nonatomic, retain) UILabel *leaves;
@property(nonatomic, retain) UILabel *level;

-(IBAction)buyFloor;

@end
