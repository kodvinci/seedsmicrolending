//
//  CitadelViewController.m
//  Microlending
//
//  Created by Leonard Ng'eno on 9/29/12.
//
//

#import "CitadelViewController.h"

@class MicrolendingAppDelegate;
@class Seedling;
@class Citadel;
@class Furniture;
@class Plot;
@class StoreViewController;
@class FloorViewController;
@class NameGenerator;
@class SeedlingV2;
@class SeedlingV2View;

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
@synthesize plots;

//Button that opens the view that contains the furniture and currency store
-(IBAction)furnitureStore
{
    StoreViewController *CVmyFurniture = [[StoreViewController alloc] init];
	[self.navigationController pushViewController:CVmyFurniture animated:YES];
    [CVmyFurniture release];
}

//GAME DEFAULTS
- (IBAction)begin
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"WARNING!" message:@"Setting game to beginner level!" delegate:self cancelButtonTitle:@"CANCEL" otherButtonTitles:@"CONTINUE", nil];
    alert.tag=1;
    [alert show];
    [alert release];
    
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
            [self reset];
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

-(void)reset
{
    appDelegate.citadelData = [NSUserDefaults standardUserDefaults];
    
    //Player Variables
    playerXP = 1;
    playerLevel = 1;
    playerCoins = 1500;
    playerLeaves = 0;
    //Store player variables
    [appDelegate.citadelData setInteger:playerXP forKey:@"experience"];
    [appDelegate.citadelData setInteger:playerLevel forKey:@"playerLevel"];
    [appDelegate.citadelData setInteger:playerCoins forKey:@"coins"];
  //  [appDelegate.citadelData setInteger:playerLeaves forKey:@"leaves"];
    
    //Number of floors in the citadel
    numOfFloors = 2;
    [appDelegate.citadelData setInteger:numOfFloors forKey:@"floors"];
    
    //Farm Plot
    plot1 = [[Plot alloc]init];
    [plot1 initWithLevel:1];
    NSLog(@"Plot1: %@", [plot1 itemName]);
    plots = [[NSMutableDictionary alloc]init];
    [plots setObject:plot1 forKey:@"1"];
    NSData *plotData = [NSKeyedArchiver archivedDataWithRootObject:plots];
    [appDelegate.citadelData setObject:plotData forKey:@"plot"];
    
    // Default seedling
    SeedlingV2 *mySeedling = [[SeedlingV2 alloc]init];
    [mySeedling generateNewSeedlingCharacteristics];
    NSLog(@"My Seed: %@",[mySeedling myName]);
    seedlings = [[NSMutableArray alloc]initWithObjects: nil];
    [seedlings addObject:mySeedling];
    NSData *seedData = [NSKeyedArchiver archivedDataWithRootObject:seedlings];
    [appDelegate.citadelData setObject:seedData forKey:@"seedlings"];
    
    //Citadel Furniture, set to 0
    NSData *furnData = [NSKeyedArchiver archivedDataWithRootObject:nil];
    [appDelegate.citadelData setObject:furnData forKey:@"furniture"];
    
    [appDelegate.citadelData synchronize];
    NSLog(@"Data saved");
    
    //inform user that the game defaults have been set and that they can now hit the 'PLAY' button to start playing the game
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"WELCOME!" message:@"Press the PLAY button to begin game!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    alert.tag=2;
    [alert show];
    [alert release];
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
        FloorViewController *CVmyFloor1 = [[FloorViewController alloc]initWithNibName:@"OneFloorViewController" bundle:nil];
        [self.navigationController pushViewController:CVmyFloor1 animated:YES];
        [CVmyFloor1 release];
    }
    
    if (howmany == 2) {
        NSLog(@"Two floors %@", @"in..");
        
        FloorViewController *CVmyFloor2 = [[FloorViewController alloc]initWithNibName:@"TwoFloorsViewController" bundle:nil];
        [self.navigationController pushViewController:CVmyFloor2 animated:YES];
        [CVmyFloor2 release];
    }
    
    if (howmany == 3) {
        NSLog(@"Three floors %@", @"in..");
        FloorViewController *CVmyFloor3 = [[FloorViewController alloc]initWithNibName:@"ThreeFloorsViewController" bundle:nil];

        [self.navigationController pushViewController:CVmyFloor3 animated:YES];
        [CVmyFloor3 release];
    }
    
    if (howmany == 4) {
        NSLog(@"Four floors %@", @"in..");
        FloorViewController *CVmyFloor4 = [[FloorViewController alloc]initWithNibName:@"FourFloorsViewController" bundle:nil];
        
        [self.navigationController pushViewController:CVmyFloor4 animated:YES];
        [CVmyFloor4 release];
    }
    if (howmany == 5) {
        NSLog(@"Five floors %@", @"in..");
        FloorViewController *CVmyFloor5 = [[FloorViewController alloc]initWithNibName:@"FiveFloorsViewController" bundle:nil];
        
        [self.navigationController pushViewController:CVmyFloor5 animated:YES];
        [CVmyFloor5 release];
    }

}

- (void)viewDidLoad
{
    self.title = @"Home";
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

-(void)dealloc
{
    [super dealloc];
    [plot1 release];
    [plots release];
}

@end

