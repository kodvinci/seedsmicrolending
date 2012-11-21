//
//  Easel.m
//  Microlending
//
//  Created by guest user on 10/16/12.
//
//

#import "Easel.h"

@implementation Easel

-(void)initWithLevel:(NSInteger)furnitureLevel
{
    self.furnPic = [UIImage imageNamed:@"easel"];
    self.itemName = @"easel";
    self.users = 1;
    self. useTime = 30;
    self.itemWidth = 1;
    self.desire1 = @"artistic";
    self.xPos = 50;
    self.yPos = 50;
    
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
