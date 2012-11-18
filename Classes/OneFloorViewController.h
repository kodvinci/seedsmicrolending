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
#import "ViewFurniture.h"

//cocos2d stuff
#import "cocos2d.h"
#import "SeedlingLayer.h"

@interface OneFloorViewController : UIViewController <CCDirectorDelegate>
{
    IBOutlet UIButton *addFloor;
    MicrolendingAppDelegate *appDelegate;
    IBOutlet UILabel *coins;
    IBOutlet UILabel *leaves;
    IBOutlet UILabel *level;
    ViewFurniture *myFurnitureView;
    
    //cocos2d
    NSMutableArray *_seedlings;
}

@property(nonatomic, retain) UIButton *addFloor;
@property(nonatomic, retain) UILabel *coins;
@property(nonatomic, retain) UILabel *leaves;
@property(nonatomic, retain) UILabel *level;
@property(nonatomic, retain) ViewFurniture *myFurnitureView;

-(IBAction)buyFloor;
-(void)displayFurniture;

@end
