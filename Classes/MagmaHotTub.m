//
//  MagmaHotTub.m
//  Microlending
//
//  Created by guest user on 10/16/12.
//
//

#import "MagmaHotTub.h"

@implementation MagmaHotTub

-(void)initWithLevel:(NSInteger)furnitureLevel
{
    self.furnPic = [UIImage imageNamed:@"magmahottub"];
    self.itemName = @"magmahottub";
    self. useTime = 30;
    self.itemWidth = 2;
    self.desire1 = @"water";
    self.xPos = 30;
    self.yPos = 180;
    
    if (furnitureLevel == 1) {
        self.itemLevel = 1;
        self.users = 1;
        self.happinessReward1 = 4;
        self.purchaseCost = 500;
    }
    if (furnitureLevel == 2) {
        self.itemLevel = 2;
        self.users = 2;
        self.happinessReward1 = 4;
        self.coinsCost = 2000;
        self.leavesCost = 5;
    }
    if (furnitureLevel == 3) {
        self.itemLevel = 3;
        self.users = 2;
        self.happinessReward1 = 5;
        self.coinsCost = 8000;
        self.leavesCost = 10;
    }
}


@end
