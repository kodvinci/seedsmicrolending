//
//  SeedlingV2.m
//  Microlending
//
//  Created by guest user on 11/19/12.
//
//

#import "SeedlingV2.h"

@implementation SeedlingV2

@synthesize myName;
@synthesize myImage;
@synthesize myHappiness;
@synthesize myXP;
@synthesize myRelationships;
@synthesize myDesires;
@synthesize myCharacteristics;

// initialize the seedling 
-(id)init {
	self = [super init];
    myName = [[NSString alloc]init];
    myImage= [UIImage imageNamed:@"seedling"]; //TO_DO assign image based on chracteristics
    myHappiness = 0;
    myXP = 0;
    myRelationships = [[NSMutableDictionary alloc]init]; 
    myDesires = [[NSMutableDictionary alloc]init];
    myCharacteristics = [[NSMutableDictionary alloc]init];
	return self;
}


//for storage of variables in the NSUserdefaults
- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.myName = [decoder decodeObjectForKey:@"myName"];
        self.myHappiness = [decoder decodeIntegerForKey:@"myHappiness"];
        self.myXP = [decoder decodeIntegerForKey:@"myXP"];
        self.myRelationships = [decoder decodeObjectForKey:@"myRelationships"];
        self.myCharacteristics = [decoder decodeObjectForKey:@"myCharacteristics"];
        self.myDesires = [decoder decodeObjectForKey:@"myDesires"];
        self.myImage = [decoder decodeObjectForKey:@"myImage"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.myName forKey:@"myName"];
    [encoder encodeInteger:self.myHappiness forKey:@"myHappiness"];
    [encoder encodeInteger:self.myXP forKey:@"myXP"];
    [encoder encodeObject:self.myRelationships forKey:@"myRelationships"];
    [encoder encodeObject:self.myDesires forKey:@"myDesires"];
    [encoder encodeObject:self.myCharacteristics forKey:@"myCharacteristics"];
    [encoder encodeObject:self.myImage forKey:@"myImage"];
}


- (void) updateHappiness: (int) happinessDifference {
    myHappiness += happinessDifference;
}

- (void) updateXP: (int) xpDifference {
    myXP += xpDifference;
}

// FINISH THIS METHOD
- (void) makeNewFriend: (Seedling *)newFriend {
    [myRelationships setObject: newFriend forKey: 0];
}

// FINISH THIS METHOD
- (void) updateRelationshipPoints: (Seedling *) acquaintance: (int) pointChange {
}

-(void)dealloc
{
    [myName release];
    [myImage release];
    [myRelationships release];
    [myDesires release];
    [super dealloc];
}

- (void) generateNewSeedlingCharacteristics{
    NameGenerator *namer = [[NameGenerator alloc]init];
    EyeDice *eye = [[EyeDice alloc]init];
    FaceDice *face = [[FaceDice alloc]init];
    BodyDice *body = [[BodyDice alloc]init];
    HairColorDice *hairColor = [[HairColorDice alloc]init];
    HairDice *hair = [[HairDice alloc]init];
    SkinColorDice *skinColor = [[SkinColorDice alloc]init];
    DesireDice *desires = [[DesireDice alloc]init];
    
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
    myName = name;
    [myCharacteristics setObject: name forKey: @"Name"];
    [myCharacteristics setObject: eyeType forKey: @"Eye Type"];
    [myCharacteristics setObject: faceType forKey: @"Face Type"];
    [myCharacteristics setObject: bodyType forKey: @"Body Type"];
    [myCharacteristics setObject: hairColorType forKey: @"Hair Color"];
    [myCharacteristics setObject: hairType forKey: @"Hair Type"];
    [myCharacteristics setObject: skinColorType forKey: @"Skin Color"];
    [myCharacteristics setObject: firstDesireType forKey: @"First Desire"];
    [myCharacteristics setObject: secondDesireType forKey: @"Second Desire"];
    [myCharacteristics setObject: thirdDesireType forKey: @"Third Desire"];
}
/*
-(void) birthFrom:(Seedling *)Dad andFrom:(Seedling *)Mom{
    NameGenerator *namer;
    NSString *name = [namer generateName];
    [myCharacteristics setObject: name forKey: @"Name"];
    
    
    NSMutableDictionary *dad = [Dad myCharacteristics];
    NSMutableDictionary *mom = [Mom myCharacteristics];
    
    
} */

@end
