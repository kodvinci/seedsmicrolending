//
//  CitadelViewController.m
//  Microlending
//
//  Created by guest user on 9/29/12.
//
//

#import "CitadelViewController.h"

@class FloorViewController;
@class Floor;
@class MicrolendingAppDelegate;
@class Seedling;
@class Citadel;
@class Furniture;
@class Pool;
@class StoreViewController;


@implementation CitadelViewController

@synthesize numOfFloors;
@synthesize level;
@synthesize seedlingID;
@synthesize furniture;
@synthesize seedlings;
@synthesize defaults;
@synthesize poolFurn;
@synthesize myFirstSeedling;

/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}*/

-(IBAction)furnitureStore
{
    StoreViewController *myFurniture = [[StoreViewController alloc] init];
	[self.navigationController pushViewController:myFurniture animated:YES];
    [myFurniture release];
}

- (IBAction)begin
{
    //Add mechanism to WARN the user that they are about to set the game defaults. Doing so will erase whatever level they had achieved previously 
   
    // Create variables to store Citadel information
    numOfFloors = 1;
    level = 1;
    seedlingID = 1;
    //pool
//    UIImage *poolPic = [UIImage imageNamed:@"pool"];
    poolFurn = [Pool alloc ];
    [poolFurn initWithLevel:1];
    furniture  = [[NSMutableArray alloc] initWithObjects: nil];
    [furniture addObject:poolFurn];
    NSData *furnData = [NSKeyedArchiver archivedDataWithRootObject:furniture];
    //seedling
    myFirstSeedling = [[Seedling alloc] initWithImage:@"seedling1"];
    seedlings = [[NSMutableArray alloc]initWithObjects: nil];
    [seedlings addObject:myFirstSeedling];
    NSData *seedData = [NSKeyedArchiver archivedDataWithRootObject:seedlings];
                                        
    // Store the data
    appDelegate.citadelData = [NSUserDefaults standardUserDefaults];
    [appDelegate.citadelData setInteger:numOfFloors forKey:@"floors"];
    [appDelegate.citadelData setInteger:level forKey:@"level"];
    [appDelegate.citadelData setInteger:seedlingID forKey:@"seedling"];
    [appDelegate.citadelData setObject:furnData forKey:@"furniture"];
    [appDelegate.citadelData setObject:seedData forKey:@"seedlings"];
    [appDelegate.citadelData synchronize];
    NSLog(@"Data saved");
    
    //Add mechanism to inform user that the game defaults have been set and that they can now hit the 'PLAY' button to start playing the game
}

-(IBAction)play
{
    //set up the Citadel
    Citadel *myCitadel = [Citadel alloc];
    myCitadel.citadelDelegate = self;
    [myCitadel initialize];
    
}

-(void)citadelSetUpDone:(BOOL)result
{
    NSLog(@"%@", @"citadelSetUpDone!");
    if (result) {
        //Use the saved information for display
        NSLog(@"Number of floors: %@", [appDelegate.citadelData objectForKey:@"floors"]);
        
        FloorViewController *myCitadelFloors = [[FloorViewController alloc] init];
        [self.navigationController pushViewController:myCitadelFloors animated:YES];
        
        [myCitadelFloors release];
    }
}
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

- (void)viewDidLoad
{
    self.title = @"Gaia";
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
