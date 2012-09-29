//
//  ProfileViewController.m
//  Microlending
//
//  Created by Leonard Ngeno on 06/22/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ProfileViewController.h"
#import "BadgeViewController.h"
#import "Lender.h"
#import "InvestmentTableViewController.h"
#import "MicrolendingAppDelegate.h"
#import "SBJson.h"
#import "SBJsonParser.h"
#import "Grabber.h"
#import "Sender.h"
#import "CollageViewController.h"
#import "MyBadgesTableViewController.h"
#import "Sender.h"
#import "Logout.h"
#import "PayButtonViewController.h"

@class MicrolendingAppDelegate;
@class BadgeViewController;
@class Lender;
@class Grabber;
@class Sender;
@class MyBadgesTableViewController;
@class Sender;
@class Logout;
@class PayButtonViewController;

@implementation ProfileViewController

@synthesize userImage;
@synthesize roundedCorners;
@synthesize roundedCorners2;
@synthesize currentUser;
@synthesize usernameLabel;
@synthesize userClassLabel;
@synthesize totalInvestmentsLabel;
@synthesize totalXPLabel;
@synthesize statusBar;
@synthesize statusBar2;
@synthesize buttonOne;
@synthesize buttonTwo;
@synthesize buttonThree;
@synthesize buttonFour;
@synthesize creditLabel;
@synthesize buttonFive;
@synthesize buttonSix;
@synthesize nameField;
@synthesize thisAmount;


-(void)pressedLogOff:(id)sender {
//	exit(0); //addition.
    
    Logout *newSender = [[Logout alloc] initWithParams:@"users" apiName:@"logout" tokenToBeDeleted:appDelegate.loginView.authentication_token apiCall:@"DELETE"];
    
    newSender.logDelegate = self;
    [newSender release];
	
}

-(void)tokenAck:(NSData *)recievedData {

    NSString *receiver;
    receiver = [recievedData valueForKey:@"message"];
    
      if ([receiver isEqualToString:@"Token destroyed"]) {
          NSLog(@"message is: %@", receiver);
          [receiver release];
          
          LoginViewController *newLogin = [[LoginViewController alloc] init];
          
          [appDelegate.tabBarController presentModalViewController:newLogin animated:NO];

          [newLogin release];
      } 
}


-(void)setProfileImage:(NSUInteger)userID { 
    if (userID) { 
        [userImage setImage:[UIImage imageNamed:@"male_avatar.png"]];
	} 
}

-(void)setLengthOfStatusBar {
	
  	double boom = [[appDelegate.userClasses valueForKey:appDelegate.userclass] doubleValue];

    NSLog(@"boom: %f", boom);

	double percent = [appDelegate.totalXP intValue] / boom;
	
	CGRect newFrame = statusBar.frame;
	newFrame.size.width = 260 * percent;
	statusBar.frame = newFrame;
	[super viewDidAppear:YES];
}

-(void)pressedMyBadges:(id)sender {
    
    MyBadgesTableViewController *myBadges = [[MyBadgesTableViewController alloc] init];
	[self.navigationController pushViewController:myBadges animated:YES];

	
}


//Method for setting the appropriate labels on the profile page

-(void)setLabels {
	
	usernameLabel.text = [[[NSString alloc] initWithFormat:@"User: %@",appDelegate.email] autorelease];
	
	userClassLabel.text = [[[NSString alloc] initWithFormat:@"User Class: %@", appDelegate.userclass] autorelease];
	
	totalXPLabel.text = [[[NSString alloc] initWithFormat:@"Total XP: %@", appDelegate.totalXP] autorelease];
	
//	totalInvestmentsLabel.text = [[[NSString alloc] initWithFormat:@"Total Investments: %i",[appDelegate.currentLender.transactions count]] autorelease];
	creditLabel.text = [[[NSString alloc] initWithFormat:@"My Seeds: %d",appDelegate.credit] autorelease];

	[super viewDidAppear:YES];
	
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSLog (@"%@", @"Profile viewDidLoad!");
    
	appDelegate = [[UIApplication sharedApplication] delegate];

    [self setProfileImage:[appDelegate.uid intValue]];
    
	//Graphical stuff
    
	roundedCorners.layer.cornerRadius = 8;
	roundedCorners2.layer.cornerRadius = 8;
	statusBar.layer.cornerRadius = 8;
	statusBar2.layer.cornerRadius = 12;
	self.navigationItem.title = @"My Profile";
	
	self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] 
                                              initWithTitle:@"Log Off" 
                                              style:UIBarButtonItemStyleBordered 
                                              target:self action:@selector(pressedLogOff:)] autorelease];
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] 
                                               initWithTitle:@"My Badges" 
                                               style:UIBarButtonItemStyleBordered 
                                               target:self action:@selector(pressedMyBadges:)] autorelease];
	
	[self.buttonOne setBackgroundImage:[[UIImage imageNamed:@"whiteButton4.png"] 
										stretchableImageWithLeftCapWidth:12.0 
										topCapHeight:0] 
							  forState:UIControlStateNormal];
	[self.buttonTwo setBackgroundImage:[[UIImage imageNamed:@"whiteButton4.png"] 
										stretchableImageWithLeftCapWidth:12.0 
										topCapHeight:0] 
							  forState:UIControlStateNormal];
	[self.buttonThree setBackgroundImage:[[UIImage imageNamed:@"whiteButton4.png"] 
                                          stretchableImageWithLeftCapWidth:12.0 
                                          topCapHeight:0] 
                                forState:UIControlStateNormal];
	[self.buttonFour setBackgroundImage:[[UIImage imageNamed:@"whiteButton4.png"] 
                                         stretchableImageWithLeftCapWidth:12.0 
                                         topCapHeight:0] 
                               forState:UIControlStateNormal];
	
    	[self setLabels]; //addition
    	[self setLengthOfStatusBar];
	
    	[self viewDidAppear:YES]; //Addition
	
    [super viewDidLoad];
	
}

