//
//  CitadelViewController.h
//  Microlending
//
//  Created by Leonard Ng'eno on 9/29/12.
//  
//

#import <UIKit/UIKit.h>
#import "MicrolendingAppDelegate.h"
#import "Furniture.h"
#import "Plot.h"
#import "StoreViewController.h"
#import "FloorViewController.h"
#import "NameGenerator.h"
#import "SeedlingV2.h"
#import "SeedlingV2View.h"
#import "Citadel.h"

@interface CitadelViewController : UIViewController<CitadelDelegate> {
    MicrolendingAppDelegate *appDelegate;
    CGRect myFrame;
    NSInteger numOfFloors;
    NSInteger level;
    NSInteger seedlingID;
    NSMutableArray *furniture;
    NSMutableDictionary *plots;
    NSMutableArray *seedlings;
    NSUserDefaults *defaults;
    Plot *plot1;
    SeedlingV2 *myFirstSeedling;
    
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
@property(nonatomic, retain) Plot *plot1;
@property(nonatomic, retain) SeedlingV2 *myFirstSeedling;
@property(nonatomic, retain) NSMutableDictionary *plots;
@property(nonatomic, assign) NSInteger playerXP;
@property(nonatomic, assign) NSInteger playerLevel;
@property(nonatomic, assign) NSInteger playerCoins;
@property(nonatomic, assign) NSInteger playerLeaves;

-(IBAction)play;
-(IBAction)begin;
-(IBAction)furnitureStore;
-(void)displayFloors:(NSInteger)howmany;


@end