//
//  WhackAMole.m
//  Microlending
//
//  Created by guest user on 10/16/12.
//
//

#import "WhackAMole.h"

@implementation WhackAMole
-(void)initWithLevel:(NSInteger)furnitureLevel
{
    [self setFurnitureName:@"whackamole"];
    [self setUseTime:30];
    [self setItemWidth:2];
    [self setDesire1:@"strength"];
    [self setDesire2:@"acrobatic"];
    
    if (furnitureLevel == 1) {
        [self setFurnitureLevel:1];
        [self setNumUsers:1];
        [self setHappinessReward1:1];
        [self setHappinessReward2:2];
        [self setPurchaseCostCoins:250];
    }
    if (furnitureLevel == 2) {
        [self setFurnitureLevel:2];
        [self setNumUsers:2];
        [self setHappinessReward1:1];
        [self setHappinessReward2:2];
        [self setUpgradeCostCoins:1000];
        [self setUpgradeCostLeaves:3];
    }
    if (furnitureLevel == 3) {
        [self setFurnitureLevel:3];
        [self setNumUsers:3];
        [self setHappinessReward1:1];
        [self setHappinessReward2:3];
        [self setUpgradeCostCoins:4000];
        [self setUpgradeCostLeaves:6];
    }
}

@end
