//
//  FaceDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/4/12.
//
//

#import "FaceDice.h"

@implementation FaceDice
//Populates a dictionary with the starting characteristics for a new seedling that will be selcted randomly using the rollDice method in trait dice. 
-(id) init{
    if(self == [super init]){
    [self addNumber:5 ofTrait:@"Gentle eyes"];
    [self addNumber:3 ofTrait:@"Vibrant eyes"];
    [self addNumber:1 ofTrait:@"Scruffy face"];
    }
    return self;

}

//Determines the interhited face type from the combination of the mother and father. 
-(NSString *) faceFromDadsHair:(NSString *) face andMomsFace: (NSString *) face2{
    NSString* plistPath =[[NSBundle mainBundle] pathForResource:@"FaceTypePassedDown" ofType:@"plist"];
    NSDictionary *facePassedDicitonary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSString * inheritedFace = [facePassedDicitonary valueForKey:face];
    NSString * inheritedFace2 = [facePassedDicitonary valueForKey:face2];
    
    NSString* plistPath2 =[[NSBundle mainBundle] pathForResource:@"FaceTypeInheritance" ofType:@"plist"];
    NSDictionary *faceDictionary = [NSDictionary dictionaryWithContentsOfFile: plistPath2];
    if( [inheritedFace compare: inheritedFace2] == NSOrderedSame || [inheritedFace compare: inheritedFace2]==NSOrderedAscending ){
        inheritedFace = [inheritedFace stringByAppendingString:inheritedFace2];
    }
    else{
        inheritedFace = [inheritedFace2 stringByAppendingString: inheritedFace];
    }
    return [faceDictionary valueForKey: inheritedFace];
}


@end
