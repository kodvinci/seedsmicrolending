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

@interface FloorViewController : UIViewController {
    
    IBOutlet UIScrollView *scrollView;
    CGRect floorOne;

}

@property(nonatomic, retain)UIScrollView *scrollView;
@end
