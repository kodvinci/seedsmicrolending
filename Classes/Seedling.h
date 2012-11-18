//
//  Seedling.h
//  Microlending
//
//  Created by Tori Reynolds on 10/6/12.
//
//

#import <Foundation/Foundation.h>
#import "CCSprite.h"
#import <CCTouchDelegateProtocol.h>
#import <Characteristics.h>
#import "EyeDice.h"
#import "NameGenerator.h"
#import "FaceDice.h"
#import "BodyDice.h"
#import "HairColorDice.h"
#import "HairDice.h"
#import "SkinColorDice.h"
#import "DesireDice.h"

@interface Seedling : CCSprite {
    NSString *myName;
    NSString *myImage;
    int myHappiness;
    int myXP;
    NSMutableDictionary *myRelationships;
    NSMutableDictionary *myDesires;
    NSMutableDictionary *myCharacteristics;
    
}

@property (nonatomic, retain) NSString *myName;
@property (nonatomic, retain) NSString *myImage;
@property (nonatomic, assign) int myHappiness;
@property (nonatomic, assign) int myXP;
@property (nonatomic, retain) NSMutableDictionary *myRelationships;
@property (nonatomic, retain) NSMutableDictionary *myDesires;
@property (nonatomic, retain) NSMutableDictionary *myCharacteristics;


- (void) updateHappiness: (int) happinessDifference;
- (void) updateXP: (int) xpDifference;
- (id) initWithImage: (NSString *) name : (NSString *) image;
-(void) generateNewSeedlingCharacteristics;
-(void) birthFrom: (Seedling*) Dad andFrom:(Seedling* ) Mom;

//define boundary for collisions
// -(CGRect) getBounds;

@end
