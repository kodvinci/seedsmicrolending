//
//  FaceDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/4/12.
//
//

#import "FaceDice.h"

@implementation FaceDice
-(void) initilize{
    CCLog(@"%@", @"FaceDice initialize");
    [self addNumber:5 ofTrait:@"Gentle eyes"];
    [self addNumber:3 ofTrait:@"Vibrant eyes"];
    [self addNumber:1 ofTrait:@"Scruffy face"];

}

@end
