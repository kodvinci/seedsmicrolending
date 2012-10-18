//
//  Tightrope.m
//  Microlending
//
//  Created by guest user on 10/16/12.
//
//

#import "Tightrope.h"

@implementation Tightrope

-(void)initWithLevel:(NSInteger)furnitureLevel
{
    [self setFurnitureName:@"tightrope"];
    [self setUseTime:30];
    [self setItemWidth:3];
    [self setDesire1:@"acrobatic"];
    
    if (furnitureLevel == 1) {
        [self setFurnitureLevel:1];
        [self setNumUsers:1];
        [self setHappinessReward1:5];
        [self setPurchaseCostCoins:400];
    }
    if (furnitureLevel == 2) {
        [self setFurnitureLevel:2];
        [self setNumUsers:2];
        [self setHappinessReward1:5];
        [self setUpgradeCostCoins:1600];
        [self setUpgradeCostLeaves:4];
    }
    if (furnitureLevel == 3) {
        [self setFurnitureLevel:3];
        [self setNumUsers:3];
        [self setHappinessReward1:5];
        [self setUpgradeCostCoins:6400];
        [self setUpgradeCostLeaves:8];
    }
}


@end
