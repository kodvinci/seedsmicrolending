//
//  Floor.m
//  Microlending
//
//  Created by guest user on 9/29/12.
//
//

#import "Floor.h"

@implementation Floor
    
@synthesize playerLevelReq;
@synthesize floorCoinsCost;
@synthesize earlyUnlockCost;
@synthesize floorDelegate;
@synthesize floorID;
@synthesize floorFurniture;

//Give it to player based on method of purchase

-(void)initWithGrowTime:(NSInteger)growTime
{
    NSLog(@"%@", @"In initializeFloor");
   
    NSLog(@"%@",@"Finished Initializing floor items");
   // [self.floorDelegate didFinishSettingFloor:YES];
    
    [floorFurniture init];
}

-(void)initImmediately
{

    [floorFurniture init];
}

-(void)addFurnitureToFloor:(Class *)furnitureClass
{
    [floorFurniture addObject:furnitureClass];
}

@end
