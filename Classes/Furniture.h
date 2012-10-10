//
//  Furniture.h
//  Microlending
//
//  Created by guest user on 10/4/12.
//
//

#import <Foundation/Foundation.h>

@interface Furniture : NSObject {

    NSString *itemName;
    NSString *desire1;
    NSString *desire2;
    NSInteger itemLevel;
    NSInteger users;
    NSInteger useTime;
    NSInteger itemWidth;
    NSInteger desireReward;
    NSInteger happinessReward;
    NSInteger coinsCost;
    NSInteger leavesCost;
}

@property(nonatomic, retain) NSString *itemName;
@property(nonatomic, retain) NSString *desire1;
@property(nonatomic, retain) NSString *desire2;
@property(nonatomic, assign) NSInteger useTime;
@property(nonatomic, assign) NSInteger desireReward;
@property(nonatomic, assign) NSInteger itemLevel;
@property(nonatomic, assign) NSInteger users;
@property(nonatomic, assign) NSInteger itemWidth;
@property(nonatomic, assign) NSInteger happinessReward;
@property(nonatomic, assign) NSInteger coinsCost;
@property(nonatomic, assign) NSInteger leavesCost;

-(void)initWithName:(NSString *)furnitureName level:(NSInteger)furnitureLevel;
-(void)purchaseFurniture;
-(void)interactWithFurniture;

@end
