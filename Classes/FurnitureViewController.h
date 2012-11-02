//
//  FurnitureViewController.h
//  Microlending
//
//  Created by guest user on 11/1/12.
//
//

#import <UIKit/UIKit.h>
#import "Pool.h"
#import "WaterBed.h"
#import "Hammock.h"
#import "BookShelf.h"

@interface FurnitureViewController : UIViewController 
{
    Class className;
    NSString *furnName;
    NSInteger furnCost;
    UIImage *furnImage;
    NSInteger upgradeCoins;
    NSInteger upgradeLeaves;
    NSString *furnDesire1, *furnDesire2;
    NSInteger furnReward1, furnReward2, users;
    IBOutlet UILabel *furnitureName;
    IBOutlet UILabel *cost;
    IBOutlet UIImageView *furnitureImage;
    IBOutlet UISegmentedControl *segmentedControl;
    IBOutlet UILabel *upCoins;
    IBOutlet UILabel *upLeaves;
    IBOutlet UILabel *desire1;
    IBOutlet UILabel *desire2;
    IBOutlet UILabel *reward1;
    IBOutlet UILabel *reward2;
    IBOutlet UILabel *numUsers;
}

@property(nonatomic, assign) Class className;
@property(nonatomic, retain) NSString *furnName;
@property(nonatomic, retain) NSString *furnDesire1;
@property(nonatomic, retain) NSString *furnDesire2;
@property(nonatomic, assign) NSInteger furnCost;
@property(nonatomic, assign) NSInteger upgradeCoins;
@property(nonatomic, assign) NSInteger upgradeLeaves;
@property(nonatomic, assign) NSInteger furnReward1;
@property(nonatomic, assign) NSInteger furnReward2;
@property(nonatomic, assign) NSInteger users;
@property(nonatomic, retain) UILabel *furnitureName;
@property(nonatomic, retain) UILabel *cost;
@property(nonatomic, retain) UIImageView *furnitureImage;
@property(nonatomic, retain) UIImage *furnImage;
@property (nonatomic,retain) UISegmentedControl *segmentedControl;
@property(nonatomic, retain) UILabel *upCoins;
@property(nonatomic, retain) UILabel *upLeaves;
@property(nonatomic, retain) UILabel *desire1;
@property(nonatomic, retain) UILabel *desire2;
@property(nonatomic, retain) UILabel *reward1;
@property(nonatomic, retain) UILabel *reward2;
@property(nonatomic, retain) UILabel *numUsers;

-(IBAction) segmentedControlIndexChanged;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil className:(NSString *) name;

@end
