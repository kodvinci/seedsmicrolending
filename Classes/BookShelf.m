//
//  BookShelf.m
//  Microlending
//
//  Created by Leonard Ng'eno on 10/16/12.
//
//

#import "BookShelf.h"

@implementation BookShelf

-(void)initWithLevel:(NSInteger)furnitureLevel
{
    self.furnPic = [UIImage imageNamed:@"bookshelf"];
    self.itemName = @"BookShelf";
    self.users = 1;
    self.useTime = 30;
    self.itemWidth = 1;
    self.desire1 = @"intelligence";
    self.desire2 = @"relax";
    self.xPos = 290;
    self.yPos = 70;

    
    if (furnitureLevel == 1) {
        self.itemLevel = 1;
        self.happinessReward1 = 2;
        self.happinessReward2 = 1;
        self.purchaseCost = 250;
    }
    if (furnitureLevel == 2) {
        self.itemLevel = 2;
        self.happinessReward1 = 3;
        self.happinessReward2 = 1;
        self.coinsCost = 1000;
        self.leavesCost = 3;
    }
    if (furnitureLevel == 3) {
        self.itemLevel = 3;
        self.happinessReward1 = 3;
        self.happinessReward2 = 2;
        self.coinsCost = 4000;
        self.leavesCost = 6;
    }
}

@end
