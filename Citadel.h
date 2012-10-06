//
//  Citadel.h
//  Microlending
//
//  Created by guest user on 9/29/12.
//
//

#import <Foundation/Foundation.h>

@interface Citadel : NSObject {
    NSInteger *floors;
    NSArray *furniture;
}

@property(nonatomic, assign) NSInteger *floors;
@property(nonatomic, retain) NSArray *furniture;


-(void)initWithFloors:(NSInteger *) numberOfFloors;

@end