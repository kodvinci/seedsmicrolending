//
//  StrongmanHammer.m
//  Microlending
//
//  Created by guest user on 10/16/12.
//
//

#import "StrongmanHammer.h"

@implementation StrongmanHammer
-(void)initWithLevel:(NSInteger)furnitureLevel
{
    [self setFurnitureName:@"strongmanhammer"];
    [self setNumUsers:1];
    [self setUseTime:30];
    [self setItemWidth:1];
    [self setDesire1:@"strength"];
    
    if (furnitureLevel == 1) {
        [self setFurnitureLevel:1];
        [self setHappinessReward1:3];
        [self setPurchaseCostCoins:250];
    }
    if (furnitureLevel == 2) {
        [self setFurnitureLevel:2];
        [self setHappinessReward1:4];
        [self setUpgradeCostCoins:1000];
        [self setUpgradeCostLeaves:3];
    }
    if (furnitureLevel == 3) {
        [self setFurnitureLevel:3];
        [self setHappinessReward1:5];
        [self setUpgradeCostCoins:4000];
        [self setUpgradeCostLeaves:6];
    }
}

@end
