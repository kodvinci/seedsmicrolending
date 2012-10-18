//
//  Furniture.m
//  Microlending
//
//  Created by guest user on 10/4/12.
//
//

#import "Furniture.h"

@implementation Furniture

@synthesize desire1, desire2, itemName, itemLevel, users, useTime, itemWidth, happinessReward1, happinessReward2, coinsCost, leavesCost, furnPic;

//Make it illegal to initialize the class
- (id)init
{
    [self doesNotRecognizeSelector:_cmd];
    [self release];
    return nil;
}

-(void)setFurnitureName:(NSString *)name
{
    itemName = name;
}
-(void)setFurnitureLevel:(NSInteger)level
{
    itemLevel = level;
}
-(void)setNumUsers:(NSInteger)NumUsers
{
    users = NumUsers;
}
-(void)setUseTime:(NSInteger)time
{
    useTime = time; 
}
-(void)setItemWidth:(NSInteger)width
{
    itemWidth = width;
}
-(void)setDesire1:(NSString *)desire
{
    desire1 = desire;
}
-(void)setDesire2:(NSString *)desire
{
    desire2 = desire;
}
-(void)setHappinessReward1:(NSInteger)happiness
{
    happinessReward1 = happiness;
}
-(void)setHappinessReward2:(NSInteger)happiness
{
    happinessReward2 = happiness;
}
-(void)setPurchaseCostCoins:(NSInteger)cost
{
    purchaseCost = cost;
}
-(void)setUpgradeCostLeaves:(NSInteger)cost
{
    leavesCost = cost;
}
-(void)setUpgradeCostCoins:(NSInteger)cost
{
    coinsCost = cost;
}

-(void) dealloc
{
    [desire1 release];
    [desire2 release];
    [itemName release];
    
    [super dealloc];
}

@end
