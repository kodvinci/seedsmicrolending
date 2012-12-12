//
//  KaraokeMachine.m
//  Microlending
//
//  Created by Leonard Ng'eno on 10/16/12.
//
//

#import "KaraokeMachine.h"

@implementation KaraokeMachine

-(void)initWithLevel:(NSInteger)furnitureLevel
{
    self.furnPic = [UIImage imageNamed:@"karaokemachine"];
    self.itemName = @"KaraokeMachine";
    self. useTime = 30;
    self.itemWidth = 1;
    self.desire1 = @"musical";
    self.xPos = 30;
    self.yPos = 80;
    
    if (furnitureLevel == 1) {
        self.itemLevel = 1;
        self.users = 1;
        self.happinessReward1 = 4;
        self.purchaseCost = 500;
    }
    if (furnitureLevel == 2) {
        self.itemLevel = 2;
        self.users = 1;
        self.happinessReward1 = 5;
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
