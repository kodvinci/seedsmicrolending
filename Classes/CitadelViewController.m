//
//  CitadelViewController.m
//  Microlending
//
//  Created by guest user on 9/29/12.
//
//

#import "CitadelViewController.h"

//@class FloorViewController;
@class Floor;
@class MicrolendingAppDelegate;
@class Seedling;
@class Citadel;
@class Furniture;
@class Plot;
@class StoreViewController;
@class OneFloorViewController;
@class TwoFloorsViewController;
@class ThreeFloorsViewController;

@implementation CitadelViewController

@synthesize numOfFloors;
@synthesize level;
@synthesize seedlingID;
@synthesize furniture;
@synthesize seedlings;
@synthesize defaults;
@synthesize plot1;
@synthesize myFirstSeedling;
@synthesize playerCoins, playerLeaves, playerLevel, playerXP;

-(IBAction)furnitureStore
{
    StoreViewController *CVmyFurniture = [[StoreViewController alloc] init];
	[self.navigationController pushViewController:CVmyFurniture animated:YES];
    [CVmyFurniture release];
}

//GAME DEFAULTS
- (IBAction)begin
{
    //Add mechanism to WARN the user that they are about to set the game defaults. Doing so will erase whatever level they had achieved previously
    
   appDelegate.citadelData = [NSUserDefaults standardUserDefaults];
    
    //Player Variables
    playerXP = 1;
    playerLevel = 1;
    playerCoins = 1700;
    playerLeaves = 0;
    //Store player variables
    [appDelegate.citadelData setInteger:playerXP forKey:@"experience"];
    [appDelegate.citadelData setInteger:playerLevel forKey:@"playerLevel"];
    [appDelegate.citadelData setInteger:playerCoins forKey:@"coins"];
    [appDelegate.citadelData setInteger:playerLeaves forKey:@"leaves"];
    
    //Citadel Variables
    numOfFloors = 1;
    level = 1;
    seedlingID = 1;
    
    //Farm Plot
    plot1 = [[Plot alloc]init];
    [plot1 initWithLevel:1];
    NSLog(@"Plot1: %@", [plot1 itemName]);
    furniture  = [[NSMutableArray alloc] initWithObjects: nil];
    [furniture addObject:plot1];
    NSData *furnData = [NSKeyedArchiver archivedDataWithRootObject:furniture];
    
    //seedling
/*    NSString *seed = [[NSString alloc] initWithFormat:@"myseed"];
    myFirstSeedling = [[Seedling alloc]initWithImage:@"seedling" seedlingName:seed];
    seedlings = [[NSMutableArray alloc]initWithObjects: nil];
    [seedlings addObject:myFirstSeedling];
    NSData *seedData = [NSKeyedArchiver archivedDataWithRootObject:seedlings];
*/
    // Store the data
    [appDelegate.citadelData setInteger:numOfFloors forKey:@"floors"];
    [appDelegate.citadelData setInteger:level forKey:@"level"];
    [appDelegate.citadelData setObject:furnData forKey:@"furniture"];
  //  [appDelegate.citadelData setObject:seedData forKey:@"seedlings"];
    [appDelegate.citadelData synchronize];
    NSLog(@"Data saved");
    
    //Add mechanism to inform user that the game defaults have been set and that they can now hit the 'PLAY' button to start playing the game
}

-(IBAction)play
{
    //set up the Citadel
    Citadel *myCitadel = [[Citadel alloc]init];
    myCitadel.citadelDelegate = self;
    [myCitadel initialize];
    [myCitadel release]; 
}

-(void)citadelSetUpDone:(BOOL)result
{
    NSLog(@"%@", @"citadelSetUpDone!");
    if (result) {
        //Use the saved information for display
        NSLog(@"Number of floors: %@", [appDelegate.citadelData objectForKey:@"floors"]);
        NSInteger number = [appDelegate.citadelData integerForKey:@"floors"];
        
        [self displayFloors:number];

    }
}

-(void)displayFloors:(NSInteger)howmany
{
    NSLog(@"One floor %@", self.navigationController);

    if (howmany == 1) {
        NSLog(@"One floor %@", @"in..");
        OneFloorViewController *CVmyFloor1 = [[OneFloorViewController alloc]init];
        [self.navigationController pushViewController:CVmyFloor1 animated:YES];
        [CVmyFloor1 release];
    }
    
    if (howmany == 2) {
        NSLog(@"Two floor %@", @"in..");
        TwoFloorsViewController *CVmyFloor2 = [[TwoFloorsViewController alloc]init];
        [self.navigationController pushViewController:CVmyFloor2 animated:YES];
        [CVmyFloor2 release];
    }
    
    if (howmany == 3) {
        NSLog(@"Three floor %@", @"in..");
        ThreeFloorsViewController *CVmyFloor3 = [[ThreeFloorsViewController alloc]init];
        [self.navigationController pushViewController:CVmyFloor3 animated:YES];
        [CVmyFloor3 release];
    }

}
/*
-(void)needToRefreshView:(BOOL)result
{
    NSLog(@"CitadelViewController: %@", @"needToRefreshView!");
    if (result) {
        NSLog(@"NumFloors: %@", [appDelegate.citadelData objectForKey:@"floors"]);
        FloorViewController *myCitadelFloors = [[FloorViewController alloc] init];
        [self.navigationController pushViewController:myCitadelFloors animated:YES];
        
        [myCitadelFloors release];
    }
    
}
*/
- (void)viewDidLoad
{
    self.title = @"Citadel";
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
