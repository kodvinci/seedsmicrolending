//
//  Pool.m
//  Microlending
//
//  Created by Leonard Ng'eno on 10/16/12.
//
//

#import "Pool.h"

@implementation Pool


-(void)initWithLevel:(NSInteger)furnitureLevel 
{
    NSLog(@" %@", @"initializing pool");

    self.furnPic = [UIImage imageNamed:@"pool"];
    self.itemName = @"Pool";
    self.users = 2;
    self. useTime = 30; 
    self.itemWidth = 2; 
    self.desire1 = [[NSString alloc] initWithString:@"water"];
    self.xPos = 280;
    self.yPos = 300;
    
    if (furnitureLevel == 1) {
        self.itemLevel = 1;
        self.happinessReward1 = 3;
        self.purchaseCost = 500;
        NSLog(@"purchaseCost: %d", self.purchaseCost);
        NSLog(@"happinessReward1: %d", self.happinessReward1);

    }
    if (furnitureLevel == 2) {
        self.itemLevel = 2;
        self.happinessReward1 = 4;
        self.coinsCost = 2000;
        self.leavesCost = 5;
    }
    if (furnitureLevel == 3) {
        self.itemLevel = 3;
        self.happinessReward1 = 5;
        self.coinsCost = 8000;
        self.leavesCost = 10;
    }
}

@end
