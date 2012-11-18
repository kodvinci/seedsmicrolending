//
//  EyeDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/4/12.
//
//

#import "EyeDice.h"

@implementation EyeDice
-(id) init{
    if(self == [super init]){
    [self addNumber:3 ofTrait:@"Light Brown"];
    [self addNumber:4 ofTrait:@"Dark Brown"];
    [self addNumber:1 ofTrait:@"Green"];
    [self addNumber:2 ofTrait:@"Blue"];
    }
    return self;
}

-(NSString *) eyesFromDadsEyes:(NSString *) eye andMomsEyes: (NSString *) eyes2;
    {
        NSString * eyeColor =@"Light Brown";
        if([eye isEqualToString: @"Light Brown"] && [eyes2 isEqualToString:@"Light Brown"]){
            eyeColor = @"Red";
        }
        else if([eye isEqualToString: @"Dark Brown"] && [eyes2 isEqualToString:@"Dark Brown"]){
            eyeColor = @"Dark Brown";
        }
        else if([eye isEqualToString: @"Green"] && [eyes2 isEqualToString:@"Green"]){
            eyeColor = @"Green";
        }
        else if([eye isEqualToString: @"Blue"] && [eyes2 isEqualToString:@"Blue"]){
            eyeColor = @"Blue";
        }
        else if([eye isEqualToString: @"Grey"] && [eyes2 isEqualToString:@"Grey"]){
            eyeColor = @"Grey";
        }
        else if([eye isEqualToString: @"Red"] && [eyes2 isEqualToString:@"Red"]){
            eyeColor = @"Red";
        }
        else if([eye isEqualToString: @"Yellow"] && [eyes2 isEqualToString:@"Yellow"]){
            eyeColor = @"Yellow";
        }
        else{
            NSString *combinedEyeColor = [eye stringByAppendingString: eyes2];
            if( [self doesString: combinedEyeColor containOne: @"Light Brown" andTwo: @"Dark Brown" ]){
                eyeColor = @"Light Brown";
            }
            else if( [self doesString: combinedEyeColor containOne: @"Light Brown" andTwo: @"Red" ]){
                eyeColor = @"Light Brown";
            }
            else if( [self doesString: combinedEyeColor containOne: @"Yellow" andTwo: @"Red" ]){
                eyeColor = @"Light Brown";
            }
            else if( [self doesString: combinedEyeColor containOne: @"Light Brown" andTwo: @"Yellow" ]){
                eyeColor = @"Light Brown";
            }
            else if( [self doesString: combinedEyeColor containOne: @"Light Brown" andTwo: @"Blue" ]){
                eyeColor = @"Dark Brown";
            }
            else if( [self doesString: combinedEyeColor containOne: @"Dark Brown" andTwo: @"Green" ]){
                eyeColor = @"Dark Brown";
            }
            else if( [self doesString: combinedEyeColor containOne: @"Dark Brown" andTwo: @"Red" ]){
                eyeColor = @"Dark Brown";
            }
            else if( [self doesString: combinedEyeColor containOne: @"Dark Brown" andTwo: @"Yellow" ]){
                eyeColor = @"Dark Brown";
            }
            else if( [self doesString: combinedEyeColor containOne: @"Dark Brown" andTwo: @"Grey" ]){
                eyeColor = @"Green";
            }
            else if( [self doesString: combinedEyeColor containOne: @"Red" andTwo: @"Blue" ]){
                eyeColor = @"Green";
            }
            else if( [self doesString: combinedEyeColor containOne: @"Yellow" andTwo: @"Blue" ]){
                eyeColor = @"Green";
            }
            else if( [self doesString: combinedEyeColor containOne: @"Grey" andTwo: @"Blue" ]){
                eyeColor = @"Blue";
            }
            else if( [self doesString: combinedEyeColor containOne: @"Green" andTwo: @"Yellow" ]){
                eyeColor = @"Blue";
            }
            else if( [self doesString: combinedEyeColor containOne: @"Grey" andTwo: @"Light Brown" ]){
                eyeColor = @"Blue";
            }
            else if( [self doesString: combinedEyeColor containOne: @"Green" andTwo: @"Blue" ]){
                eyeColor = @"Grey";
            }
            else if( [self doesString: combinedEyeColor containOne: @"Grey" andTwo: @"Red" ]){
                eyeColor = @"Red";
            }
            else if( [self doesString: combinedEyeColor containOne: @"Green" andTwo: @"Light Brown" ]){
                eyeColor = @"Red";
            }
            else if( [self doesString: combinedEyeColor containOne: @"Dark Brown" andTwo: @"Blue" ]){
                eyeColor = @"Red";
            }
            else if( [self doesString: combinedEyeColor containOne: @"Grey" andTwo: @"Green" ]){
                eyeColor = @"Yellow";
            }
            else if( [self doesString: combinedEyeColor containOne: @"Red" andTwo: @"Green" ]){
                eyeColor = @"Yellow";
            }
            else if( [self doesString: combinedEyeColor containOne: @"Grey" andTwo: @"Yellow" ]){
                eyeColor = @"Yellow";
            }


            

        }
    }
@end
