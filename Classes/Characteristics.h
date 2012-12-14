//
//  Characteristics.h
//  Microlending
//
//  Created by Benjamin Mozenter on 11/9/12.
//
//

#import <Foundation/Foundation.h>
#import "EyeDice.h"
#import "NameGenerator.h"
#import "FaceDice.h"
#import "BodyDice.h"
#import "HairColorDice.h"
#import "HairDice.h"
#import "SkinColorDice.h"
#import "DesireDice.h"


@class SeedlingV2;
//Characteristics objects are used to keep track of all the characteristics of a new seedling. To create a new seedling you must generate a new characteristics object. To update a seedling you just have to change the info within the characteristics object.
@interface Characteristics : NSObject{
    NSMutableDictionary *seedlingCharacteristics;
    
}

@property (nonatomic, retain) NSMutableDictionary *seedlingCharacteristics;

-(void) generateNewSeedlingCharacteristics;
-(void) birthFrom: (SeedlingV2 *) Dad andFrom:(SeedlingV2 *) Mom;

@end
