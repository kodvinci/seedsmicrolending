//
//  ResourceViewController.h
//  Microlending
//
//  Created by Leonard Ng'eno on 11/4/12.
//
//

#import <UIKit/UIKit.h>
#import "InAppPurchaseManager.h"
#import "MicrolendingAppDelegate.h"

@interface ResourceViewController : UIViewController 
{
    IBOutlet UIImageView *furnitureImage;
    UIImage *furnImage;
    NSInteger number;
    IBOutlet UILabel *num;
    NSString *furnitureName;
    IBOutlet UILabel *furnName;
    NSString *description;
    IBOutlet UILabel *furnDesc;
    MicrolendingAppDelegate *appDelegate;
}

@property(nonatomic, retain) UIImageView *furnitureImage;
@property(nonatomic, retain) UIImage *furnImage;
@property(nonatomic, assign) NSInteger number;
@property(nonatomic, retain) UILabel *num;
@property(nonatomic, retain) NSString *furnitureName;
@property(nonatomic, retain) UILabel *furnName;
@property(nonatomic, retain) NSString *description;
@property(nonatomic, retain) UILabel *furnDesc;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil resourceName:(NSString *) name;
-(void)viewDidLoad;
-(void)viewWillAppear:(BOOL)animated;

@end
