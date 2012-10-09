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
    NSMutableArray *furniture;
    NSString *numOfFloors;
    NSString *level;
    NSString *floorID;
    NSInteger seedlingID;
    id floorDelegate;

}

@property(nonatomic, retain) NSMutableArray *furniture;
@property(nonatomic, retain) NSString * numOfFloors;
@property(nonatomic, retain) NSString *level;
@property(nonatomic, retain) id floorDelegate;
@property(nonatomic, retain) NSString *floorID;
@property(nonatomic, assign) NSInteger seedlingID;

-(void)initializeFloorItems;
-(void)addFloor;

@end
