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
    NSString * hairColor =@"Red";
    if([hair isEqualToString: @"Red"] && [hair2 isEqualToString:@"Red"]){
        hairColor = @"Red";
    }
    else if([hair isEqualToString: @"Pink"] && [hair2 isEqualToString:@"Pink"]){
        hairColor = @"Pink";
    }
    else if([hair isEqualToString: @"Orange"] && [hair2 isEqualToString:@"Orange"]){
        hairColor = @"Orange";
    }
    else if([hair isEqualToString: @"White"] && [hair2 isEqualToString:@"White"]){
        hairColor = @"White";
    }
    else if([hair isEqualToString: @"Yellow"] && [hair2 isEqualToString:@"Yellow"]){
        hairColor = @"Yellow";
    }
    else if([hair isEqualToString: @"Violet"] && [hair2 isEqualToString:@"Violet"]){
        hairColor = @"Violet";
    }
    else if([hair isEqualToString: @"Purple"] && [hair2 isEqualToString:@"Purple"]){
        hairColor = @"Purple";
    }
    else if([hair isEqualToString: @"Turquoise"] && [hair2 isEqualToString:@"Turquoise"]){
        hairColor = @"Turquoise";
    }
    else if([hair isEqualToString: @"Black"] && [hair2 isEqualToString:@"Black"]){
        hairColor = @"Black";
    }
    
    else{
        NSString *combinedHairColor = [hair stringByAppendingString: hair2];
        if( [self doesString: combinedHairColor containOne: @"Orange" andTwo: @"Violet" ]){
            hairColor = @"Red";
        }
        else if( [self doesString: combinedHairColor containOne: @"Orange" andTwo: @"Red" ]){
            hairColor = @"Red";
        }
        else if( [self doesString: combinedHairColor containOne: @"Pink" andTwo: @"Red" ]){
            hairColor = @"Red";
        }
        else if( [self doesString: combinedHairColor containOne: @"Pink" andTwo: @"Violet" ]){
            hairColor = @"Red";
        }
        else if( [self doesString: combinedHairColor containOne: @"Red" andTwo: @"Violet" ]){
            hairColor = @"Red";
        }
        else if( [self doesString: combinedHairColor containOne: @"Pink" andTwo: @"Turquoise" ]){
            hairColor = @"Pink";
        }
        else if( [self doesString: combinedHairColor containOne: @"White" andTwo: @"Red" ]){
            hairColor = @"Pink";
        }
        else if( [self doesString: combinedHairColor containOne: @"White" andTwo: @"Violet" ]){
            hairColor = @"Pink";
        }
        else if( [self doesString: combinedHairColor containOne: @"Red" andTwo: @"Yellow" ]){
            hairColor = @"Orange";
        }
        else if( [self doesString: combinedHairColor containOne: @"Pink" andTwo: @"Yellow" ]){
            hairColor = @"Orange";
        }
        else if( [self doesString: combinedHairColor containOne: @"Orange" andTwo: @"Black" ]){
            hairColor = @"Orange";
        }
        else if( [self doesString: combinedHairColor containOne: @"White" andTwo: @"Yellow" ]){
            hairColor = @"White";
        }
        else if( [self doesString: combinedHairColor containOne: @"White" andTwo: @"Pink" ]){
            hairColor = @"White";
        }
        else if( [self doesString: combinedHairColor containOne: @"Black" andTwo: @"Pink" ]){
            hairColor = @"White";
        }
        else if( [self doesString: combinedHairColor containOne: @"White" andTwo: @"Turquoise" ]){
            hairColor = @"White";
        }
        else if( [self doesString: combinedHairColor containOne: @"White" andTwo: @"Purple" ]){
            hairColor = @"White";
        }
        else if( [self doesString: combinedHairColor containOne: @"Orange" andTwo: @"Yellow" ]){
            hairColor = @"Yellow";
        }
        else if( [self doesString: combinedHairColor containOne: @"Orange" andTwo: @"Pink" ]){
            hairColor = @"Yellow";
        }
        else if( [self doesString: combinedHairColor containOne: @"Orange" andTwo: @"White" ]){
            hairColor = @"Yellow";
        }
        else if( [self doesString: combinedHairColor containOne: @"Turquoise" andTwo: @"Yellow" ]){
            hairColor = @"Yellow";
        }
        else if( [self doesString: combinedHairColor containOne: @"Black" andTwo: @"Yellow" ]){
            hairColor = @"Yellow";
        }
        else if( [self doesString: combinedHairColor containOne: @"Orange" andTwo: @"Purple" ]){
            hairColor = @"Violet";
        }
        else if( [self doesString: combinedHairColor containOne: @"Red" andTwo: @"Purple" ]){
            hairColor = @"Violet";
        }
        else if( [self doesString: combinedHairColor containOne: @"Orange" andTwo: @"Turquoise" ]){
            hairColor = @"Violet";
        }
        else if( [self doesString: combinedHairColor containOne: @"Turquoise" andTwo: @"Red" ]){
            hairColor = @"Violet";
        }
        else if( [self doesString: combinedHairColor containOne: @"Black" andTwo: @"Purple" ]){
            hairColor = @"Purple";
        }
        else if( [self doesString: combinedHairColor containOne: @"Violet" andTwo: @"Purple" ]){
            hairColor = @"Purple";
        }
        else if( [self doesString: combinedHairColor containOne: @"Black" andTwo: @"White" ]){
            hairColor = @"Purple";
        }
        else if( [self doesString: combinedHairColor containOne: @"Violet" andTwo: @"Turquiose" ]){
            hairColor = @"Purple";
        }
        else if( [self doesString: combinedHairColor containOne: @"Turquoise" andTwo: @"Purple" ]){
            hairColor = @"Turquiose";
        }
        else if( [self doesString: combinedHairColor containOne: @"Turquoise" andTwo: @"Purple" ]){
            hairColor = @"Turquiose";
        }
        else if( [self doesString: combinedHairColor containOne: @"Yellow" andTwo: @"Purple" ]){
            hairColor = @"Turquiose";
        }
        else if( [self doesString: combinedHairColor containOne: @"Pink" andTwo: @"Purple" ]){
            hairColor = @"Turquiose";
        }
        else if( [self doesString: combinedHairColor containOne: @"Yellow" andTwo: @"Violet" ]){
            hairColor = @"Turquiose";
        }
        else if( [self doesString: combinedHairColor containOne: @"Turquoise" andTwo: @"Black" ]){
            hairColor = @"Black";
        }
        else if( [self doesString: combinedHairColor containOne: @"Red" andTwo: @"Black" ]){
            hairColor = @"Black";
        }
        
    }
    return hairColor;
    
}

@end
