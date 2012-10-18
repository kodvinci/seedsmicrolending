//
//  MagmaHotTub.m
//  Microlending
//
//  Created by guest user on 10/16/12.
//
//

#import "MagmaHotTub.h"

@implementation MagmaHotTub

-(void)initWithLevel:(NSInteger)furnitureLevel
{
    [self setFurnitureName:@"magmahottub"];
    [self setUseTime:30];
    [self setItemWidth:2];
    [self setDesire1:@"water"];
    
    if (furnitureLevel == 1) {
        [self setFurnitureLevel:1];
        [self setNumUsers:1];
        [self setHappinessReward1:4];
        [self setPurchaseCostCoins:500];
    }
    if (furnitureLevel == 2) {
        [self setFurnitureLevel:2];
        [self setNumUsers:2];
        [self setHappinessReward1:4];
        [self setUpgradeCostCoins:2000];
        [self setUpgradeCostLeaves:5];
    }
    if (furnitureLevel == 3) {
        [self setFurnitureLevel:3];
        [self setNumUsers:2];
        [self setHappinessReward1:5];
        [self setUpgradeCostCoins:8000];
        [self setUpgradeCostLeaves:10];
    }
}


@end
