//
//  MPCategoryPage.h
//  Microlending
//
//  Created by Cody Kolodziejzyk on 11/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MPCategoryPage : UIViewController {
	
	IBOutlet UIScrollView *scrollView;

}

@property (nonatomic, retain) UIScrollView *scrollView;

-(IBAction)pressedCake:(id)sender;
-(IBAction)pressedFish:(id)sender;
-(IBAction)pressedSelf:(id)sender;


@end
