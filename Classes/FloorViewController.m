//
//  FloorViewController.m
//  Microlending
//
//  Created by guest user on 10/2/12.
//
//

#import "FloorViewController.h"

@class SingleFloor;
@class SeedlingView;
@class Pool;

@implementation FloorViewController

@synthesize scrollView;
@synthesize seedling;
@synthesize images;
@synthesize mySeedling;
@synthesize myTime;

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
} */

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%@", @"viewWillApper!");

    [super viewWillAppear:YES];
}
- (void)viewDidLoad
{
    NSLog(@"%@", @"viewDidLoad!");
    //(X speed, Y speed)
    pos = CGPointMake(1.0, 1.0);
    //convert png image to UIImage
    seedling = [UIImage imageNamed:@"seedling.png"];
    //create frame
    floorOne = CGRectMake(0, 0, 320, 460);
    
    SingleFloor *myFloor = [[SingleFloor alloc] initWithFrame:floorOne];
    mySeedling = [[SeedlingView alloc] initWithImage:seedling];
    //Center the seedling
    mySeedling.center = CGPointMake(160, 230);
    
    [self.view addSubview:myFloor];
    [self.view addSubview:mySeedling];
    NSLog(@"%@", @"Just added subView!");
    //launch Seedling
    myTime = [NSTimer scheduledTimerWithTimeInterval:(0.03) target:self selector:@selector(moveSeedlingAround) userInfo:nil repeats:YES];
   
    //add purchase button in top floor for buying extra floor
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(newFloor:) forControlEvents:UIControlEventTouchDown];
    [button setTitle:@"Buy Floor" forState:UIControlStateNormal];
    button.frame = CGRectMake(0.0, 0.0, 80.0, 30.0);
    [self.view addSubview:button];
    
    [myFloor release];
    
 //   Pool *myPool = [[Pool alloc] init];
    
    [super viewDidLoad];
}
/*
-(void)newFloor
{
   NSLog(@"%@", @"Implement purchase of a new floor!"); 
} */

-(void)moveSeedlingAround
{
    NSLog(@"%@", @"in moveAround!");
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
    //??
    NSLog(@"%@", @"touchesMoved! FloorViewController");
    UITouch *myTouch = [[event allTouches]anyObject];
    mySeedling.center = [myTouch locationInView:self.view];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
