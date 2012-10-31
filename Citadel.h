//
//  Citadel.h
//  Microlending
//
//  Created by guest user on 9/29/12.
//
//

@protocol CitadelDelegate <NSObject>

-(void)citadelSetUpDone:(BOOL)result;
-(void)needToRefreshView:(BOOL)result;

@end

#import <Foundation/Foundation.h>
#import "MicrolendingAppDelegate.h"
#import "Seedling.h"
#import "Furniture.h"
#import "FloorViewController.h"
#import "SingleFloor.h"
#import "Floor.h"

@interface Citadel : NSObject
{
    MicrolendingAppDelegate *appDelegate;
    NSInteger citFloors;
    NSMutableArray *citFurniture;
    NSInteger level;
    NSMutableArray *citSeedlings;
    id citadelDelegate;
    
    //Player variables
    NSInteger playerLevel;
    NSInteger playerCoins;
    NSInteger playerLeaves;
    
    //Floor Variables
    NSInteger totalHeight;
    NSString *floorID;
    NSInteger seedlingID;
    
    
}

@property(nonatomic, assign) NSInteger citFloors;
@property(nonatomic, retain) NSMutableArray *citFurniture;
@property(nonatomic, assign) NSInteger level;
@property(atomic, retain) NSMutableArray *citSeedlings;
@property(nonatomic, retain) id citadelDelegate;

-(void)initialize;
-(void)addFloor:(NSInteger)floorNumber;
-(void)addSeedling;
-(void)addFurniture;
-(void)saveChanges:(NSString *)thisChanged;

-(void) findHappyObj:(Seedling *)seed;
@end