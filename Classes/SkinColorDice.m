//
//  SkinColorDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/4/12.
//
//

#import "SkinColorDice.h"

@implementation SkinColorDice
-(void) initilize{
    CCLog(@"%@", @"SkinColorDice initialize");
    [self addNumber:1 ofTrait:@"Medium green"];
    [self addNumber:1 ofTrait:@"Medium brown"];

}
@end
