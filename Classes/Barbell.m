//
//  Barbell.m
//  Microlending
//
//  Created by Leonard Ng'eno on 10/16/12.
//
//

#import "Barbell.h"

@implementation Barbell

-(void)initWithLevel:(NSInteger)furnitureLevel
{
    self.furnPic = [UIImage imageNamed:@"barbell"];
    self.itemName = @"barbell";
    self.users = 1;
    self. useTime = 30;
    self.itemWidth = 1;
    self.desire1 = @"strength";
    self.xPos = 60;
    self.yPos = 130;
    
    if (furnitureLevel == 1) {
        self.itemLevel = 1;
        self.happinessReward1 = 5;
        self.purchaseCost = 500;
    }
    if (furnitureLevel == 2) {
        self.itemLevel = 2;
        self.happinessReward1 = 6;
        self.coinsCost = 2000;
        self.leavesCost = 5;
    }
    if (furnitureLevel == 3) {
        self.itemLevel = 3;
        self.happinessReward1 = 7;
        self.coinsCost = 8000;
        self.leavesCost = 10;
    }
}


@end
