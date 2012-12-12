//
//  StrongmanHammer.m
//  Microlending
//
//  Created by Leonard Ng'eno on 10/16/12.
//
//

#import "StrongmanHammer.h"

@implementation StrongmanHammer
-(void)initWithLevel:(NSInteger)furnitureLevel
{
    self.furnPic = [UIImage imageNamed:@"strongmanhammer"];
    self.itemName = @"StrongmanHammer";
    self.users = 1;
    self.useTime = 30;
    self.itemWidth = 1;
    self.desire1 = @"strength";
    self.xPos = 150;
    self.yPos = 80;
    
    if (furnitureLevel == 1) {
        self.itemLevel = 1;
        self.happinessReward1 = 3;
        self.purchaseCost = 250;
    }
    if (furnitureLevel == 2) {
        self.itemLevel = 2;
        self.happinessReward1 = 4;
        self.coinsCost = 1000;
        self.leavesCost = 3;
    }
    if (furnitureLevel == 3) {
        self.itemLevel = 3;
        self.happinessReward1 = 5;
        self.coinsCost = 4000;
        self.leavesCost = 6;
    }
}

@end
