//
//  HairDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/4/12.
//
//

#import "HairDice.h"

@implementation HairDice

//Populates a dictionary with the starting characteristics for a new seedling that will be selcted randomly using the rollDice method in trait dice. 
-(id) init{
    if(self = [super init]){
    [self addNumber:1 ofTrait:@"Tulip"];
    [self addNumber:1 ofTrait:@"Branches"];
    [self addNumber:1 ofTrait:@"Silk Tree"];
    [self addNumber:1 ofTrait:@"Calla Lily"];
    [self addNumber:1 ofTrait:@"Lotus White"];
    }
    return self;
}

//Determines the hair type from the mother and father seedling. 
-(NSString *) hairFromDadsHair:(NSString *) hair andMomsHair: (NSString *) hair2
    {
        NSString* plistPath =[[NSBundle mainBundle] pathForResource:@"HairTypePassedDown" ofType:@"plist"];
        NSDictionary *hairPassedDicitonary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
        NSString * inheritedHair = [hairPassedDicitonary valueForKey:hair];
        NSString * inheritedHair2 = [hairPassedDicitonary valueForKey:hair2];
        
        NSString* plistPath2 =[[NSBundle mainBundle] pathForResource:@"HairTypeInheritance" ofType:@"plist"];
        NSDictionary *hairDictionary = [NSDictionary dictionaryWithContentsOfFile: plistPath2];
        if( [inheritedHair compare: inheritedHair2] == NSOrderedSame || [inheritedHair compare: inheritedHair2]==NSOrderedAscending ){
            inheritedHair = [inheritedHair stringByAppendingString:inheritedHair2];
        }
        else{
            inheritedHair = [inheritedHair2 stringByAppendingString: inheritedHair];
        }
        return [hairDictionary valueForKey: inheritedHair];    }
@end
