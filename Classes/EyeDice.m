//
//  EyeDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/4/12.
//
//

#import "EyeDice.h"

@implementation EyeDice
-(id) init{
    if(self == [super init]){
    [self addNumber:3 ofTrait:@"Light Brown"];
    [self addNumber:4 ofTrait:@"Dark Brown"];
    [self addNumber:1 ofTrait:@"Green"];
    [self addNumber:2 ofTrait:@"Blue"];
    }
    return self;
}
@end