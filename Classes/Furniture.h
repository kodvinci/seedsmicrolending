//
//  Furniture.h
//  Microlending
//
//  Created by guest user on 10/4/12.
//
//

#import <Foundation/Foundation.h>
#import "CCSprite.h"
#import <CCTouchDelegateProtocol.h>

@interface Furniture : CCSprite <CCTargetedTouchDelegate>
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

-(void)setFurnitureName:(NSString *)name;
-(void)setFurnitureLevel:(NSInteger)level;
-(void)setNumUsers:(NSInteger)NumUsers;
-(void)setUseTime:(NSInteger)time;
-(void)setItemWidth:(NSInteger)width;
-(void)setDesire1:(NSString *)desire;
-(void)setDesire2:(NSString *)desire;
-(void)setHappinessReward1:(NSInteger)happiness;
-(void)setHappinessReward2:(NSInteger)happiness;
-(void)setPurchaseCostCoins:(NSInteger)cost;
-(void)setUpgradeCostLeaves:(NSInteger)cost;
-(void)setUpgradeCostCoins:(NSInteger)cost;
//define boundary for collisions
-(CGRect) getBounds;

@end
