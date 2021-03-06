//
//  WhackAMole.m
//  Microlending
//
//  Created by Leonard Ng'eno on 10/16/12.
//
//

#import "WhackAMole.h"

@implementation WhackAMole
-(void)initWithLevel:(NSInteger)furnitureLevel
{
    self.furnPic = [UIImage imageNamed:@"whackamole"];
    self.itemName = @"WhackAMole";
    self.useTime = 30;
    self.itemWidth = 2;
    self.desire1 = @"strength";
    self.desire2 = @"acrobatic";
    self.xPos = 100;
    self.yPos = 100;
    
    if (furnitureLevel == 1) {
        self.itemLevel = 1;
        self.users = 1;
        self.happinessReward1 = 1;
        self.happinessReward2 = 2;
        self.purchaseCost = 250;
    }
    if (furnitureLevel == 2) {
        self.itemLevel = 2;
        self.users = 2;
        self.happinessReward1 = 1;
        self.happinessReward2 = 2;
        self.coinsCost = 1000;
        self.leavesCost = 3;
    }
    if (furnitureLevel == 3) {
        self.itemLevel = 3;
        self.users = 3;
        self.happinessReward1 = 1;
        self.happinessReward2 = 3;
        self.coinsCost = 4000;
        self.leavesCost = 6;
    }
}

@end
