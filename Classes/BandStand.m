//
//  BandStand.m
//  Microlending
//
//  Created by guest user on 10/16/12.
//
//

#import "BandStand.h"

@implementation BandStand

-(void)initWithLevel:(NSInteger)furnitureLevel
{
    self.furnPic = [UIImage imageNamed:@"bandstand"];
    self.itemName = @"bandstand";
    self. useTime = 30;
    self.itemWidth = 2;
    self.desire1 = @"water";
    
    if (furnitureLevel == 1) {
        self.itemLevel = 1;
        self.users = 1;
        self.happinessReward1 = 3;
        self.purchaseCost = 300;
    }
    if (furnitureLevel == 2) {
        self.itemLevel = 2;
        self.users = 2;
        self.happinessReward1 = 4;
        self.coinsCost = 1200;
        self.leavesCost = 3;
    }
    if (furnitureLevel == 3) {
        self.itemLevel = 3;
        self.users = 3;
        self.happinessReward1 = 5;
        self.coinsCost = 4800;
        self.leavesCost = 6;
    }
}

@end
