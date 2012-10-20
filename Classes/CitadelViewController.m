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

@implementation CitadelViewController

@synthesize numOfFloors;
@synthesize level;
@synthesize seedlingID;
@synthesize furniture;
@synthesize seedlings;
@synthesize defaults;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)begin
{
    //Add mechanism to WARN the user that they are about to set the game defaults. Doing so will erase whatever level they had achieved previously 
    
    // Create variables to store Citadel information
    numOfFloors = 1; 
    level = 1;
    furniture  = [[NSMutableArray alloc] initWithObjects:@"pool", @"hammock", nil];
    seedlingID = 1;
    Seedling *myFirstSeedling = [[Seedling alloc] initWithImage:@"seedling1"];
    [seedlings addObject:myFirstSeedling];
                                                
    // Store the data
    defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:numOfFloors forKey:@"floors"];
    [defaults setInteger:level forKey:@"level"];
    [defaults setInteger:seedlingID forKey:@"seedling"];
    [defaults setObject:furniture forKey:@"furniture"];
    [defaults setObject:seedlings forKey:@"seedlings"];
    [defaults synchronize];
    NSLog(@"Data saved");
    
    //Not sure if this works. 
    appDelegate.citadelData = defaults;
    
    //Add mechanism to inform user that the game defaults have been set and that they can now hit the 'PLAY' button to start playing the game
}

-(IBAction)play
{
 //   NSLog(@"started play");
    FloorViewController *onefloor = [[FloorViewController alloc] init];
    [self.navigationController pushViewController:onefloor animated:YES];
    
    [onefloor release];
}

-(void)didFinishSettingFloor:(BOOL) result
{
    
}

- (void)viewDidLoad
{
    self.title = @"Gaia";
    appDelegate = [[UIApplication sharedApplication] delegate];
    //set up all the floor items
    Floor *floorItems = [[Floor alloc] init];
    [floorItems initializeFloorItems];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
