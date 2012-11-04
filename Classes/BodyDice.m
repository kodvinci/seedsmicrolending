//
//  BodyDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/4/12.
//
//

#import "BodyDice.h"

@implementation BodyDice
-(void) initilize{
    CCLog(@"%@", @"BodyDice initialize");
    [self addNumber:3 ofTrait:@"Plain"];
    [self addNumber:1 ofTrait:@"Spotted"];
    [self addNumber:1 ofTrait:@"Striped"];
    [self addNumber:1 ofTrait:@"Thick solid"];

}
@end
