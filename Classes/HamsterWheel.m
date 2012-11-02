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
    self.furnPic = [UIImage imageNamed:@"hamsterwheel"];
    self.itemName = @"hamsterwheel";
    self.users = 1;
    self.useTime = 30;
    self.itemWidth = 2;
    self.desire1 = @"acrobatic";
    
    if (furnitureLevel == 1) {
        self.itemLevel = 1;
        self.happinessReward1 = 2;
        self.purchaseCost = 250;
    }
    if (furnitureLevel == 2) {
        self.itemLevel = 2;
        self.happinessReward1 = 3;
        self.coinsCost = 1000;
        self.leavesCost = 3;
    }
    if (furnitureLevel == 3) {
        self.itemLevel = 3;
        self.happinessReward1 = 4;
        self.coinsCost = 4000;
        self.leavesCost = 6;
    }
}

@end
