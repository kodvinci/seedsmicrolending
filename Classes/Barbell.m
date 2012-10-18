//
//  Barbell.m
//  Microlending
//
//  Created by guest user on 10/16/12.
//
//

#import "Barbell.h"

@implementation Barbell

-(void)initWithLevel:(NSInteger)furnitureLevel
{
    [self setFurnitureName:@"Barbell"];
    [self setNumUsers:1];
    [self setUseTime:30];
    [self setItemWidth:1];
    [self setDesire1:@"strength"];
    
    if (furnitureLevel == 1) {
        [self setFurnitureLevel:1];
        [self setHappinessReward1:5];
        [self setPurchaseCostCoins:500];
    }
    if (furnitureLevel == 2) {
        [self setFurnitureLevel:2];
        [self setHappinessReward1:6];
        [self setUpgradeCostCoins:2000];
        [self setUpgradeCostLeaves:5];
    }
    if (furnitureLevel == 3) {
        [self setFurnitureLevel:3];
        [self setHappinessReward1:7];
        [self setUpgradeCostCoins:8000];
        [self setUpgradeCostLeaves:10];
    }
}


@end
