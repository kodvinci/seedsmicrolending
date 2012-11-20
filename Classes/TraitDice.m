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
@synthesize inheritance;

-(void) addNumber:(int)number ofTrait:(NSString *)trait{
    for (int i= number; i>0; i--)
    {
        [traits addObject:trait];
    }
}

-(NSString *) rollDice
{
    int random = arc4rand() % ([traits count]);
    return [traits objectAtIndex:random];
    
}
- (BOOL) doesString: (NSString *) original containOne: (NSString *) one andTwo: (NSString *) two{
    NSRange rng = [original rangeOfString: one];
    NSRange rng2 = [original rangeOfString: two];
    if( rng.location != NSNotFound && rng2.location != NSNotFound){
        return true;
    }
    return false;
}

@end
