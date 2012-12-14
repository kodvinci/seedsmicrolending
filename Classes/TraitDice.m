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

-(id)init
{
    if(self == [super init]){
        traits = [[NSMutableArray alloc]init];
    }
    return self;
}

//Used to add a trait and weight of the trait to the dice
-(void) addNumber:(int)number ofTrait:(NSString *)trait {
    for (int i= number; i>0; i--)
    {
        [traits addObject:trait];
    }
}

//Called to randomly select a trait
-(NSString *) rollDice
{
    int random = arc4random() % ([traits count]);
    return [traits objectAtIndex:random];
    
}

//Used to check if a string contains two other strings. 
- (BOOL) doesString: (NSString *) original containOne: (NSString *) one andTwo: (NSString *) two{
    NSRange rng = [original rangeOfString: one];
    NSRange rng2 = [original rangeOfString: two];
    if( rng.location != NSNotFound && rng2.location != NSNotFound){
        return true;
    }
    return false;
}

@end
