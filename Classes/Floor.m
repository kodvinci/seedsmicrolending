//
//  Floor.m
//  Microlending
//
//  Created by guest user on 9/29/12.
//
//

#import "Floor.h"

@implementation Floor
    
@synthesize furniture;
@synthesize numOfFloors;
@synthesize level;
@synthesize floorDelegate;
@synthesize floorID;

-(void)initializeFloorItems
{
    NSLog(@"%@", @"In initializeFloor");
    // Get the stored data before the view loads
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    numOfFloors = [defaults objectForKey:@"floors"];
    level = [defaults objectForKey:@"level"];
    seedlingID = [defaults integerForKey:@"seedling"];
    furniture = [defaults objectForKey:@"furniture"];
   
    NSLog(@"%@",@"Finished Initializing floor items");
    [self.floorDelegate didFinishSettingFloor:YES];
    
    NSLog(@"%@", numOfFloors);
    NSLog(@"%@", level);
    NSLog(@"%d", seedlingID);
    NSLog(@"%@", furniture);
}

//Method called when the top of the current floor is tapped to purchase an additional floor
-(void)addFloor
{
    
}

@end
