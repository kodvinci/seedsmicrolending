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
#import <QuartzCore/QuartzCore.h>
#import "SeedlingV2View.h"
//cocos2d stuff
#import "cocos2d.h"
#import "SeedlingLayer.h"

@interface OneFloorViewController : UIViewController <CCDirectorDelegate>
{
    NSMutableArray *myfurniture;
    NSMutableArray *myseedlings;
    IBOutlet UIButton *addFloor;
    MicrolendingAppDelegate *appDelegate;
    IBOutlet UILabel *coins;
    IBOutlet UILabel *leaves;
    IBOutlet UILabel *level;
    ViewFurniture *myFurnitureView;
    ViewFurniture *myFarmView;
    SeedlingV2View *mySeedlingView;
    CGPoint pt;
    float oldX, oldY;
    UITouch *myTouch;
    NSInteger xPosition;
    NSInteger yPosition;
    
    NSMutableArray *furnitureViews;
}

@property(nonatomic, retain) UIButton *addFloor;
@property(nonatomic, retain) UILabel *coins;
@property(nonatomic, retain) UILabel *leaves;
@property(nonatomic, retain) UILabel *level;
@property(nonatomic, assign) CGPoint pt;
@property(nonatomic, retain) UITouch *myTouch;
@property(nonatomic, retain) ViewFurniture *myFurnitureView;
@property(nonatomic, retain) ViewFurniture *myFarmView;
@property(nonatomic, retain) SeedlingV2View *mySeedlingView;
@property(nonatomic, retain) NSMutableArray *myfurniture;
@property(nonatomic, retain) NSMutableArray *myseedlings;
@property(nonatomic, retain) NSMutableArray *furnitureViews;

-(IBAction)buyFloor;
-(void)displayFurniture;

@end
