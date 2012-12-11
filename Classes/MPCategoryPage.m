//
//  MPCategoryPage.m
//  Microlending
//
//  Created by Leonard Ng'eno on 09/25/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MPCategoryPage.h"
#import "MPViewController.h"
#import "MicrolendingAppDelegate.h"
#import "PayButtonViewController.h"

@class MPViewController;
@class MicrolendingAppDelegate;
@class PayButtonViewController;

@implementation MPCategoryPage

@synthesize scrollView;
@synthesize thisAmount;


-(IBAction)pressedAgriculture {
	
	//MicrolendingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	//[appDelegate.currentLender incrementCategoriesNumber];
	
	MPViewController *newMP = [[MPViewController alloc] init];
	newMP.selectedCategory = [[NSString alloc] initWithString:@"Agriculture"];
	[self.navigationController pushViewController:newMP animated:YES];
	[newMP release];
	
}

-(IBAction)pressedHealth {
	
	//MicrolendingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	//[appDelegate.currentLender incrementCategoriesNumber];
	
	MPViewController *newMP = [[MPViewController alloc] init];
	newMP.selectedCategory = [[NSString alloc] initWithString:@"Health"];
	[self.navigationController pushViewController:newMP animated:YES];
	[newMP release];
	
}


-(IBAction)pressedHandmade {
	
	//MicrolendingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	//[appDelegate.currentLender incrementCategoriesNumber];
	
	MPViewController *newMP = [[MPViewController alloc] init];
	newMP.selectedCategory = [[NSString alloc] initWithString:@"Handmade Goods"];
	[self.navigationController pushViewController:newMP animated:YES];
	[newMP release];
	
}

-(IBAction)pressedZaBiashara {
  	MPViewController *newMP = [[MPViewController alloc] init];
	newMP.selectedCategory = [[NSString alloc] initWithString:@"Za Biashara"];
	[self.navigationController pushViewController:newMP animated:YES];
	[newMP release];
  
}

- (IBAction)pressedOthers {
/*
    UIAlertView* dialog = [[UIAlertView alloc] init];
    [dialog setDelegate:self];
    [dialog setTitle:@"Do you want to lend to Seeds' borrowers in the Chicago area?"];
    [dialog addButtonWithTitle:@"NO"];
    [dialog addButtonWithTitle:@"YES"];
    
    [dialog show];
    [dialog release]; */
    UIActionSheet *asheet = [[UIActionSheet alloc] initWithTitle:@"Wanna lend to Chicago borrowers? Please select the amount."
                                                        delegate:self
                                               cancelButtonTitle:@"Cancel"
                                          destructiveButtonTitle:nil
                                               otherButtonTitles:@"$1", @"$5", @"$10",@"$20", nil];
    [asheet showFromTabBar:appDelegate.tabBarController.tabBar];
    [asheet release];

}
/*
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        NSLog (@"%@", @"NO");
    }
    else {
        NSLog (@"%@", @"YES");
        
        UIActionSheet *asheet = [[UIActionSheet alloc] initWithTitle:@"Please select amount to lend."
                                                            delegate:self
                                                   cancelButtonTitle:@"Cancel"
                                              destructiveButtonTitle:nil
                                                   otherButtonTitles:@"$1", @"$5", @"$10",@"$20", nil];
        [asheet showFromTabBar:appDelegate.tabBarController.tabBar];
        [asheet release];
    }
} */

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{

    if (buttonIndex != actionSheet.cancelButtonIndex && buttonIndex != 4) {
    
        self.thisAmount = 0;
    
        if (buttonIndex == 0) {
            thisAmount = [[NSDecimalNumber alloc] initWithUnsignedInteger:1];
            NSLog(@"Amount is: %@",thisAmount);
            appDelegate.myCredit = thisAmount;
            NSLog(@"appDelegate.myCredit is: %@", appDelegate.myCredit);
        } else if (buttonIndex == 1) {
            thisAmount = [[[NSDecimalNumber alloc] initWithUnsignedInteger:5]retain];
            appDelegate.myCredit = thisAmount;
        } else if (buttonIndex == 2) {
            thisAmount = [[[NSDecimalNumber alloc] initWithUnsignedInteger:10]retain];
            appDelegate.myCredit = thisAmount;
        } else if (buttonIndex == 3) {
            thisAmount = [[[NSDecimalNumber alloc] initWithUnsignedInteger:20]retain];
            appDelegate.myCredit = thisAmount;
        }
    
        PayButtonViewController *pbv = [[PayButtonViewController alloc] init];
    
        [self.navigationController pushViewController:pbv animated:YES];

    }
}

-(void)transactionsuccessful:(NSString *) payKey {
    NSLog (@"%@", @"paybutton Delegate called this method!");
    [appDelegate.currentLender addCredit:thisAmount];
	
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	self.navigationItem.title = @"Choose a Category";
    appDelegate = [[UIApplication sharedApplication] delegate];

    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload]; 
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[scrollView release];
    [thisAmount release];
    [super dealloc];
}


@end
