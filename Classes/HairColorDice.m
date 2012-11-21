//
//  HairColorDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/4/12.
//
//

#import "HairColorDice.h"

@implementation HairColorDice

-(id) init{
    if(self == [super init]){
    [self addNumber:3 ofTrait:@"Red"];
    [self addNumber:3 ofTrait:@"White"];
    [self addNumber:1 ofTrait:@"Yellow"];
    [self addNumber:1 ofTrait:@"Purple"];
    }
    return self;
}
-(NSString *) hairColorFromDad:(NSString *) hair andMom: (NSString *) hair2{
    NSString* plistPath =[[NSBundle mainBundle] pathForResource:@"HairColors" ofType:@"plist"];
    NSDictionary *hairDictionary = [NSDictionary dictionaryWithContentsOfFile: plistPath];
    if( [hair compare: hair2] == NSOrderedSame || [hair compare: hair2]==NSOrderedAscending ){
        hair = [hair stringByAppendingString:hair2];
    }
    else{
        hair = [hair2 stringByAppendingString: hair];
    }
    return [hairDictionary valueForKey: hair];
    
}


@end
