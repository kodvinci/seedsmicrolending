//
//  Seedling.h
//  Microlending
//
//  Created by Tori Reynolds on 10/6/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import <CCTouchDelegateProtocol.h>
#import <QuartzCore/QuartzCore.h>

@interface Seedling : CCSprite {
    NSString *myName;
    NSString *myImage;
    int myHappiness;
    int myXP;
    NSMutableDictionary *myRelationships;
    NSMutableDictionary *myDesires;
    NSMutableArray *_targets;
}

@property (nonatomic, retain) NSString *myName;
@property (nonatomic, retain) NSString *myImage;
@property (nonatomic, assign) int myHappiness;
@property (nonatomic, assign) int myXP;
@property (nonatomic, retain) NSMutableDictionary *myRelationships;
@property (nonatomic, retain) NSMutableDictionary *myDesires;


- (void) updateHappiness: (int) happinessDifference;
- (void) updateXP: (int) xpDifference;
- (id) initWithImage: (NSString *) imageName seedlingName: (NSString *) name;

//define boundary for collisions
// -(CGRect) getBounds;

@end
