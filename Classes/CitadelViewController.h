//
//  CitadelViewController.h
//  Microlending
//
//  Created by guest user on 9/29/12.
//
//

#import <UIKit/UIKit.h>
#import "FloorViewController.h"
#import "Floor.h"
#import "MicrolendingAppDelegate.h"
#import "Seedling.h"
#import "Citadel.h"

@interface CitadelViewController : UIViewController {
    MicrolendingAppDelegate *appDelegate;
    CGRect myFrame;    
    NSInteger numOfFloors;
    NSInteger level;
    NSInteger seedlingID;
    NSMutableArray *furniture;
    NSMutableArray *seedlings;
    NSUserDefaults *defaults;
}

@property(nonatomic, assign) NSInteger numOfFloors;
@property(nonatomic, assign) NSInteger level;
@property(nonatomic, assign) NSInteger seedlingID;
@property(nonatomic, retain) NSMutableArray *furniture;
@property(nonatomic, retain) NSMutableArray *seedlings;
@property(nonatomic, retain) NSUserDefaults *defaults;

-(IBAction)play;
-(IBAction)begin;

@end
