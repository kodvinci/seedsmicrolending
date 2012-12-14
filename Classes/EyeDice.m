//
//  EyeDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/4/12.
//
//

#import "EyeDice.h"

@implementation EyeDice
//Populates a dictionary with the starting characteristics for a new seedling that will be selcted randomly using the rollDice method in trait dice.
-(id) init{
    if(self == [super init]){
    [self addNumber:3 ofTrait:@"Light Brown"];
    [self addNumber:4 ofTrait:@"Dark Brown"];
    [self addNumber:1 ofTrait:@"Green"];
    [self addNumber:2 ofTrait:@"Blue"];
    }
    return self;
}

//Used to determine the inherited eye color from the mother and father seedlings. Uses EyeColors.plist in the Resources folder to determine the inerhited color. 
-(NSString *) eyesFromDadsEyes:(NSString *) eye andMomsEyes: (NSString *) eye2;
    {
        NSString* plistPath =[[NSBundle mainBundle] pathForResource:@"EyeColors" ofType:@"plist"];
        NSDictionary *eyesDictionary = [NSDictionary dictionaryWithContentsOfFile: plistPath];
        if( [eye compare: eye2] == NSOrderedSame || [eye compare: eye2]==NSOrderedAscending ){
            eye = [eye stringByAppendingString: eye2];
        }
        else{
            eye = [eye2 stringByAppendingString: eye];
        }
        return [eyesDictionary valueForKey: eye];
        
    }

@end
