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
    
    //temp variables
    NSString *des1;
    NSString *des2;
    int furniturePos;
    
    //two floors
    IBOutlet UIImageView *floor1;
    IBOutlet UIImageView *floor2;
    
    //scrollview
    IBOutlet ScrollSubClass *scrollView;
    NSString *nibFileName;
    UIView *citadelView;
    
    //Gestures
    UIPanGestureRecognizer *panRecognizer;
    
    //Floors
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

@property(nonatomic,retain) NSString *des1;
@property(nonatomic,retain) NSString *des2;

@property(nonatomic, retain) UIImageView *floor1;
@property(nonatomic, retain) UIImageView *floor2;

@property(nonatomic, strong) ScrollSubClass *scrollView;
@property(nonatomic, retain) NSString *nibFileName;
@property (nonatomic, strong) UIView *citadelView;
@property (nonatomic, strong) UIPanGestureRecognizer *panRecognizer;

-(IBAction)buyFloor;
-(void)displayFurniture;

@end
