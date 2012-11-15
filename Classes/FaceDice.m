//
//  FaceDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/4/12.
//
//

#import "FaceDice.h"

@implementation FaceDice
-(id) init{
    if(self == [super init]){
    [self addNumber:5 ofTrait:@"Gentle eyes"];
    [self addNumber:3 ofTrait:@"Vibrant eyes"];
    [self addNumber:1 ofTrait:@"Scruffy face"];
        
    [inheritance setObject:@"Passive" forKey:@"Gentle Eyes"];
    [inheritance setObject:@"Hair" forKey:@"Unibrow"];
    [inheritance setObject:@"Passive" forKey:@"Sleepy Eyes"];
    [inheritance setObject:@"Awake" forKey:@"Vibrant Eyes"];
    [inheritance setObject:@"Hair" forKey:@"Scruffy Face"];
    [inheritance setObject:@"Awake" forKey:@"Branch Nose"];

    }
    return self;

}

-(NSString *) faceFromDadsHair:(NSString *) face andMomsFace: (NSString *) face2{
        NSString *dadsFace = [inheritance objectForKey: face];
        NSString *momsFace = [inheritance objectForKey: face2];
        NSString *combinedFace = [dadsFace stringByAppendingString: momsFace];
    if( [dadsFace isEqualToString:@"Passive"] && [momsFace isEqualToString:@"Passive"]){
        return @"Sleepy Eyes";
    }
    else if( [dadsFace isEqualToString:@"Awake"] && [momsFace isEqualToString:@"Awake"]){
        return @"Vibrant Eyes";
    }
    else if( [dadsFace isEqualToString:@"Hair"] && [momsFace isEqualToString:@"Hair"]){
        return @"Scruffy Face";
    }
    else if( [self doesString: combinedFace containOne: @"Passive" andTwo: @"Hair" ]){
        return @"Unibrow";
    }
    else if( [self doesString: combinedFace containOne: @"Passive" andTwo: @"Awake" ]){
        return @"Gentle Eyes";
    }
    else if( [self doesString: combinedFace containOne: @"Passive" andTwo: @"Awake" ]){
        return @"Branch Nose";
    }
}



@end
