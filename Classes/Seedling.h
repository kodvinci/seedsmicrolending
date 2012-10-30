//
//  Seedling.h
//  Microlending
//
//  Created by Tori Reynolds on 10/6/12.
//
//

#import <Foundation/Foundation.h>

@interface Seedling : NSObject <NSCoding> {
    NSString *myName;
    UIImageView *myImage;
    int myHappiness;
    int myXP;
    NSMutableDictionary *myRelationships;
    NSMutableDictionary *myDesires;
}

@property (nonatomic, retain) NSString *myName;
@property (nonatomic, retain) UIImageView *myImage;
@property (nonatomic, assign) int myHappiness;
@property (nonatomic, assign) int myXP;
@property (nonatomic, retain) NSMutableDictionary *myRelationships;
@property (nonatomic, retain) NSMutableDictionary *myDesires;


- (void) updateHappiness: (int) happinessDifference;
- (void) updateXP: (int) xpDifference;
-(id)initWithImage: (NSString *) imageName;

@end