// Every time the view appears, a new Grabber is created with the appropriate userID, then the labels are updated
/*
- (void)viewWillAppear:(BOOL)animated
{ 
    NSLog (@"%@", @"Profile viewWillAppear!!");

//	[[[appDelegate.tabBarController.tabBar items] objectAtIndex:0] setBadgeValue:nil];

//	[self setLabels];
//	[self setLengthOfStatusBar];
		
//    [super viewWillAppear:animated]; //changed animated to YES
}*/

-(void) viewDidAppear:(BOOL)animated{
    NSLog (@"%@", @"Profile viewDidAppear!!");
   
    NSLog(@"WAAAT?? %@", [[appDelegate.tabBarController.tabBar items] objectAtIndex:0]);

    [[[appDelegate.tabBarController.tabBar items] objectAtIndex:0] setBadgeValue:nil];
    
	[self setLabels];
	[self setLengthOfStatusBar];
    
    [super viewDidAppear:YES];
}

-(void) viewDidDisappear:(BOOL)animated {
    NSLog (@"%@", @"Profile viewDiddisappear!!");	
	//[newGrabber release];

	[super viewDidDisappear:animated];
}

-(void)checkForUpdates:(NSDictionary *)updatedInfo {
	
    NSLog (@"%@", @"Profile View is checking for Updates...");

	Lender *temp = appDelegate.currentLender;
	
	
		
	if ([temp.totalXP intValue] < [[updatedInfo objectForKey:@"experience"] intValue]) {
		
		UIAlertView *warningMessage;
		NSString *formattedMessage = [[NSString alloc] initWithFormat:@"Your XP has been increased by %i. Nice work!",
									  [[updatedInfo objectForKey:@"experience"] intValue] - [temp.totalXP intValue]]; 
		warningMessage = [[UIAlertView alloc] initWithTitle:@"Your XP has increased!" 
													message:formattedMessage 
												   delegate:nil cancelButtonTitle:@"Ok" 
										  otherButtonTitles:nil];
		[warningMessage show];
		[formattedMessage release];
		[warningMessage release];
		
		appDelegate.currentLender.totalXP = [updatedInfo objectForKey:@"experience"];
		
	}
	
	
	if ([appDelegate.currentLender.totalXP intValue] > [[appDelegate.userClasses valueForKey:appDelegate.currentLender.userclass] intValue]) {
		
		UIAlertView *warningMessage;
		warningMessage = [[UIAlertView alloc] initWithTitle:@"You moved up a user class!" 
													message:@"Congratulations!" 
												   delegate:nil cancelButtonTitle:@"Cool" 
										  otherButtonTitles:nil];
		[warningMessage show];
		[warningMessage release];
		
		int changedXP = [appDelegate.currentLender.totalXP intValue];
		
		NSString *newClass = [[NSString alloc] init];
		
		int min = 5000;

		for(id key in appDelegate.userClasses) {
			int value = [[appDelegate.userClasses objectForKey:key] intValue];
			if (value > changedXP && value < min) {
				min = value;
				newClass = key;
				appDelegate.currentLender.userclass = newClass;
			}
		}
		
		NSDictionary *putDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
									   newClass,@"class_type",nil];
		[newClass release];
		NSString *jsondict = [putDictionary JSONRepresentation];
		[putDictionary release];
		
		//Create a Sender with the json string and the PUT command. This will update the database
 
        NSLog (@"%@", @"Going to update the database...");
		Sender *newSender = [[Sender alloc] initWithParams:@"users" jsonString:jsondict idToBeChanged:appDelegate.uid apiCall:@"PUT"];
		[newSender release];
		
		[self setLengthOfStatusBar];
	
	}
	
	

	
	
}

//METHOD THAT'S CALLED BY GRABBER DELEGATE


