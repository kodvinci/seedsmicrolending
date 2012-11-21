//
//  FloorViewController.m
//  Microlending
//
//  Created by guest user on 10/2/12.
//
//
/*
#import "FloorViewController.h"

@class Citadel;
@class SingleFloor;
@class SeedlingView;
@class Pool;
@class MicrolendingAppDelegate;
@class ViewFurniture;

@implementation FloorViewController

@synthesize scrollView;
@synthesize seedling;
@synthesize mySeedling;
@synthesize myTime;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
} 

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%@", @"viewWillApper!");

    [super viewWillAppear:YES];
}

- (void)viewDidLoad
{
    NSLog(@"%@", @"viewDidLoad!");
    
    appDelegate = [[UIApplication sharedApplication] delegate];

    //create frame & init SingleFloor using frame
  //  floorOne = CGRectMake(0, 0, 320, 460);
    SingleFloor *myFloor = [[SingleFloor alloc] initWithFrame: CGRectMake(0, 0, 320, 370)];
    [self.view addSubview:myFloor];
    [self.view setNeedsDisplay];
    
    //TO_DO
    //Find a way of not displaying this when max floors or unable to add floor
    
    //add purchase button in top floor for buying extra floor
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button addTarget:self action:@selector(newFloor:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor greenColor]];
    [button setTitle:@"new floor" forState:UIControlStateNormal];
    
    button.frame = CGRectMake(0.0, 0.0, 320.0, 20.0);
    [self.view addSubview:button];
    
//    [myFloor release];
 //   [self displayFurniture];
 
    [super viewDidLoad];
}

-(void) newFloor:(id)sender
{
    NSLog(@"%@", @"Implement purchase of a new floor!");
    Citadel *iCit = [Citadel alloc];
    [iCit addFloor];
    
}

-(void)displayFurniture
{
    NSData *myFurniture = [appDelegate.citadelData objectForKey:@"furniture"];
    NSMutableArray *myfurniture = [NSKeyedUnarchiver unarchiveObjectWithData:myFurniture];
    for (int k=0; k < myfurniture.count; k++) {
        NSLog(@"My Furniture: %@", [myfurniture objectAtIndex:k]);
        NSString *item = [[myfurniture objectAtIndex:k] itemName];
        NSLog(@"My furniture name: %@", item);

    }
}

-(void)moveSeedlingAround
{
    NSLog(@"%@", @"in moveSeedlingAround!");
    mySeedling.center = CGPointMake(mySeedling.center.x+pos.x, mySeedling.center.y+pos.y);
    if (mySeedling.center.x > 320 || mySeedling.center.x < 0) {
        pos.x = -pos.x;
    }
    if (mySeedling.center.y > 370 || mySeedling.center.y < 0) {
        pos.y = -pos.y;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", @"touchesMoved! FloorViewController");
    UITouch *myTouch = [[event allTouches]anyObject];
    mySeedling.center = [myTouch locationInView:self.view];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
*/