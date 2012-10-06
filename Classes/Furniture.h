//
//  Furniture.h
//  Microlending
//
//  Created by guest user on 10/4/12.
//
//

#import <Foundation/Foundation.h>

@interface Furniture : NSObject {
    NSString *itemID;
    NSString *itemName;
    NSInteger itemLevel;
    NSInteger users;
    NSTimeInterval *useTime;
    NSInteger itemWidth;
    NSString *happinessDesire;
    NSInteger happinessReward;
    NSInteger coinsCost;
    NSInteger leavesCost;
}

@property(nonatomic, retain) NSString *itemID;
@property(nonatomic, retain) NSString *itemName;
@property(nonatomic, assign) NSTimeInterval *useTime;
@property(nonatomic, retain) NSString *happinessDesire;
@property(nonatomic, assign) NSInteger itemLevel;
@property(nonatomic, assign) NSInteger users;
@property(nonatomic, assign) NSInteger itemWidth;
@property(nonatomic, assign) NSInteger happinessReward;
@property(nonatomic, assign) NSInteger coinsCost;
@property(nonatomic, assign) NSInteger leavesCost;

@end
