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

@interface Seedling : CCSprite {
    NSString *myName;
    NSString *myImage;
    int myHappiness;
    int myXP;
    NSMutableDictionary *myRelationships;
    NSMutableDictionary *myDesires;
}

@property (nonatomic, retain) NSString *myName;
@property (nonatomic, retain) NSString *myImage;
@property (nonatomic, assign) int myHappiness;
@property (nonatomic, assign) int myXP;
@property (nonatomic, retain) NSMutableDictionary *myRelationships;
@property (nonatomic, retain) NSMutableDictionary *myDesires;


- (void) updateHappiness: (int) happinessDifference;
- (void) updateXP: (int) xpDifference;
- (id) initWithImage: (NSString *) name : (NSString *) image;

//define boundary for collisions
// -(CGRect) getBounds;

@end
