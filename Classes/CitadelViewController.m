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

@implementation CitadelViewController

@synthesize numOfFloors;
@synthesize level;
@synthesize seedlingID;
@synthesize furniture;

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
    // Create strings to store the text info
    numOfFloors = [[NSString alloc] initWithString:@"1"];
    level = [[NSString alloc] initWithString:@"1"];
    furniture  = [[NSMutableArray alloc] initWithObjects:@"pool", @"hammock", nil];
    seedlingID = 1;
                                                
    // Store the data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:numOfFloors forKey:@"floors"];
    [defaults setObject:level forKey:@"level"];
    [defaults setInteger:seedlingID forKey:@"seedling"];
    [defaults setObject:furniture forKey:@"furniture"];
    [defaults synchronize];
    NSLog(@"Data saved");
    
//    FloorViewController *myfloor = [[FloorViewController alloc] init];
//	[self.navigationController pushViewController:myfloor animated:YES];
    
//    [myfloor release];
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
