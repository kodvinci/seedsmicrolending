//
//  Furniture.h
//  Microlending
//
//  Created by guest user on 10/4/12.
//
//

#import <Foundation/Foundation.h>

@interface Furniture : NSObject <NSCoding>
{
    NSString *itemName;
    NSString *desire1;
    NSString *desire2;
    NSInteger itemLevel;
    NSInteger users;
    NSInteger useTime;
    NSInteger itemWidth;
    NSInteger happinessReward1;
    NSInteger happinessReward2;
    NSInteger purchaseCost;
    NSInteger coinsCost;
    NSInteger leavesCost;
    UIImage *furnPic;
    NSInteger currentOccupancy;
}

@property(nonatomic, retain) UIImage *furnPic;
@property(nonatomic, retain) NSString *itemName;
@property(nonatomic, retain) NSString *desire1;
@property(nonatomic, retain) NSString *desire2;
@property(nonatomic, assign) NSInteger useTime;
@property(nonatomic, assign) NSInteger happinessReward1;
@property(nonatomic, assign) NSInteger itemLevel;
@property(nonatomic, assign) NSInteger users;
@property(nonatomic, assign) NSInteger itemWidth;
@property(nonatomic, assign) NSInteger happinessReward2;
@property(nonatomic, assign) NSInteger coinsCost;
@property(nonatomic, assign) NSInteger leavesCost;
@property(nonatomic, assign) NSInteger purchaseCost;
@property(nonatomic, assign) NSInteger currentOccupants;

//check if occupied
-(Boolean) isOccupied;
-(void) addSeedling;

//define boundary for collisions
//-(CGRect) getBounds;

@end
