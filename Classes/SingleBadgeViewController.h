//
//  SingleBadgeViewController.h
//  Microlending
//
//  Created by Cody Kolodziejzyk on 11/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SingleBadgeViewController : UIViewController {
	
	NSString *nameString;
	NSString *descriptionString;
	IBOutlet UILabel *nameLabel;
	IBOutlet UITextView *descriptionLabel;

}

@property (nonatomic, retain) NSString *nameString;
@property (nonatomic, retain) NSString *descriptionString;
@property (nonatomic, retain) UILabel *nameLabel;
@property (nonatomic, retain) UITextView *descriptionLabel;



@end
