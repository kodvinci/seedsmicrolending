//
//  ClimbingRope.m
//  Microlending
//
//  Created by Leonard Ng'eno on 10/16/12.
//
//

#import "ClimbingRope.h"

@implementation ClimbingRope

-(void)initWithLevel:(NSInteger)furnitureLevel
{
    self.furnPic = [UIImage imageNamed:@"climbingrope"];
    self.itemName = @"ClimbingRope";
    self.users = 1;
    self. useTime = 30;
    self.itemWidth = 1;
    self.desire1 = @"acrobatic";
    self.xPos = 160;
    self.yPos = 170;
    
    if (furnitureLevel == 1) {
        self.itemLevel = 1;
        self.happinessReward1 = 4;
        self.purchaseCost = 400;
    }
    if (furnitureLevel == 2) {
        self.itemLevel = 2;
        self.happinessReward1 = 5;
        self.coinsCost = 1600;
        self.leavesCost = 4;
    }
    if (furnitureLevel == 3) {
        self.itemLevel = 3;
        self.happinessReward1 = 6;
        self.coinsCost = 6400;
        self.leavesCost = 8;
    }
}

@end
