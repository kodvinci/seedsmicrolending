//
//  DesireDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/5/12.
//
//

#import "DesireDice.h"

@implementation DesireDice

-(id) init{
    if(self = [super init]){
        [self addNumber:1 ofTrait:@"water"];
        [self addNumber:1 ofTrait:@"relax"];
        [self addNumber:1 ofTrait:@"intelligence"];
        [self addNumber:1 ofTrait:@"artistic"];
        [self addNumber:1 ofTrait:@"musical"];
        [self addNumber:1 ofTrait:@"acrobatic"];
        [self addNumber:1 ofTrait:@"strength"];
    }
    return self;
}

@end

