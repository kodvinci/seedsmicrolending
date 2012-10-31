//
//  Floor.h
//  Microlending
//
//  Created by guest user on 9/29/12.
//
//

#import <Foundation/Foundation.h>

@protocol FloorDelegate <NSObject>

-(void)didFinishSettingFloor:(BOOL)result;

@end

@interface Floor : NSObject {
    //Floor variables
    NSInteger floorID;
    NSInteger playerLevelReq;
    NSInteger floorCoinsCost;
    NSInteger earlyUnlockCost;
    NSInteger growTime;
    NSMutableArray *floorFurniture;
    
    id floorDelegate;

}

@property(nonatomic, assign) NSInteger playerLevelReq;
@property(nonatomic, assign) NSInteger floorCoinsCost;
@property(nonatomic, assign) NSInteger earlyUnlockCost;
@property(nonatomic, retain) id floorDelegate;
@property(nonatomic, assign) NSInteger floorID;
@property(nonatomic, retain) NSMutableArray *floorFurniture;

-(void)initWithGrowTime:(NSInteger) growTime;
-(void)initImmediately;
@end
