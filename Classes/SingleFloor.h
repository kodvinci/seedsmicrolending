//
//  FloorTest.h
//  Microlending
//
//  Created by guest user on 10/2/12.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "MicrolendingAppDelegate.h"
#import "FloorViewController.h"
#import "SeedlingView.h"
#import "ViewFurniture.h"
#import "Citadel.h"
#import "Seedling.h"

@interface SingleFloor : UIView 
{
    MicrolendingAppDelegate *appDelegate;
    CGRect floor1;
    CGRect floor2;
    CGRect floor3;
    CGRect floor4;
    CGRect floor5;
    
    CGPoint pos;
    CGPoint center;
    UIImage *seedling;
    SeedlingView *mySeedling;
    NSTimer *myTime;
    NSInteger height;
    NSInteger numFloors;
    UIImage *furniture;
    ViewFurniture *myFun;
}

@property(nonatomic, retain) UIImage *seedling;
@property(nonatomic, retain) UIImage *furniture;
@property(nonatomic, retain) SeedlingView *mySeedling;
@property(nonatomic, retain)NSTimer *myTime;
@property(nonatomic, retain) ViewFurniture *myFun;

@end
