//
//  FaceDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/4/12.
//
//

#import "FaceDice.h"

@implementation FaceDice
-(id) init{
    if(self == [super init]){
    [self addNumber:5 ofTrait:@"Gentle eyes"];
    [self addNumber:3 ofTrait:@"Vibrant eyes"];
    [self addNumber:1 ofTrait:@"Scruffy face"];
    }
    return self;

}

@end
