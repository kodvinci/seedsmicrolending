//
//  BodyDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/4/12.
//
//

#import "BodyDice.h"

@implementation BodyDice

//populates the body dice dictionary with the correct number of each trait
-(id) init{
    if(self == [super init]){
    [self addNumber:3 ofTrait:@"Plain"];
    [self addNumber:1 ofTrait:@"Spotted"];
    [self addNumber:1 ofTrait:@"Striped"];
    [self addNumber:1 ofTrait:@"Thick solid"];
    }
    return self;

}

//returns a new body type that is inherited from the combination of the mother and father's body types.
-(NSString *) bodyFromDad:(NSString *) body andMom: (NSString *) body2{
    
    NSString* plistPath =[[NSBundle mainBundle] pathForResource:@"BodyTypePassedDown" ofType:@"plist"];
    NSDictionary *bodyPassedDicitonary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSString * inheritedBody = [bodyPassedDicitonary valueForKey:body];
    NSString * inheritedBody2 = [bodyPassedDicitonary valueForKey:body2];
    
    NSString* plistPath2 =[[NSBundle mainBundle] pathForResource:@"BodyTypeInheritence" ofType:@"plist"];
    NSDictionary *bodyDictionary = [NSDictionary dictionaryWithContentsOfFile: plistPath2];
    if( [inheritedBody compare: inheritedBody2] == NSOrderedSame || [inheritedBody compare: inheritedBody2]==NSOrderedAscending ){
        inheritedBody = [inheritedBody stringByAppendingString:inheritedBody2];
    }
    else{
        inheritedBody = [inheritedBody2 stringByAppendingString: inheritedBody];
    }
    return [bodyDictionary valueForKey: inheritedBody];
    
    //return [self traitFromTrait: inheritedBody andTrait: inheritedBody2 usingPath: @"BodyTypeInheritance"];

}
@end
