//
//  OneFloorViewController.m
//  Microlending
//
//  Created by guest user on 11/9/12.
//
//

#import "OneFloorViewController.h"

@class MicrolendingAppDelegate;
@class CitadelViewController;
@class ViewFurniture;

@implementation OneFloorViewController

@synthesize addFloor;
@synthesize coins, leaves, level;
@synthesize myFurnitureView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        appDelegate = [[UIApplication sharedApplication] delegate];
    }
    return self;
}

//add a new floor
-(IBAction)buyFloor
{
    int numFloor = [appDelegate.citadelData integerForKey:@"floors"];
    numFloor +=1;
    NSLog(@"numFloor: %d", numFloor);
    CitadelViewController *OFmyCitadel = [[CitadelViewController alloc] init];
    [self.navigationController initWithRootViewController:OFmyCitadel];
    [OFmyCitadel displayFloors:numFloor];
    [appDelegate.citadelData setInteger:numFloor forKey:@"floors"];
    NSLog(@"floors: %d", [appDelegate.citadelData integerForKey:@"floors"]);
    [OFmyCitadel release];
}

//display the furniture
-(void)displayFurniture
{
    NSData *myFurniture = [appDelegate.citadelData objectForKey:@"furniture"];
    NSMutableArray *myfurniture = [NSKeyedUnarchiver unarchiveObjectWithData:myFurniture];
    for (int k=0; k < myfurniture.count; k++) {
        NSLog(@"My Furniture: %@", [myfurniture objectAtIndex:k]);
        NSString *myImage = [[myfurniture objectAtIndex:k]itemName];
        NSLog(@"name: %@", myImage);
        UIImage *furnitureImage = [[myfurniture objectAtIndex:k]furnPic]; 
        myFurnitureView = [[ViewFurniture alloc]initWithImage:furnitureImage];
        myFurnitureView.center = CGPointMake([[myfurniture objectAtIndex:k]xPos], [[myfurniture objectAtIndex:k]yPos]);

        [self.view addSubview:myFurnitureView];
    }
}
/*
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
 //   NSLog(@"%@", @"touchesEnded! OneFloorViewController");
    UITouch *myTouch = [[event allTouches]anyObject];
    myFurnitureView.center = [myTouch locationInView:self.view];
    NSLog(@"x pos: %f",[myTouch locationInView:self.view].x);
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"coins: %d", [appDelegate.citadelData integerForKey:@"coins"]);

    coins.text = [NSString stringWithFormat:@"%d",[appDelegate.citadelData integerForKey:@"coins"]];
    leaves.text = [NSString stringWithFormat:@"%@",[appDelegate.citadelData objectForKey:@"leaves"]];
    level.text = [NSString stringWithFormat:@"%@",[appDelegate.citadelData objectForKey:@"playerLevel"]];
    
    //display furniture
    [self displayFurniture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
