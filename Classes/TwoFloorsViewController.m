//
//  TwoFloorsViewController.m
//  Microlending
//
//  Created by guest user on 11/9/12.
//
//

#import "TwoFloorsViewController.h"

@class MicrolendingAppDelegate;

@implementation TwoFloorsViewController

@synthesize floor1, floor2, addFloor;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        appDelegate = [[UIApplication sharedApplication]delegate];
    }
    return self;
}

//add a new floor
-(IBAction)buyFloor
{
    int numFloor = [appDelegate.citadelData integerForKey:@"floors"];
    numFloor +=1;
    NSLog(@"numFloor: %d", numFloor);
    CitadelViewController *myCitadel = [[CitadelViewController alloc] init];
    [self.navigationController initWithRootViewController:myCitadel];
    [myCitadel displayFloors:numFloor];
    [appDelegate.citadelData setInteger:numFloor forKey:@"floors"];
    NSLog(@"floors: %d", [appDelegate.citadelData integerForKey:@"floors"]);
    [myCitadel release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [floor1 setImage:[UIImage imageNamed:@"citadel1"]];
    floor1.contentMode = UIViewContentModeScaleAspectFill;
    [floor2 setImage:[UIImage imageNamed:@"citadel2"]];
    floor2.contentMode = UIViewContentModeTop;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
