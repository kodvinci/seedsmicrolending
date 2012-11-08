//
//  HairDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/4/12.
//
//

#import "HairDice.h"

@implementation HairDice

-(id) init{
    if(self = [super init]){
    [self addNumber:1 ofTrait:@"Tulip"];
    [self addNumber:1 ofTrait:@"Branches"];
    [self addNumber:1 ofTrait:@"Silk Tree"];
    [self addNumber:1 ofTrait:@"Calla Lily"];
    [self addNumber:1 ofTrait:@"Lotus White"];
    }
    return self;
}
@end
