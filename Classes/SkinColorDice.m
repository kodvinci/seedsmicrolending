//
//  SkinColorDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/4/12.
//
//

#import "SkinColorDice.h"

@implementation SkinColorDice
-(id) init{
    if(self == [super init]){
    [self addNumber:1 ofTrait:@"Medium green"];
    [self addNumber:1 ofTrait:@"Medium brown"];
    }
    return self;

}
@end
