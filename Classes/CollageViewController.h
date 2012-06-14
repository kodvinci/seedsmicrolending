//
//  CollageViewController.h
//  Microlending
//
//  Created by Leonard ngeno on 06/11/2012.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Lender.h"
#import "MicrolendingAppDelegate.h"
#import "PatchButton.h"


@class Lender;
@class MicrolendingAppDelegate;
@interface CollageViewController : UIViewController <UIScrollViewDelegate> {

    Lender *current_lender;
    MicrolendingAppDelegate *appDelegate;
    
}

@property (nonatomic, retain) UIView *wrapper_view;
@property (nonatomic, retain) Lender* current_lender;

@end
