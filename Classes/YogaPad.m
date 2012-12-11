//
//  YogaPad.m
//  Microlending
//
//  Created by Leonard Ng'eno on 10/16/12.
//
//

#import "YogaPad.h"

@implementation YogaPad

-(void)initWithLevel:(NSInteger)furnitureLevel
{
    self.furnPic = [UIImage imageNamed:@"yogapad"];
    self.itemName = @"yogapad";
    self.users = 2;
    self.useTime = 30;
    self.itemWidth = 2;
    self.desire1 = @"relax";
    self.desire2 = @"strength";
    self.xPos = 160;
    self.yPos = 70;
    
    if (furnitureLevel == 1) {
        self.itemLevel = 1;
        self.happinessReward1 = 2;
        self.happinessReward2 = 1;
        self.purchaseCost = 250;
    }
    if (furnitureLevel == 2) {
        self.itemLevel = 2;
        self.happinessReward1 = 3;
        self.happinessReward2 = 1;
        self.coinsCost = 1000;
        self.leavesCost = 3;
    }
    if (furnitureLevel == 3) {
        self.itemLevel = 3;
        self.happinessReward1 = 3;
        self.happinessReward2 = 2;
        self.coinsCost = 4000;
        self.leavesCost = 6;
    }
}

@end
