//
//  ResourceViewController.h
//  Microlending
//
//  Created by guest user on 11/4/12.
//
//

#import <UIKit/UIKit.h>
#import "InAppPurchaseManager.h"

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

@end
