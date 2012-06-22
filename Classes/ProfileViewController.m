//
//  ProfileViewController.m
//  Microlending
//
//  Created by Leonard Ngeno on 06/22/2012.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
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

@class MicrolendingAppDelegate;
@class BadgeViewController;
@class Lender;
@class Grabber;
@class Sender;
@class MyBadgesTableViewController;


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



// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


-(void)pressedLogOff:(id)sender {
	exit(0); //addition.
	LoginViewController *newLogin = [[LoginViewController alloc] init];
	[appDelegate.tabBarController presentModalViewController:newLogin animated:YES];
	[newLogin release];
	
	
}

-(void)setProfileImage:(NSUInteger)userID {
	if (userID == 11692) {
		[userImage setImage:[UIImage imageNamed:@"CodyKo.jpg"]];
	} else if (userID == 3) {
		[userImage setImage:[UIImage imageNamed:@"SamBaek.jpg"]];
	} else if (userID == 4) {
		[userImage setImage:[UIImage imageNamed:@"ShunFan.jpg"]];
	} else if (userID == 7) {
		[userImage setImage:[UIImage imageNamed:@"KevinWang.jpg"]];
	}
}

//-(void)setProfileImage:(NSString *) gender {
//	if ([gender isEqualToString:@"Male"]) {
//		[userImage setImage:[UIImage imageNamed:@"male_avatar.png"]];
//	} else if ([gender isEqualToString:@"Female"]) {
//		[userImage setImage:[UIImage imageNamed:@"female_avatar.png"]];
  //  }
//}

-(void)setLengthOfStatusBar {
	
	double boom = [[appDelegate.userClasses valueForKey:appDelegate.currentLender.userclass] doubleValue] + 0.0001; //added 0.0001 to stop it from being 0!
	
	double percent = [appDelegate.currentLender.totalXP intValue] / boom;
	
	CGRect newFrame = statusBar.frame;
	newFrame.size.width = 260 * percent;
	statusBar.frame = newFrame;
	
}

-(void)pressedMyBadges:(id)sender {
/*	
	MyBadgesModalViewController *myBadges = [[MyBadgesModalViewController alloc] init];
	[self presentModalViewController:myBadges animated:YES];
	[myBadges release];
*/	
	UIAlertView* dialog = [[UIAlertView alloc] init];
	[dialog setDelegate:self];
	[dialog setTitle:@"Doesn't work yet"];
	[dialog setMessage:@"Sorry"];
	[dialog addButtonWithTitle:@"OK"];
	[dialog show];
	[dialog release];
	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSLog (@"%@", @"Profile view loaded!");
	appDelegate = [[UIApplication sharedApplication] delegate];			
	
    [self setProfileImage:[appDelegate.currentLender.uid intValue]];

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
	
	
	[self setLengthOfStatusBar];	
	
	
	
    [super viewDidLoad];
	
}

//Method for setting the appropriate labels on the profile page

-(void)setLabels {
	
	usernameLabel.text = [[[NSString alloc] initWithFormat:@"%@ %@",appDelegate.currentLender.firstName,
						   appDelegate.currentLender.lastName] autorelease];
	
	userClassLabel.text = [[[NSString alloc] initWithFormat:@"User Class: %@", appDelegate.currentLender.userclass] autorelease];
	
	totalXPLabel.text = [[[NSString alloc] initWithFormat:@"Total XP: %@", appDelegate.currentLender.totalXP] autorelease];
	
	totalInvestmentsLabel.text = [[[NSString alloc] initWithFormat:@"Total Investments: %i",[appDelegate.currentLender.transactions count]] autorelease];
	creditLabel.text = [[[NSString alloc] initWithFormat:@"Remaining Credit: %i",appDelegate.currentLender.credit] autorelease];

	
	
}


// Every time the view appears, a new Grabber is created with the appropriate userID, then the labels are updated

- (void)viewDidAppear:(BOOL)animated
{
    NSLog (@"%@", @"Profile View did Appear!");

	[[[appDelegate.tabBarController.tabBar items] objectAtIndex:1] setBadgeValue:nil];

	[self setLabels];
	[self setLengthOfStatusBar];
	
		
    [super viewDidAppear:animated];
}

-(void) viewDidDisappear:(BOOL)animated {
	
	//[newGrabber release];

	[super viewDidDisappear:animated];
}

-(void)checkForUpdates:(NSDictionary *)updatedInfo {
	
	
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
									   newClass,@"class_type",
									   nil];
		[newClass release];
		NSString *jsondict = [putDictionary JSONRepresentation];
		[putDictionary release];
		
		//Create a Sender with the json string and the PUT command. This will update the database
		
		Sender *newSender = [[Sender alloc] initWithParams:@"lenders" jsonString:jsondict idToBeChanged:temp.realid apiCall:@"PUT"];
		[newSender release];
		
		[self setLengthOfStatusBar];
	
	}
	
	

	
	
}

//METHOD THAT'S CALLED BY GRABBER DELEGATE


-(void)didGetData:(NSArray *)recievedData withType:(NSString *)thisType {
		
	// Create a dictionary from the JSON object
	
	NSDictionary *userInfo = [recievedData objectAtIndex:0];
	
	
	[self checkForUpdates:userInfo];
	[self setLengthOfStatusBar];
	[self setLabels];

	
}


-(IBAction)viewBadges {
	
/*	BadgeViewController *badgeView = [[BadgeViewController alloc] init];
	[self.navigationController pushViewController:badgeView animated:YES];
	//[badgeView release]; */
//	MyBadgesModalViewController *myBadges = [[MyBadgesModalViewController alloc] init];
//	[self presentModalViewController:myBadges animated:YES];
//	[myBadges release];
    
    MyBadgesTableViewController *myBadges = [[MyBadgesTableViewController alloc] init];
	[self.navigationController pushViewController:myBadges animated:YES];

	
}

-(IBAction)viewInvestments {
	
	InvestmentTableViewController *investmentView = [[InvestmentTableViewController alloc] init];
	[self.navigationController pushViewController:investmentView animated:YES];
	
	
}

-(IBAction)viewFriends {
	
	CollageViewController *newCollage = [[CollageViewController alloc] init];
	[self.navigationController pushViewController:newCollage animated:YES];
	[newCollage release];
	
	
}

- (IBAction)sendInAppSMS { //:(id)sender {
    MFMessageComposeViewController *controller = [[[MFMessageComposeViewController alloc] init] autorelease];
	if([MFMessageComposeViewController canSendText])
	{
		controller.body = @"Testing Application! By Leonard.";
		controller.recipients = [NSArray arrayWithObjects:@"+17165360826", nil];
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
	[creditLabel release];

    [super dealloc];
}


@end
