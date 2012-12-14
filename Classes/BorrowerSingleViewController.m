//
//  BorrowerSingleViewController.m
//  Microlending
//
//  Created by Leonard Ng'eno on 10/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BorrowerSingleViewController.h"
#import "Borrower.h"
#import "SBJson.h"
#import "MicrolendingAppDelegate.h"
#import "Sender.h"
#import "Lender.h"
#import "Badge.h"
#import "Transaction.h"

@class Borrower;
@class Sender;
@class Lender;
@class Badge;
@class Transaction;

@implementation BorrowerSingleViewController

@synthesize borrowerImage, nameLabel, categoryLabel, loansRecievedLabel, 
description, investButton, borrowerID, nameField, howMuchTheyHave, 
howMuchTheyNeed, statusBar, amountNeededLabel, amountReceivedLabel;


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(IBAction)pressedInvest {
	
	UIActionSheet *asheet = [[UIActionSheet alloc] initWithTitle:@"Select an amount" 
														delegate:self 
											   cancelButtonTitle:@"Cancel" 
										  destructiveButtonTitle:nil 
											   otherButtonTitles:@"$10", @"$20", @"$50",@"$100",@"Custom", nil];
    [asheet showFromTabBar:appDelegate.tabBarController.tabBar];
    [asheet release];
	
	
}

-(void)makeInvestement:(NSInteger)thisAmount {
	
//	MFMessageComposeViewController *controller = [[[MFMessageComposeViewController alloc] init] autorelease];
//	if([MFMessageComposeViewController canSendText])
//	{
//		controller.body = [[NSString alloc] initWithFormat:@"Send: %i.00 to borrower@borrower.com",thisAmount];
//		controller.recipients = [NSArray arrayWithObjects:@"729725",nil];
//		controller.messageComposeDelegate = self;
//		[self presentModalViewController:controller animated:YES];
//	}
	
	if (howMuchTheyNeed == howMuchTheyHave) {
		UIAlertView* dialog = [[UIAlertView alloc] init];
		[dialog setDelegate:self];
		[dialog setTitle:@"Their loan is already complete!"];
		[dialog setMessage:@""];
		[dialog addButtonWithTitle:@"OK"];
		[dialog show];
		[dialog release];
	} else if ((howMuchTheyHave + thisAmount) > howMuchTheyNeed) {
		UIAlertView* dialog = [[UIAlertView alloc] init];
		[dialog setDelegate:self];
		[dialog setTitle:@"You are trying to loan too much"];
		[dialog setMessage:@""];
		[dialog addButtonWithTitle:@"OK"];
		[dialog show];
		[dialog release];
	} else if (thisAmount < appDelegate.currentLender.credit) {
		
		[appDelegate.currentLender addBadge:@"1"];

			
		[appDelegate.currentLender subtractCredit:thisAmount];
		
		if (howMuchTheyHave == 0) {
			[appDelegate.currentLender incrementTheLevelNumberBecauseOfSpecificBorrower];
		}
		
		
		[appDelegate.currentLender incrementCategoriesNumber];
		
		
		[appDelegate.currentLender addXP:(thisAmount * 2)];
		
		NSString *amountString = [[NSString alloc] initWithFormat:@"%i",thisAmount];
		
		Transaction *newTransaction = [[Transaction alloc] initFromLender:appDelegate.currentLender.uid 
															   toBorrower:self.borrowerID 
														   withThisAmount:amountString];
		[amountString release];
		
		[appDelegate.currentLender addTransaction:newTransaction];
		[newTransaction release];
		

		[[[appDelegate.tabBarController viewControllers] objectAtIndex:3] popViewControllerAnimated:YES];
		
//		UIAlertView* dialog = [[UIAlertView alloc] init];
//		[dialog setDelegate:self];
//		[dialog setTitle:@"Congratulations"];
//		[dialog setMessage:@"Your investment was succesful"];
//		[dialog addButtonWithTitle:@"Cool"];
//		[dialog show];
//		[dialog release];
		
		//[self.navigationController popViewControllerAnimated:YES];
		
		
	} else {
		UIAlertView* dialog = [[UIAlertView alloc] init];
		[dialog setDelegate:self];
		[dialog setTitle:@"You don't have enough credit!"];
		[dialog setMessage:@"Sorry"];
		[dialog addButtonWithTitle:@"OK"];
		[dialog show];
		[dialog release];
	}

	
	
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
	
	
	
	
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	
	if (buttonIndex != actionSheet.cancelButtonIndex && buttonIndex != 4) {
	
		int x = 0;
		
		if (buttonIndex == 0) {
			x = 10;
		} else if (buttonIndex == 1) {
			x = 20;
		} else if (buttonIndex == 2) {
			x = 50;
		} else if (buttonIndex == 3) {
			[appDelegate.currentLender addBadge:@"3"];
			[appDelegate.currentLender addBadge:@"7"];
			x = 100;
		}		
		[self makeInvestement:x];
		

		//Takes you back to profile page automatically
		
	
		//appDelegate.tabBarController.selectedIndex = 0;
		
	} 
	
	if (buttonIndex == 4) {
		
		
		UIAlertView* dialog = [[UIAlertView alloc] init];
		[dialog setDelegate:self];
		[dialog setTitle:@"Enter Amount"];
		[dialog setMessage:@" "];
		[dialog addButtonWithTitle:@"Cancel"];
		[dialog addButtonWithTitle:@"OK"];
		
		nameField = [[UITextField alloc] initWithFrame:CGRectMake(20.0, 45.0, 245.0, 25.0)];
		[nameField setBackgroundColor:[UIColor whiteColor]];
		[nameField setKeyboardType:UIKeyboardTypeNumberPad];
		[dialog addSubview:nameField];
		[nameField becomeFirstResponder];
		[dialog show];
		[dialog release];
		
		
	}
	
	
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
	
	if (buttonIndex == 1) {
		[self makeInvestement:[nameField.text intValue]];
	}
	
	
}

-(void)viewDidAppear:(BOOL)animated {
		
	double theyHave = howMuchTheyHave;
	double theyNeed = howMuchTheyNeed;
	
	double percent = theyHave / theyNeed;
	
	CGRect newFrame = statusBar.frame;
	newFrame.size.width = 260 * percent;
	statusBar.frame = newFrame;
	
	[statusBar setHidden:NO];
	
	amountNeededLabel.text = [[NSString alloc] initWithFormat:@"Amount Needed: %i",howMuchTheyNeed];
	amountReceivedLabel.text = [[NSString alloc] initWithFormat:@"Amount Received: %i",howMuchTheyHave];
	
	[super viewDidAppear:YES];	
	
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
	 appDelegate = [[UIApplication sharedApplication] delegate];
	
	[self.investButton setBackgroundImage:[[UIImage imageNamed:@"whiteButton4.png"] 
										stretchableImageWithLeftCapWidth:12.0 
										topCapHeight:0] 
							  forState:UIControlStateNormal];
	
    [borrowerImage setImage:[[UIImage imageNamed:@"borrower.png"] autorelease]];
    [super viewDidLoad];
	

    
    // Do any additional setup after loading the view from its nib.
}


- (void)viewDidUnload
{
    [borrowerImage release];
	[nameLabel release];
	[categoryLabel release];
	[loansRecievedLabel release];
	[description release];
	[investButton release];
	[borrowerID release];
	[nameField release];
	[statusBar release];
	[amountNeededLabel release];
	[amountReceivedLabel release];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
