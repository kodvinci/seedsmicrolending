//
//  FurnitureViewController.m
//  Microlending
//
//  Created by Leonard Ng'eno on 11/1/12.
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
@synthesize coins, leaves, level;

//Initialization method. The name parameter determines what furniture class item the view controller was initialized with.

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil className:(NSString *) name
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
        
        //Buy button
        UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button3 addTarget:self action:@selector(buyFurniture:) forControlEvents:UIControlEventTouchUpInside];
        [button3 setTitle:@"Purchase" forState:UIControlStateNormal];
        [button3 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        [button3 setBackgroundImage:[UIImage imageNamed:@"NavBarImage.png"] forState:UIControlStateNormal];
        button3.frame = CGRectMake(90.0, 315.0, 90.0, 45.0);
        [self.view addSubview:button3];
        
        [self viewWillAppear:YES];
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

//This method uses switch statements to determine which level of furniture the player pressed. The values of the various property items of the furniture are then displayed for the corresponding level.
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
          
            //Buy button
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button addTarget:self action:@selector(buyFurniture:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitle:@"Purchase" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"NavBarImage.png"] forState:UIControlStateNormal];
            button.frame = CGRectMake(90.0, 315.0, 90.0, 45.0);
            [self.view addSubview:button];
            
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
            
            UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button1 addTarget:self action:@selector(upgradeFurniture:) forControlEvents:UIControlEventTouchUpInside];
            [button1 setTitle:@"UpgradeF" forState:UIControlStateNormal];
            [button1 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
            [button1 setBackgroundImage:[UIImage imageNamed:@"NavBarImage.png"] forState:UIControlStateNormal];
            button1.frame = CGRectMake(90.0, 315.0, 90.0, 45.0);
            [self.view addSubview:button1];
            
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
            
            UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button2 addTarget:self action:@selector(upgradeFurniture:) forControlEvents:UIControlEventTouchUpInside];
            [button2 setTitle:@"UpgradeF" forState:UIControlStateNormal];
            [button2 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
            [button2 setBackgroundImage:[UIImage imageNamed:@"NavBarImage.png"] forState:UIControlStateNormal];
            button2.frame = CGRectMake(90.0, 315.0, 90.0, 45.0);
            [self.view addSubview:button2];
            
            break;
            
        default:
            break;
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = furnName; //Title of view
    
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
    
    //HUD variables
    coins.text = [NSString stringWithFormat:@"%d",[appDelegate.citadelData integerForKey:@"coins"]];
    leaves.text = [NSString stringWithFormat:@"%@",[appDelegate.citadelData objectForKey:@"leaves"]];
    level.text = [NSString stringWithFormat:@"%@",[appDelegate.citadelData objectForKey:@"playerLevel"]];
}

/*
This is the method that is called when the purchase button is pressed for level 1 furniture. The method handles the purchase of the furniture. If the purchase is successful, a instance of the CitadelViewController is called which then loads the citadel floors to display the seedlings and furniture the player owns.
 */
-(void)buyFurniture:(id)sender
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

            [appDelegate.citadelData synchronize];
            
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
}

//This method handles furniture upgrades. It checks to make sure that the player actually has level one of the furniture before it can upgrade to other levels.

