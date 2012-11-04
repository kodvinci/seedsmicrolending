//
//  HairColorDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/4/12.
//
//

#import "HairColorDice.h"

@implementation HairColorDice

-(id) init{
    if(self == [super init]){
    [self addNumber:3 ofTrait:@"Red"];
    [self addNumber:3 ofTrait:@"White"];
    [self addNumber:1 ofTrait:@"Yellow"];
    [self addNumber:1 ofTrait:@"Purple"];
    }
    return self;
}

@end
