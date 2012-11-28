//
//  SeedlingDataViewController.h
//  Microlending
//
//  Created by guest user on 11/21/12.
//
//

#import <UIKit/UIKit.h>
#import "MicrolendingAppDelegate.h"

@interface SeedlingDataViewController : UIViewController
{
    NSArray *myseedlings;
    MicrolendingAppDelegate *appDelegate;
    UIImage *seedlingImage;
    NSString *myDesire1;
    NSString *myDesire2;
    NSString *myDesire3;
    IBOutlet UIImageView *seedImage;
    IBOutlet UILabel *desire1;
    IBOutlet UILabel *desire2;
    IBOutlet UILabel *desire3;
    NSInteger happiness;
    NSString *seedlingName;
    NSString *hairType;
    NSString *hairColor;
    NSString *bodyType;
    NSString *bodyColor;
    NSString *faceType;
    IBOutlet UILabel *happinessL;
    IBOutlet UILabel *seedlingNameL;
    IBOutlet UILabel *hairTypeL;
    IBOutlet UILabel *hairColorL;
    IBOutlet UILabel *bodyTypeL;
    IBOutlet UILabel *bodyColorL;
    IBOutlet UILabel *faceTypeL;
}

@property(nonatomic, retain) NSArray *myseedlings;
@property(nonatomic, retain) UIImage *seedlingImage;
@property(nonatomic, retain) NSString *myDesire1;
@property(nonatomic, retain) NSString *myDesire2;
@property(nonatomic, retain) NSString *myDesire3;
@property(nonatomic, retain) UIImageView *seedImage;
@property(nonatomic, retain) UILabel *desire1;
@property(nonatomic, retain) UILabel *desire2;
@property(nonatomic, retain) UILabel *desire3;
@property(nonatomic, assign) NSInteger happiness;
@property(nonatomic, retain) NSString *seedlingName;
@property(nonatomic, retain) NSString *hairType;
@property(nonatomic, retain) NSString *hairColor;
@property(nonatomic, retain) NSString *bodyType;
@property(nonatomic, retain) NSString *bodyColor;
@property(nonatomic, retain) NSString *faceType;
@property(nonatomic, retain) UILabel *happinessL;
@property(nonatomic, retain) UILabel *seedlingNameL;
@property(nonatomic, retain) UILabel *hairTypeL;
@property(nonatomic, retain) UILabel *hairColorL;
@property(nonatomic, retain) UILabel *bodyTypeL;
@property(nonatomic, retain) UILabel *bodyColorL;
@property(nonatomic, retain) UILabel *faceTypeL;

@end
