//
//  Citadel.h
//  Microlending
//
//  Created by guest user on 9/29/12.
//
//

#import <Foundation/Foundation.h>
#import "MicrolendingAppDelegate.h"
#import "Seedling.h"

@protocol CitadelDelegate <NSObject>

-(void)citadelSetUpDone:(BOOL)result;

@end

@interface Citadel : NSObject {
    MicrolendingAppDelegate *appDelegate;
    NSInteger citFloors;
    NSMutableArray *citFurniture;
    NSInteger level;
    NSMutableArray *citSeedlings;
    id citadelDelegate;
    
    //Not sure if we need these variables/properties
    NSInteger totalHeight;
    NSString *floorID;
    NSInteger seedlingID;
    
}

@property(nonatomic, assign) NSInteger citFloors;
@property(nonatomic, retain) NSMutableArray *citFurniture;
@property(nonatomic, assign) NSInteger level;
@property(atomic, retain) NSMutableArray *citSeedlings;
@property(nonatomic, retain) id citadelDelegate;

-(void)initialize;
-(void)addFloor;
-(void)addSeedling;
-(void)addFurniture;
-(void)saveChanges:(NSString *)thisChanged;

@end