-(void)upgradeFurniture:(id)sender
{
    //Check if I have this furniture in my furniture array first
    NSData *myFurniture1 = [appDelegate.citadelData objectForKey:@"furniture"];
    NSMutableArray *myArray = [[NSMutableArray alloc]initWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:myFurniture1]];
    int furnitureToRemove;
    
    NSLog(@"myArray Size, %d", [myArray count]);
    
    BOOL IhaveHaveIt = NO;
    
    for (int k=0; k<[myArray count] ; k++) {
        if ([[[myArray objectAtIndex:k]itemName] isEqualToString:furnName]) {
            NSLog(@"I have this furniture");
            IhaveHaveIt = YES;
            furnitureToRemove = k;
            break;
        }
    }
    
    if (IhaveHaveIt == YES) {
        NSLog(@"Can upgrade it");
        
        NSInteger myOriginalCoins = [appDelegate.citadelData integerForKey:@"coins"];
        NSInteger myOriginalLeaves = [appDelegate.citadelData integerForKey:@"leaves"];
        
        if (level2 == YES) {
            //Upgrade furniture to level 2
            id furniture2 = [[NSClassFromString(furnName) alloc] init];
            [furniture2 initWithLevel:2];
            
            //check if I have enough upgrade coins
            if (myOriginalCoins >= [furniture2 coinsCost]) {
                //upgrade using coins
                [myArray removeObjectAtIndex:furnitureToRemove];
                [myArray addObject:furniture2];
                NSData *furnData = [NSKeyedArchiver archivedDataWithRootObject:myArray];
                [appDelegate.citadelData setObject:furnData forKey:@"furniture"];

                NSInteger newCoins = myOriginalCoins - [furniture2 coinsCost];
                [appDelegate.citadelData setInteger:newCoins forKey:@"coins"];
                [appDelegate.citadelData synchronize];
                
                //Display the upgraded furniture on floor
                CitadelViewController *FVmyCitadel = [[CitadelViewController alloc] init];
                [self.navigationController initWithRootViewController:FVmyCitadel];
                [FVmyCitadel displayFloors:[appDelegate.citadelData integerForKey:@"floors"]];
                [FVmyCitadel release];
            }
            else if (myOriginalCoins < [furniture2 coinsCost] && myOriginalLeaves >= [furniture2 leavesCost]) {
                //upgrade using leaves
                [myArray removeObjectAtIndex:furnitureToRemove];
                [myArray addObject:furniture2];
                NSData *furnData = [NSKeyedArchiver archivedDataWithRootObject:myArray];
                [appDelegate.citadelData setObject:furnData forKey:@"furniture"];
                
                NSInteger newLeaves = myOriginalLeaves - [furniture2 leavesCost];
                [appDelegate.citadelData setInteger:newLeaves forKey:@"leaves"];
                [appDelegate.citadelData synchronize];
                
                //Display the upgraded furniture on floor
                CitadelViewController *FVmyCitadel = [[CitadelViewController alloc] init];
                [self.navigationController initWithRootViewController:FVmyCitadel];
                [FVmyCitadel displayFloors:[appDelegate.citadelData integerForKey:@"floors"]];
                [FVmyCitadel release];
            }
            else {
                //Not enough currency for an upgrade
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upgrade Not Possible!" message:@"You do not have enough coins or leaves to upgrade the furniture." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                alert.tag=3;
                [alert show];
                [alert release];
            }
        }
        else if (level3 == YES) {
            //Upgrade furniture to level 3
            id furniture3 = [[NSClassFromString(furnName) alloc] init];
            [furniture3 initWithLevel:3];
            //check if I have enough upgrade coins
            if (myOriginalCoins >= [furniture3 coinsCost]) {
                //upgrade using coins
                [myArray removeObjectAtIndex:furnitureToRemove];
                [myArray addObject:furniture3];
                NSData *furnData = [NSKeyedArchiver archivedDataWithRootObject:myArray];
                [appDelegate.citadelData setObject:furnData forKey:@"furniture"];
                
                NSInteger newCoins = myOriginalCoins - [furniture3 coinsCost];
                [appDelegate.citadelData setInteger:newCoins forKey:@"coins"];
                [appDelegate.citadelData synchronize];
                
                //Display the upgraded furniture on floor
                CitadelViewController *FVmyCitadel = [[CitadelViewController alloc] init];
                [self.navigationController initWithRootViewController:FVmyCitadel];
                [FVmyCitadel displayFloors:[appDelegate.citadelData integerForKey:@"floors"]];
                [FVmyCitadel release];

            }
            else if (myOriginalCoins < [furniture3 coinsCost] && myOriginalLeaves >= [furniture3 leavesCost]) {
                //upgrade using leaves
                [myArray removeObjectAtIndex:furnitureToRemove];
                [myArray addObject:furniture3];
                NSData *furnData = [NSKeyedArchiver archivedDataWithRootObject:myArray];
                [appDelegate.citadelData setObject:furnData forKey:@"furniture"];
                
                NSInteger newLeaves = myOriginalLeaves - [furniture3 leavesCost];
                [appDelegate.citadelData setInteger:newLeaves forKey:@"leaves"];
                [appDelegate.citadelData synchronize];
                
                //Display the upgraded furniture on floor
                CitadelViewController *FVmyCitadel = [[CitadelViewController alloc] init];
                [self.navigationController initWithRootViewController:FVmyCitadel];
                [FVmyCitadel displayFloors:[appDelegate.citadelData integerForKey:@"floors"]];
                [FVmyCitadel release];
            }
            else {
                //Not enough currency for an upgrade
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upgrade Not Possible!" message:@"You do not have enough coins or leaves to upgrade the furniture." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                alert.tag=4;
                [alert show];
                [alert release];
            }

        }
    }
    
    else {
        NSLog(@"I haven't bought this type of furniture before");
        //Inform player they can't upgrade a furniture they don't have
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upgrade Not Possible!" message:@"You need to buy level 1 of this furniture before you can be able to upgrade it." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        alert.tag=2;
        [alert show];
        [alert release];
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
    if (alertView.tag==2) {
        // NO = 0, YES = 1
        if(buttonIndex == 0){
            // DO whatever "NO" is
        }
        else {
            // Do whatever "YES" is
        }
    }
}

//Remove the ugraded furniture from the array of furniture
-(void)removeFurnitureWithName:(NSString *)furnitureName
{
    
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
