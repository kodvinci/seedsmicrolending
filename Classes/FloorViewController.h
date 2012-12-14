//
//  FloorViewController.h
//  Microlending
//
//  Created by Leonard Ng'eno on 11/9/12.
//
//


#import <UIKit/UIKit.h>
#import "MicrolendingAppDelegate.h"
#import "CitadelViewController.h"
#import "ViewFurniture.h"
#import <QuartzCore/QuartzCore.h>
#import "SeedlingV2View.h"
#import "SeedlingDataViewController.h"
#import "ScrollSubClass.h"
#import "Citadel.h"

@interface FloorViewController : UIViewController <UIScrollViewDelegate>
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
    CGPoint pos;
    NSTimer *myTime;
    float oldX, oldY;
    UITouch *myTouch;
    NSInteger xPosition;
    NSInteger yPosition;
    
    NSMutableArray *furnitureViews;
    
    int furniturePos;
    UIAlertView *harvestingAlert;
    
    //scrollview
    IBOutlet ScrollSubClass *scrollView;
    NSString *nibFileName;
    UIView *citadelView;
    
    //Gestures
    UIPanGestureRecognizer *panRecognizer;
    
    //Floor where the seedling is dragged to
    BOOL floorOne;
    BOOL floorTwo;
    BOOL floorThree;
    BOOL floorFour;
    BOOL floorFive;
    BOOL floorSix;
    BOOL floorSeven;
    BOOL floorEight;
    BOOL floorNine;
    BOOL floorTen;
    
    //A new floor is currently growing
 //   BOOL floorGrowing;
}

@property(nonatomic, retain) UIButton *addFloor;
@property(nonatomic, retain) UILabel *coins;
@property(nonatomic, retain) UILabel *leaves;
@property(nonatomic, retain) UILabel *level;
@property(nonatomic, assign) CGPoint pt;
@property(nonatomic, assign) CGPoint pos;
@property(nonatomic, retain) UITouch *myTouch;
@property(nonatomic, retain) NSTimer *myTime;
@property(nonatomic, retain) ViewFurniture *myFurnitureView;
@property(nonatomic, retain) ViewFurniture *myFarmView;
@property(nonatomic, retain) SeedlingV2View *mySeedlingView;
@property(nonatomic, retain) NSMutableArray *myfurniture;
@property(nonatomic, retain) NSMutableArray *myseedlings;
@property(nonatomic, retain) NSMutableArray *furnitureViews;

@property(nonatomic, strong) ScrollSubClass *scrollView;
@property(nonatomic, retain) NSString *nibFileName;
@property (nonatomic, strong) UIView *citadelView;
@property (nonatomic, strong) UIPanGestureRecognizer *panRecognizer;
//@property(nonatomic, assign) BOOL floorGrowing;

-(IBAction)buyFloor;
-(void)displayFurniture;

@end
