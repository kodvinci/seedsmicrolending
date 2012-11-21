//
//  SeedlingV2.h
//  Microlending
//
//  Created by guest user on 11/19/12.
//
//

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

@interface SeedlingV2 : NSObject
{
    NSString *myName;
    UIImage *myImage;
    int myHappiness;
    int myXP;
    int happinessDeposited;
    NSMutableDictionary *myRelationships;
    NSMutableDictionary *myDesires;
    NSMutableDictionary *myCharacteristics;
}

@property (nonatomic, retain) NSString *myName;
@property (nonatomic, retain) UIImage *myImage;
@property (nonatomic, assign) int myHappiness;
@property (nonatomic, assign) int happinessDeposited;
@property (nonatomic, assign) int myXP;
@property (nonatomic, retain) NSMutableDictionary *myRelationships;
@property (nonatomic, retain) NSMutableDictionary *myDesires;
@property (nonatomic, retain) NSMutableDictionary *myCharacteristics;


- (void) updateHappiness: (int) happinessDifference;
- (void) updateXP: (int) xpDifference;
- (id) init;
-(void) generateNewSeedlingCharacteristics;
//-(void) birthFrom: (Seedling*) Dad andFrom:(Seedling* ) Mom;

@end