-(void)didGetData:(NSArray *)recievedData withType:(NSString *)thisType {
		
	// Create a dictionary from the JSON object
    NSLog (@"%@", @"Grabber Delegate called this method!");

	NSDictionary *userInfo = [recievedData objectAtIndex:0];
	
	
	[self checkForUpdates:userInfo];
	[self setLengthOfStatusBar];
	[self setLabels];

	
}


/*-(IBAction)viewBadges {
	
//	BadgeViewController *badgeView = [[BadgeViewController alloc] init];
//	[self.navigationController pushViewController:badgeView animated:YES];
	//[badgeView release]; 
//	MyBadgesModalViewController *myBadges = [[MyBadgesModalViewController alloc] init];
//	[self presentModalViewController:myBadges animated:YES];
//	[myBadges release];
    
    MyBadgesTableViewController *myBadges = [[MyBadgesTableViewController alloc] init];
	[self.navigationController pushViewController:myBadges animated:YES];

	
} */

-(IBAction)viewInvestments {
	
	InvestmentTableViewController *investmentView = [[InvestmentTableViewController alloc] init];
	[self.navigationController pushViewController:investmentView animated:YES];
	
	
}

-(IBAction)addCredit {

     UIActionSheet *asheet = [[UIActionSheet alloc] initWithTitle:@"Select an amount" 
														delegate:self 
											   cancelButtonTitle:@"Cancel" 
										  destructiveButtonTitle:nil 
											   otherButtonTitles:@"$1", @"$5", @"$10",@"$20",@"Custom", nil];
    [asheet showFromTabBar:appDelegate.tabBarController.tabBar];
    [asheet release]; 
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {

    
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
        
        PayButtonViewController *pbvc = [[PayButtonViewController alloc] init];
        
        [self.navigationController pushViewController:pbvc animated:YES];
        
//        [appDelegate.currentLender addCredit:thisAmount];
        
  //      [super viewDidAppear:YES];
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
/*
-(IBAction)addExperience{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Add XP Points"
                                                    message:@"$1 for an 1 XP" delegate:self 
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
   alert.tag=2;
    
    [alert show];
    [alert release];
} */

#pragma mark UIAlertView
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (alertView.tag==2) {
        // NO = 0, YES = 1
        if(buttonIndex == 0){
            // DO whatever "NO" is
        }
        else {
            // Do whatever "YES" is
            NSLog (@"%@", @"Alert tag is set!");
            [appDelegate.currentLender addXP:1]; 
            [self viewDidAppear:YES];
        }
    }
    else {
        if (buttonIndex == 1) {
            NSLog (@"%@", @"Alert tag not set!");
            
            thisAmount = [[NSDecimalNumber alloc] initWithDecimal:[nameField.text decimalValue]];
            NSLog(@"Amount is: %@",thisAmount);
            appDelegate.myCredit = thisAmount;

            PayButtonViewController *pbvc = [[PayButtonViewController alloc] init];
            
            [self.navigationController pushViewController:pbvc animated:YES];
            
     //       [appDelegate.currentLender addCredit:[[NSDecimalNumber alloc] initWithUnsignedInteger:[nameField.text intValue]]];             
     //       [super viewDidAppear:YES];
        }

    }
}

-(void)transactionsuccessful:(NSString *) payKey {
    NSLog (@"%@", @"paybutton Delegate called this method!");
    [appDelegate.currentLender addCredit:thisAmount];
	
}

/*
-(IBAction)viewFriends {
	
	CollageViewController *newCollage = [[CollageViewController alloc] init];
	[self.navigationController pushViewController:newCollage animated:YES];
	[newCollage release];
	
	
} */

- (IBAction)sendInAppSMS { 
    MFMessageComposeViewController *controller = [[[MFMessageComposeViewController alloc] init] autorelease];
	if([MFMessageComposeViewController canSendText])
	{
		controller.body = @"Send 1.00 to 3307547720";
		controller.recipients = [NSArray arrayWithObjects:@"729725", nil];
		controller.messageComposeDelegate = self;
		[self presentModalViewController:controller animated:YES];
	}

}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"MyApp" message:@"Unknown Error"
                                                   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
	switch (result) {
		case MessageComposeResultCancelled:
			NSLog(@"Cancelled");
			break;
		case MessageComposeResultFailed:
			[alert show];
			[alert release];
			break;
		case MessageComposeResultSent:
            
			break;
		default:
			break;
	}
    
	[self dismissModalViewControllerAnimated:YES];
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
	[currentUser release];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    NSLog (@"%@", @"Dealloc called!");
	[currentUser release];
	[userImage release];
	[roundedCorners release];
	[roundedCorners2 release];
	[usernameLabel release];
	[userClassLabel release];
	[totalInvestmentsLabel release];
	[totalXPLabel release];
	[statusBar release];
	[statusBar2 release];
	[buttonOne release];
	[buttonTwo release];
	[buttonThree release];
	[buttonFour release];
    [buttonFive release];
    [buttonSix release];
	[creditLabel release];
    [nameField release];
//    [thisAmount release];

    [super dealloc];
}


@end
