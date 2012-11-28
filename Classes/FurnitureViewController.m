//
//  FurnitureViewController.m
//  Microlending
//
//  Created by guest user on 11/1/12.
//
//

#import "FurnitureViewController.h"

@class MicrolendingAppDelegate;
@class CitadelViewController;

@implementation FurnitureViewController

@synthesize furnName;
@synthesize furnCost;
@synthesize furnitureName;
@synthesize cost;
@synthesize furnitureImage;
@synthesize furnImage;
@synthesize segmentedControl;
@synthesize className;
@synthesize upgradeCoins, upgradeLeaves, upCoins, upLeaves;
@synthesize furnDesire1, furnDesire2;
@synthesize furnReward1, furnReward2, users;
@synthesize desire1, desire2, reward1, reward2, numUsers;
@synthesize level1, level2, level3;
@synthesize furnitureArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil className:(NSString *) name
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        appDelegate = [[UIApplication sharedApplication]delegate];
        furnitureArray = [[NSMutableArray alloc] init];
        
        furnName = name;
        
        id myClass = [[NSClassFromString(name) alloc] init];
        [myClass initWithLevel:1];
        furnImage = [myClass furnPic];
        furnCost = [myClass purchaseCost];
        upgradeCoins = 0;
        upgradeLeaves = 0;
        furnDesire1 = [myClass desire1];
        furnDesire2 = [myClass desire2];
        furnReward1 = [myClass happinessReward1];
        furnReward2 = [myClass happinessReward2];
        users = [myClass users];
        self.level1 = YES;
        self.level2 = NO;
        self.level3 = NO;
        NSLog(@"furnCost: %d", furnCost);
        [self viewWillAppear:YES];
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(IBAction)segmentedControlIndexChanged
{
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            NSLog(@"case: %@", @"0");
            id myClass1 = [[NSClassFromString(furnName) alloc] init];
            [myClass1 initWithLevel:1];
            furnCost = [myClass1 purchaseCost];
            upgradeLeaves = 0;
            upgradeCoins = 0;
            furnDesire1 = [myClass1 desire1];
            furnDesire2 = [myClass1 desire2 ];
            furnReward1 = [myClass1 happinessReward1];
            furnReward2 = [myClass1 happinessReward2 ];
            users = [myClass1 users ];
            self.level1 = YES;
            self.level2 = NO;
            self.level3 = NO;
            NSLog(@"furnCost: %d", furnCost);
            [self viewDidLoad];
          
            break;

        case 1:
            NSLog(@"case: %@", @"1");
            id myClass2 = [[NSClassFromString(furnName) alloc] init];
            [myClass2 initWithLevel:2];
            upgradeLeaves = [myClass2 leavesCost];
            upgradeCoins = [myClass2 coinsCost ];
            furnDesire1 = [myClass2 desire1];
            furnDesire2 = [myClass2 desire2 ];
            furnReward1 = [myClass2 happinessReward1];
            furnReward2 = [myClass2 happinessReward2 ];
            users = [myClass2 users];
            self.level1 = NO;
            self.level2 = YES;
            self.level3 = NO;
            NSLog(@"upgradeLeaves: %d", upgradeLeaves);
            [self viewDidLoad];
            
            break;
        
        case 2:
            NSLog(@"case: %@", @"2");
            id myClass3 = [[NSClassFromString(furnName) alloc] init];
            [myClass3 initWithLevel:3];
            upgradeLeaves = [myClass3 leavesCost];
            upgradeCoins = [myClass3 coinsCost ];
            furnDesire1 = [myClass3 desire1];
            furnDesire2 = [myClass3 desire2 ];
            furnReward1 = [myClass3 happinessReward1];
            furnReward2 = [myClass3 happinessReward2 ];
            users = [myClass3 users];
            self.level1 = NO;
            self.level2 = NO;
            self.level3 = YES;
            NSLog(@"upgradeLeaves: %d", upgradeLeaves);
            [self viewDidLoad];
            
            break;
            
        default:
            break;
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [furnitureName becomeFirstResponder];
    
    [furnitureImage setImage:furnImage];
    furnitureName.text = furnName;
    cost.text = [NSString stringWithFormat:@"%d", furnCost];
    upCoins.text = [NSString stringWithFormat:@"%d", upgradeCoins];
    upLeaves.text = [NSString stringWithFormat:@"%d", upgradeLeaves];
    desire1.text = furnDesire1;
    desire2.text = furnDesire2;
    reward1.text = [NSString stringWithFormat:@"%d", furnReward1];
    reward2.text = [NSString stringWithFormat:@"%d", furnReward2];
    numUsers.text = [NSString stringWithFormat:@"%d", users];
}

-(IBAction)buyFurniture
{
    if (level1 == YES) {
        //Buy level 1 furniture
        id furniture1 = [[NSClassFromString(furnName) alloc] init];
        [furniture1 initWithLevel:1];
        //check if I can afford it...
        NSInteger myCoins = [appDelegate.citadelData integerForKey:@"coins"];
        if (myCoins >= [furniture1 purchaseCost] ) {
            //Can afford it
            //Add it to my array of furniture
            NSData *myFurniture1 = [appDelegate.citadelData objectForKey:@"furniture"];
            NSArray *myArray = [NSKeyedUnarchiver unarchiveObjectWithData:myFurniture1];
            [furnitureArray addObjectsFromArray:myArray];
            
            [furnitureArray addObject:furniture1];
            NSData *furnData = [NSKeyedArchiver archivedDataWithRootObject:furnitureArray];
            [appDelegate.citadelData setObject:furnData forKey:@"furniture"];
            //subtract cost
            myCoins = myCoins - [furniture1 purchaseCost];
            [appDelegate.citadelData setInteger:myCoins forKey:@"coins"];

            //Display the bought furniture on floor
            CitadelViewController *FVmyCitadel = [[CitadelViewController alloc] init];
            [self.navigationController initWithRootViewController:FVmyCitadel];
            [FVmyCitadel displayFloors:[appDelegate.citadelData integerForKey:@"floors"]];
            [FVmyCitadel release];
        }
        else
        {
            //Inform player they can't afford it
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Not Enough Coins!" message:@"Please earn more coins in order to afford this piece of furniture." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            alert.tag=1;
            [alert show];
            [alert release];
        }
    }
    
    if (level2 == YES) {
        //Upgrade furniture to level 2
        id furniture2 = [[NSClassFromString(furnName) alloc] init];
        [furniture2 initWithLevel:2];
    }
    else if (level3 == YES) {
        //Upgrade furniture to level 3
        id furniture3 = [[NSClassFromString(furnName) alloc] init];
        [furniture3 initWithLevel:1];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (alertView.tag==1) {
        // NO = 0, YES = 1
        if(buttonIndex == 0){
            // DO whatever "NO" is
        }
        else {
            // Do whatever "YES" is
        }
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)dealloc
{
    [super dealloc];
  //  [furnName release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
