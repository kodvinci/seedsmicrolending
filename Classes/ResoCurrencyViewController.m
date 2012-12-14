//
//  ResoCurrencyViewController.m
//  Microlending
//
//  Created by Leonard Ng'eno on 11/4/12.
//
//

#import "ResoCurrencyViewController.h"

@class ResourceViewController;
@class CrystalViewController;

@implementation ResoCurrencyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)xp
{
    ResourceViewController *myReso = [[ResourceViewController alloc] initWithNibName:@"ResourceViewController" bundle:nil resourceName:@"xp"];
    
    [self.navigationController pushViewController:myReso animated:YES];
    [myReso release];
}

-(IBAction)coin
{
    ResourceViewController *myReso = [[ResourceViewController alloc] initWithNibName:@"ResourceViewController" bundle:nil resourceName:@"coin"];
    
    [self.navigationController pushViewController:myReso animated:YES];
    [myReso release];
}

-(IBAction)leaf
{
    ResourceViewController *myReso = [[ResourceViewController alloc] initWithNibName:@"ResourceViewController" bundle:nil resourceName:@"leaf"];
    
    [self.navigationController pushViewController:myReso animated:YES];
    [myReso release];
}

-(IBAction)crystal
{
    CrystalViewController *myCrstal = [[CrystalViewController alloc]initWithStyle:UITableViewCellStyleSubtitle]; //allow for subtitles
    [self.navigationController pushViewController:myCrstal animated:YES];
    [myCrstal release];
}

-(void)fromInAppPurchase
{
    NSLog(@"fromInAppPurchase");
    ResourceViewController *myReso1 = [[ResourceViewController alloc] initWithNibName:@"ResourceViewController" bundle:nil resourceName:@"leaf"];
    
    [self.navigationController pushViewController:myReso1 animated:YES];
    [myReso1 release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Currency Resources";
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
