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
//Sets up the inheritence dictionary with the corresponding inherited trait for each body type.
-(id) init{
    if(self == [super init]){
    [self addNumber:3 ofTrait:@"Plain"];
    [self addNumber:1 ofTrait:@"Spotted"];
    [self addNumber:1 ofTrait:@"Striped"];
    [self addNumber:1 ofTrait:@"Thick solid"];
    [inheritance setObject:@"Normal" forKey:@"Plain"];
    [inheritance setObject:@"Spotted" forKey:@"Spotted"];
    [inheritance setObject:@"Striped" forKey:@"Striped"];
    [inheritance setObject:@"Thick" forKey:@"Thick Solid"];
    [inheritance setObject:@"Thick" forKey:@"Thick Spotted"];
    [inheritance setObject:@"Thick" forKey:@"Thick Striped"];
    [inheritance setObject:@"Striped" forKey:@"Colorful"];
    }
    return self;

}

//returns a new body type that is inherited from the combination of the mother and father's body types.
-(NSString *) bodyFromDad:(NSString *) body andMom: (NSString *) body2{
    NSString *dadsBody = [inheritance objectForKey: body];
    NSString *momsBody = [inheritance objectForKey: body2];
    NSString *combinedBody = [dadsBody stringByAppendingString: momsBody];
    if( [dadsBody isEqualToString:@"Normal"] && [momsBody isEqualToString:@"Normal"]){
        return @"Plain";
    }
    else if( [dadsBody isEqualToString:@"Spotted"] && [momsBody isEqualToString:@"Spotted"]){
        return @"Colorful";
    }
    else if( [dadsBody isEqualToString:@"Stripped"] && [momsBody isEqualToString:@"Stripped"]){
        return @"Colorful";
    }
    else if( [dadsBody isEqualToString:@"Thick"] && [momsBody isEqualToString:@"Thick"]){
        return @"Thick Solid";
    }
    else if( [self doesString: combinedBody containOne: @"Normal" andTwo: @"Spotted" ]){
        return @"Spotted";
    }
    else if( [self doesString: combinedBody containOne: @"Normal" andTwo: @"Striped" ]){
        return @"Striped";
    }
    else if( [self doesString: combinedBody containOne: @"Spotted" andTwo: @"Striped" ]){
        return @"Colorful";
    }
    else if( [self doesString: combinedBody containOne: @"Thick" andTwo: @"Normal" ]){
        return @"Thick Solid";
    }
    else if( [self doesString: combinedBody containOne: @"Thick" andTwo: @"Spotted" ]){
        return @"Thick Spotted";
    }
    else if( [self doesString: combinedBody containOne: @"Thick" andTwo: @"Striped" ]){
        return @"Thick Striped";
    }
    return @"Error";
}
@end
