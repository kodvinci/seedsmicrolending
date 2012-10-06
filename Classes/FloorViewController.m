//
//  FloorViewController.m
//  Microlending
//
//  Created by guest user on 10/2/12.
//
//

#import "FloorViewController.h"

@class SingleFloor;

@implementation FloorViewController

@synthesize scrollView;


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
    floorOne = CGRectMake(0, 0, 320, 460);
    NSLog(@"%@", @"viewDidLoad!");
    SingleFloor *myFloor = [[SingleFloor alloc] initWithFrame:floorOne];
    [self.view addSubview:myFloor];
    NSLog(@"%@", @"Just added a subView!");
    [myFloor release];
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
