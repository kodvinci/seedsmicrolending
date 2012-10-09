//
//  Furniture.m
//  Microlending
//
//  Created by guest user on 10/4/12.
//
//

#import "Furniture.h"

@implementation Furniture

@synthesize itemID, itemName, itemLevel, users, useTime, itemWidth, happinessDesire, happinessReward, coinsCost, leavesCost;


-(void) dealloc
{
    [itemID release];
    [itemName release];
    [happinessDesire release];
    [super dealloc];
}

@end
