//
//  WaterBed.m
//  Microlending
//
//  Created by Leonard Ng'eno on 10/16/12.
//
//

#import "WaterBed.h"

@implementation WaterBed

-(void)initWithLevel:(NSInteger)furnitureLevel
{
    self.furnPic = [UIImage imageNamed:@"waterbed.gif"];
    self.itemName = @"waterbed";
    self.users = 1;
    self.useTime = 30;
    self.itemWidth = 2;
    self.desire1 = @"water";
    self.desire2 = @"relax";
    self.xPos = 230;
    self.yPos = 300;

    
    if (furnitureLevel == 1) {
        self.itemLevel = 1;
        self.happinessReward1 = 3;
        self.purchaseCost = 400;
        self.happinessReward2 = 1;
    }
    if (furnitureLevel == 2) {
        self.itemLevel = 2;
        self.happinessReward1 = 4;
        self.coinsCost = 1600;
        self.leavesCost = 4;
        self.happinessReward2 = 1;
    }
    if (furnitureLevel == 3) {
        self.itemLevel = 3;
        self.happinessReward1 = 4;
        self.coinsCost = 6400;
        self.leavesCost = 8;
        self.happinessReward2 = 2;
    }
}


@end
