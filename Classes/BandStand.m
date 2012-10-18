//
//  BandStand.m
//  Microlending
//
//  Created by guest user on 10/16/12.
//
//

#import "BandStand.h"

@implementation BandStand

-(void)initWithLevel:(NSInteger)furnitureLevel
{
    [self setFurnitureName:@"bandstand"];
    [self setUseTime:30];
    [self setItemWidth:3];
    [self setDesire1:@"musical"];
    
    if (furnitureLevel == 1) {
        [self setFurnitureLevel:1];
        [self setNumUsers:1];
        [self setHappinessReward1:3];
        [self setPurchaseCostCoins:300];
    }
    if (furnitureLevel == 2) {
        [self setFurnitureLevel:2];
        [self setNumUsers:2];
        [self setHappinessReward1:4];
        [self setUpgradeCostCoins:1200];
        [self setUpgradeCostLeaves:3];
    }
    if (furnitureLevel == 3) {
        [self setFurnitureLevel:3];
        [self setNumUsers:3];
        [self setHappinessReward1:5];
        [self setUpgradeCostCoins:4800];
        [self setUpgradeCostLeaves:6];
    }
}

@end
