//
//  TraitDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 10/28/12.
//


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

-(NSString *) rollDice{
    int random = arc4rand() % ([traits count]);
    return [traits objectAtIndex:random];
    
}

@end
