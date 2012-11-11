//
//  CitadelViewController.h
//  Microlending
//
//  Created by guest user on 9/29/12.
//
//

#import <UIKit/UIKit.h>
#import "FloorViewController.h"
#import "Floor.h"
#import "MicrolendingAppDelegate.h"
#import "Seedling.h"
#import "Citadel.h"
#import "Furniture.h"
#import "Pool.h"
#import "StoreViewController.h"
#import "OneFloorViewController.h"
#import "TwoFloorsViewController.h"
#import "ThreeFloorsViewController.h"

@interface CitadelViewController : UIViewController<CitadelDelegate> {
    MicrolendingAppDelegate *appDelegate;
    CGRect myFrame;    
    NSInteger numOfFloors;
    NSInteger level;
    NSInteger seedlingID;
    NSMutableArray *furniture;
    NSMutableArray *seedlings;
    NSUserDefaults *defaults;
    Pool *poolFurn;
    Seedling *myFirstSeedling;
    
    //Player variables
    NSInteger playerXP;
    NSInteger playerLevel;
    NSInteger playerCoins;
    NSInteger playerLeaves;
}

@property(nonatomic, assign) NSInteger numOfFloors;
@property(nonatomic, assign) NSInteger level;
@property(nonatomic, assign) NSInteger seedlingID;
@property(nonatomic, retain) NSMutableArray *furniture;
@property(nonatomic, retain) NSMutableArray *seedlings;
@property(nonatomic, retain) NSUserDefaults *defaults;
@property(nonatomic, retain) Pool *poolFurn;
@property(nonatomic, retain) Seedling *myFirstSeedling;

@property(nonatomic, assign) NSInteger playerXP;
@property(nonatomic, assign) NSInteger playerLevel;
@property(nonatomic, assign) NSInteger playerCoins;
@property(nonatomic, assign) NSInteger playerLeaves;

-(IBAction)play;
-(IBAction)begin;
-(IBAction)furnitureStore;
-(void)displayFloors:(NSInteger)howmany;

@end
