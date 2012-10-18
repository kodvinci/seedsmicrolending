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

@interface CitadelViewController : UIViewController {
    MicrolendingAppDelegate *appDelegate;
    CGRect myFrame;    
    NSString *numOfFloors;
    NSString *level;
    NSInteger seedlingID;
    NSMutableArray *furniture;
}

@property(nonatomic, retain) NSString *numOfFloors;
@property(nonatomic, retain) NSString *level;
@property(nonatomic, assign) NSInteger seedlingID;
@property(nonatomic, retain) NSMutableArray *furniture;

-(IBAction)play;
-(IBAction)begin;

@end
