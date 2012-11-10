//
//  Characteristics.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/9/12.
//
//

#import "Characteristics.h"
#import "Seedling.h"

@implementation Characteristics
@synthesize seedlingCharacteristics = seedlingCharacteristics_;

- (void) generateNewSeedlingCharacteristics{
    NameGenerator *namer;
    EyeDice *eye;
    FaceDice *face;
    BodyDice *body;
    HairColorDice *hairColor;
    HairDice *hair;
    SkinColorDice *skinColor;
    DesireDice *desires;
    
    NSString *name = [namer generateName];
    NSString *eyeType = [eye rollDice];
    NSString *faceType = [face rollDice];
    NSString *bodyType = [body rollDice];
    NSString *hairColorType = [hairColor rollDice];
    NSString *hairType = [hair rollDice];
    NSString *skinColorType = [skinColor rollDice];
    NSString *firstDesireType = [desires rollDice];
    NSString *secondDesireType = [desires rollDice];
    while ([firstDesireType isEqualToString: secondDesireType])
    {
        secondDesireType = [desires rollDice];
    }
    NSString *thirdDesireType = [desires rollDice];
    while ([firstDesireType isEqualToString: thirdDesireType] && [secondDesireType isEqualToString: thirdDesireType])
    {
        thirdDesireType = [desires rollDice];
    }
    [seedlingCharacteristics setObject: name forKey: @"Name"];
    [seedlingCharacteristics setObject: eyeType forKey: @"Eye Type"];
    [seedlingCharacteristics setObject: faceType forKey: @"Face Type"];
    [seedlingCharacteristics setObject: bodyType forKey: @"Body Type"];
    [seedlingCharacteristics setObject: hairColorType forKey: @"Hair Color"];
    [seedlingCharacteristics setObject: hairType forKey: @"Hair Type"];
    [seedlingCharacteristics setObject: skinColorType forKey: @"Skin Color"];
    [seedlingCharacteristics setObject: firstDesireType forKey: @"First Desire"];
    [seedlingCharacteristics setObject: secondDesireType forKey: @"Second Desire"];
    [seedlingCharacteristics setObject: thirdDesireType forKey: @"Third Desire"];
}

-(void) birthFrom:(Seedling *)Dad andFrom:(Seedling *)Mom{
    
}
@end
