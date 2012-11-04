//
//  HairColorDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/4/12.
//
//

#import "HairColorDice.h"

@implementation HairColorDice

-(void) initilize{
    CCLog(@"%@", @"HairColorDice initialize");
    [self addNumber:3 ofTrait:@"Red"];
    [self addNumber:3 ofTrait:@"White"];
    [self addNumber:1 ofTrait:@"Yellow"];
    [self addNumber:1 ofTrait:@"Purple"];
}

@end
