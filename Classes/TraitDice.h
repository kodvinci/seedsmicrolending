//
//  TraitDice.h
//  Microlending
//
//  Created by Benjamin Mozenter on 10/28/12.
//
//

#import "stdlib.h"
#import <Foundation/Foundation.h>

//Trait dice are used to randomly generate a new seedling or to determine the inharitence of certain traits. 
@interface TraitDice : NSObject
{
    //trait characteristics
    NSString *traitName;
    NSMutableArray *traits;

    
}

@property(nonatomic, retain) NSString *traitName;
@property(nonatomic, assign) NSMutableArray *traits;;


-(void) addNumber: (int) number ofTrait: (NSString *)trait;
-(NSString *) rollDice;
- (BOOL) doesString: (NSString *) original containOne: (NSString *) one andTwo: (NSString *) two;
-(NSString *) traitFromDad:(NSString *) trait andTrait: (NSString *) trait2 usingPath: (NSString *) path;

@end
