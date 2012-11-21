//
//  SkinColorDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/4/12.
//
//

#import "SkinColorDice.h"

@implementation SkinColorDice
-(id) init{
    if(self == [super init]){
    [self addNumber:1 ofTrait:@"Medium Green"];
    [self addNumber:1 ofTrait:@"Medium Brown"];
    [self addNumber:1 ofTrait:@"Light Red"];
    }
    return self;

}

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
