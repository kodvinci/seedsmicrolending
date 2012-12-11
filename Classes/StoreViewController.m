//
//  StoreViewController.m
//  Microlending
//
//  Created by Leonard Ng'eno on 11/4/12.
//
//

#import "StoreViewController.h"

@class BuyFurnitureViewController;
@class ResoCurrencyViewController;

@implementation StoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)currencystore
{
    ResoCurrencyViewController *myFurniture = [[ResoCurrencyViewController alloc] init];
	[self.navigationController pushViewController:myFurniture animated:YES];
    [myFurniture release];
    
}

-(IBAction)furniturestore
{
    BuyFurnitureViewController *myFurniture = [[BuyFurnitureViewController alloc] init];
	[self.navigationController pushViewController:myFurniture animated:YES];
    [myFurniture release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Store";
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
