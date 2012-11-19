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
#import "Seedling.h"

@class Seedling;

@interface Characteristics : NSObject{
    NSMutableDictionary *seedlingCharacteristics;
    
}

@property (nonatomic, retain) NSMutableDictionary *seedlingCharacteristics;

-(void) generateNewSeedlingCharacteristics;
-(void) birthFrom: (Seedling *) Dad andFrom:(Seedling *) Mom;

@end
