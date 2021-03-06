//
//  SeedlingV2.h
//  Microlending
//
//  Created by Leonard Ng'eno on 11/19/12.
//
//
/*
 This class assigns values to all the property items that the Seedling has. These property items are mostly assigned by creating instances of the relevant Dice classes that then generate the required properties.
 */

#import <Foundation/Foundation.h>
#import <Characteristics.h>
#import "EyeDice.h"
#import "NameGenerator.h"
#import "FaceDice.h"
#import "BodyDice.h"
#import "HairColorDice.h"
#import "HairDice.h"
#import "SkinColorDice.h"
#import "DesireDice.h"

@interface SeedlingV2 : NSObject <NSCoding>
{
    NSString *myName;
    UIImage *myImage;
    NSInteger myHappiness;
    NSInteger myXP;
    NSInteger happinessDeposited;
    NSMutableDictionary *myRelationships;
    NSMutableDictionary *myDesires;
    NSMutableDictionary *myCharacteristics;
    CGPoint seedlingPosition;
}

@property (nonatomic, retain) NSString *myName;
@property (nonatomic, retain) UIImage *myImage;
@property (nonatomic, assign) NSInteger myHappiness;
@property (nonatomic, assign) NSInteger happinessDeposited;
@property (nonatomic, assign) NSInteger myXP;
@property (nonatomic, retain) NSMutableDictionary *myRelationships;
@property (nonatomic, retain) NSMutableDictionary *myDesires;
@property (nonatomic, retain) NSMutableDictionary *myCharacteristics;
@property(nonatomic, assign) CGPoint seedlingPosition;

- (void) updateHappiness: (int) happinessDifference;
- (void) updateXP: (int) xpDifference;
- (id) init;
-(void) generateNewSeedlingCharacteristics;
//-(void) birthFrom: (SeedlingV2*) Dad andFrom:(SeedlingV2* ) Mom;

@end
