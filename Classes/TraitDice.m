//
//  TraitDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 10/28/12.
//


#include <stdlib.h>
#import "TraitDice.h"

@implementation TraitDice
@synthesize traitName;
@synthesize traits;

-(void) addNumber:(int)number ofTrait:(NSString *)trait{
    for (int i= number; i>0; i--)
    {
        [traits addObject:trait];
    }
}

-(NSString *) getTrait{
    int random = arc4random() % [traits count];
    return [traits objectAtIndex:random];
    
}

@end
