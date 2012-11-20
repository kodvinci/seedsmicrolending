//
//  Hammock.m
//  Microlending
//
//  Created by guest user on 10/16/12.
//
//

#import "Hammock.h"

@implementation Hammock

-(void)initWithLevel:(NSInteger)furnitureLevel
{
    self.furnPic = [UIImage imageNamed:@"hammock"];
    self.itemName = @"hammock";
    self.users = 1;
    self. useTime = 30;
    self.itemWidth = 2;
    self.desire1 = @"relax";

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
