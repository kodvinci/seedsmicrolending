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
    self.furnPic = [UIImage imageNamed:@"tightrope"];
    self.itemName = @"tightrope";
    self. useTime = 30;
    self.itemWidth = 3;
    self.desire1 = @"acrobatic";
    self.xPos = 30;
    self.yPos = 130;

    if (furnitureLevel == 1) {
        self.itemLevel = 1;
        self.users = 1;
        self.happinessReward1 = 5;
        self.purchaseCost = 400;
    }
    if (furnitureLevel == 2) {
        self.itemLevel = 2;
        self.users = 2;
        self.happinessReward1 = 5;
        self.coinsCost = 1600;
        self.leavesCost = 4;
    }
    if (furnitureLevel == 3) {
        self.itemLevel = 3;
        self.users = 3;
        self.happinessReward1 = 5;
        self.coinsCost = 6400;
        self.leavesCost = 8;
    }
}


@end
