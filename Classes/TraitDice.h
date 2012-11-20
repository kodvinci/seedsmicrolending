//
//  TraitDice.h
//  Microlending
//
//  Created by Benjamin Mozenter on 10/28/12.
//
//

#import "stdlib.h"
#import <Foundation/Foundation.h>

@interface TraitDice : NSObject
{
    NSString *traitName;
    NSMutableArray *traits;
    NSMutableDictionary *inheritance;
    
}

@property(nonatomic, retain) NSString *traitName;
@property(nonatomic, assign) NSMutableArray *traits;
@property(nonatomic, retain) NSMutableDictionary *inheritance;


-(void) addNumber: (int) number ofTrait: (NSString *)trait;
-(NSString *) rollDice;
- (BOOL) doesString: (NSString *) original containOne: (NSString *) one andTwo: (NSString *) two;


@end
