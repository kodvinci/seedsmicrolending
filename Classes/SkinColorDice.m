//
//  SkinColorDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/4/12.
//
//

#import "SkinColorDice.h"

@implementation SkinColorDice
//Populates a dictionary with the starting characteristics for a new seedling that will be selcted randomly using the rollDice method in trait dice.
-(id) init{
    if(self == [super init]){
    [self addNumber:1 ofTrait:@"Medium Green"];
    [self addNumber:1 ofTrait:@"Medium Brown"];
    [self addNumber:1 ofTrait:@"Light Red"];
    }
    return self;

}

//Determines the inherited skin color from the mother and father seedlings. Uses BodyColors.plist in Resources to determine the skin color inherited. 
-(NSString *) skinColorFromDad:(NSString *) skin andMom: (NSString *) skin2{
    NSString* plistPath =[[NSBundle mainBundle] pathForResource:@"BodyColors" ofType:@"plist"];
    NSDictionary *skinDictionary = [NSDictionary dictionaryWithContentsOfFile: plistPath];
    if( [skin compare: skin2] == NSOrderedSame || [skin compare: skin2]==NSOrderedAscending ){
        skin = [skin stringByAppendingString:skin2];
    }
    else{
        skin = [skin2 stringByAppendingString: skin];
    }
    return [skinDictionary valueForKey: skin];

}

@end
