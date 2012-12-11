//
//  FurnitureViewController.h
//  Microlending
//
//  Created by Leonard Ng'eno on 11/1/12.
//
//

#import <UIKit/UIKit.h>
#import "MicrolendingAppDelegate.h"
#import "CitadelViewController.h"
#import "Pool.h"
#import "WaterBed.h"
#import "Hammock.h"
#import "BookShelf.h"

@interface FurnitureViewController : UIViewController 
{
    MicrolendingAppDelegate *appDelegate;
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
    BOOL level1;
    BOOL level2;
    BOOL level3;
    NSMutableArray *furnitureArray;
    
    //HUD variables
    IBOutlet UILabel *coins;
    IBOutlet UILabel *leaves;
    IBOutlet UILabel *level;
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
@property(nonatomic, assign) BOOL level1;
@property(nonatomic, assign) BOOL level2;
@property(nonatomic, assign) BOOL level3;
@property(nonatomic, retain) NSMutableArray *furnitureArray;
@property(nonatomic, retain) UILabel *coins;
@property(nonatomic, retain) UILabel *leaves;
@property(nonatomic, retain) UILabel *level;

-(IBAction) segmentedControlIndexChanged;
-(IBAction)buyFurniture;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil className:(NSString *) name;

@end
