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
        [self addNumber:1 ofTrait:@"Water"];
        [self addNumber:1 ofTrait:@"Relaxing"];
        [self addNumber:1 ofTrait:@"Intellectual"];
        [self addNumber:1 ofTrait:@"Artistic"];
        [self addNumber:1 ofTrait:@"Musical"];
        [self addNumber:1 ofTrait:@"Acrobatic"];
        [self addNumber:1 ofTrait:@"Strength"];
    }
    return self;
}

@end

