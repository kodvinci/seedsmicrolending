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
#import "BuyFurnitureViewController.h"

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
}

@property(nonatomic, assign) NSInteger numOfFloors;
@property(nonatomic, assign) NSInteger level;
@property(nonatomic, assign) NSInteger seedlingID;
@property(nonatomic, retain) NSMutableArray *furniture;
@property(nonatomic, retain) NSMutableArray *seedlings;
@property(nonatomic, retain) NSUserDefaults *defaults;
@property(nonatomic, retain) Pool *poolFurn;
@property(nonatomic, retain) Seedling *myFirstSeedling;

-(IBAction)play;
-(IBAction)begin;
-(IBAction)furnitureStore;

@end
