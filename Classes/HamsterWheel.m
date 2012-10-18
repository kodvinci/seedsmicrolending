//
//  HamsterWheel.m
//  Microlending
//
//  Created by guest user on 10/16/12.
//
//

#import "HamsterWheel.h"

@implementation HamsterWheel

-(void)initWithLevel:(NSInteger)furnitureLevel
{
    [self setFurnitureName:@"hamsterwheel"];
    [self setNumUsers:1];
    [self setUseTime:30];
    [self setItemWidth:2];
    [self setDesire1:@"acrobatic"];
    
    if (furnitureLevel == 1) {
        [self setFurnitureLevel:1];
        [self setHappinessReward1:2];
        [self setPurchaseCostCoins:250];
    }
    if (furnitureLevel == 2) {
        [self setFurnitureLevel:2];
        [self setHappinessReward1:3];
        [self setUpgradeCostCoins:1000];
        [self setUpgradeCostLeaves:3];
    }
    if (furnitureLevel == 3) {
        [self setFurnitureLevel:3];
        [self setHappinessReward1:4];
        [self setUpgradeCostCoins:4000];
        [self setUpgradeCostLeaves:6];
    }
}

@end
