//
//  TraitDice.h
//  Microlending
//
//  Created by Benjamin Mozenter on 10/28/12.
//
//

#import <Foundation/Foundation.h>

@interface TraitDice : NSObject
{
    NSString *traitName;
    NSMutableArray *traits;
    
}

@property(nonatomic, retain) NSString *traitName;
@property(nonatomic, assign) NSMutableArray *traits;


-(void) addNumber: (int) number ofTrait: (NSString *)trait;
-(NSString *) getTrait;


@end
