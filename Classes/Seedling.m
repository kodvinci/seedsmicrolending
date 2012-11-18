//
//  Seedling.m
//  Microlending
//
//  Created by Tori Reynolds on 10/6/12.
//
//

#import "Seedling.h"
#import "CCSprite.h"
#import <QuartzCore/QuartzCore.h>

@implementation Seedling
@synthesize myName = myName_;
@synthesize myImage = myImage_;
@synthesize myHappiness = myHappiness_;
@synthesize myXP = myXP_;
@synthesize myRelationships = myRelationships_;
@synthesize myDesires = myDesires_;
@synthesize myCharacteristics = myCharacteristics_;

// initialize the seedling with the given image
-(id)initWithImage:(NSString *) name : (NSString *) image {
	self = [super init];
    myName = name;
    myHappiness = 0;
    myXP = 0;
    myRelationships = [NSMutableDictionary dictionary];
    myDesires = [NSMutableDictionary dictionary];
    myCharacteristics = [NSMutableDictionary dictionary];
    [self initWithFile: image rect:CGRectMake(0, 0, 20, 40)];
	return self;
}


// 
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
    [encoder encodeObject:myName forKey:@"myName"];
    [encoder encodeInteger:myHappiness forKey:@"myHappiness"];
    [encoder encodeInteger:myXP forKey:@"myXP"];
    [encoder encodeObject:myRelationships forKey:@"myRelationships"];
    [encoder encodeObject:myDesires forKey:@"myDesires"];
    [encoder encodeObject:myCharacteristics forKey:@"myCharacteristics"];
    [encoder encodeObject:myImage forKey:@"myImage"];
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

-(void) birthFrom:(Seedling *)Dad andFrom:(Seedling *)Mom{
    NameGenerator *namer;
    NSString *name = [namer generateName];
    [myCharacteristics setObject: name forKey: @"Name"];
    
    
    NSMutableDictionary *dad = [Dad myCharacteristics];
    NSMutableDictionary *mom = [Mom myCharacteristics];
    
    
}

//-(CGRect) getBounds{
//    CGSize size = [self contentSize];
//    size.width *= scaleX_;
//    size.height += scaleY_;
//    return CGRectMake( position_.x - size.width* anchorPoint_.x,
//                      position_.y - size.height* anchorPoint_.y, size.width,
//                      size.height);
//}

@end
