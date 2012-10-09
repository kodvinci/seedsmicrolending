//
//  FloorViewController.h
//  Microlending
//
//  Created by guest user on 10/2/12.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SingleFloor.h"
#import "SeedlingView.h"
@interface FloorViewController : UIViewController {
    
    IBOutlet UIScrollView *scrollView;
    CGRect floorOne;
    UIImage *seedling;
    NSArray *images;
    SeedlingView *mySeedling;
    CGPoint pos;
    NSTimer *myTime;
}

@property(nonatomic, retain)UIScrollView *scrollView;
@property(nonatomic, retain)UIImage *seedling;
@property(nonatomic, retain)NSArray *images;
@property(nonatomic, retain)SeedlingView *mySeedling;
@property(nonatomic, retain)NSTimer *myTime;
@end
