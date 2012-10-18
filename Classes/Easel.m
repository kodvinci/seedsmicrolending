//
//  Easel.m
//  Microlending
//
//  Created by guest user on 10/16/12.
//
//

#import "Easel.h"

@implementation Easel

-(void)initWithLevel:(NSInteger)furnitureLevel
{
    [self setFurnitureName:@"easel"];
    [self setNumUsers:1];
    [self setUseTime:30];
    [self setItemWidth:1];
    [self setDesire1:@"artistic"];
    
    if (furnitureLevel == 1) {
        [self setFurnitureLevel:1];
        [self setHappinessReward1:4];
        [self setPurchaseCostCoins:400];
    }
    if (furnitureLevel == 2) {
        [self setFurnitureLevel:2];
        [self setHappinessReward1:5];
        [self setUpgradeCostCoins:1600];
        [self setUpgradeCostLeaves:4];
    }
    if (furnitureLevel == 3) {
        [self setFurnitureLevel:3];
        [self setHappinessReward1:6];
        [self setUpgradeCostCoins:6400];
        [self setUpgradeCostLeaves:8];
    }
}

@end
