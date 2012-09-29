//
//  Lender.m
//  Microlending
//
//  Created by Leonard Ngeno on 06/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Lender.h"
#import "SBJson.h"
#import "Sender.h"
#import "Grabber.h"
#import "Borrower.h"
#import "MicrolendingAppDelegate.h"
#import "Transaction.h"

@class Sender;
@class Grabber;
@class MicrolendingAppDelegate;
@class Transaction;
@class Borrower;


@implementation Lender

@synthesize email, password, siteURL, firstName, lastName, userclass, totalXP, badges, totalLoans, 
friends, uid, lenderDelegate, transactions, totalCredit, profilesObserved,
currentLevel, categoriesObserved, borrowers, credit, valueAmount; 

-(id)initWithUserID:(NSString *)userID { 
	if (self = [super init]) {
        self.uid = userID;
		self.badges = [[NSMutableArray alloc] init];
		self.transactions = [[NSMutableArray alloc] init];
		self.borrowers = [[NSMutableArray alloc] init];
		profilesObserved = 0;
		currentLevel = 0;
		categoriesObserved = 0;
		credit = 0;

    }
	
	return self; 
		
}

//Grabs and sets everything appropriately

-(void)initializeEverythingFromServer {
	NSLog (@"%@", @"started initializing everythingFromServer!");
/*	Grabber *newGrabber = [[Grabber alloc] initWithParams:@"users"
												  apiName:@"show" 
												 argument:self.uid
												  apiCall:@"GET" 
											typeOfGrabber:@"user"]; 
	newGrabber.grabberDelegate = self;
	[newGrabber release]; */
    
    NSLog (@"%@", @"Finished initializing everythingFromServer!");
    [self.lenderDelegate didFinishSettingUpLender:YES withLender:self];

}

-(void)initializeExistingTransactions {
    NSLog (@"%@", @"started initializing existing Transactions!");
	Grabber *thirdGrabber = [[Grabber alloc] initWithParams:@"transactions" 
													apiName:@"byUid" 
												   argument:self.uid 
													apiCall:@"GET" 
											  typeOfGrabber:@"transactions"];
	thirdGrabber.grabberDelegate = self;
	[thirdGrabber release];
    [self.lenderDelegate didFinishSettingUpLender:YES withLender:self];
    NSLog (@"%@", @"Finished initializing existing Transactions!");

}

//Create a grabber that will grab the existing user's badges

-(void)initializeExistingBadges {
    NSLog (@"%@", @"started initializing existing Badges!");
	
	Grabber *secondGrabber = [[Grabber alloc] initWithParams:@"badge_lists" 
													 apiName:@"byUid" 
													argument:self.uid 
													 apiCall:@"GET" 
											   typeOfGrabber:@"badges"];
	secondGrabber.grabberDelegate = self;
	[secondGrabber release];
    NSLog (@"%@", @"Finished initializing existing Badges!");

 //   [self.lenderDelegate didFinishSettingUpLender:YES withLender:self];

}

-(void)initializeExistingBorrowers {
	
	Grabber *secondGrabber = [[Grabber alloc] initWithParams:@"lenders" 
													 apiName:@"getBorrowersByUid" 
													argument:self.uid 
													 apiCall:@"GET" 
											   typeOfGrabber:@"borrowers"];
	secondGrabber.grabberDelegate = self;
	[secondGrabber release];
	
}

//This method is called as a delegate method when a Grabber is created

-(void)didGetData:(NSArray *)recievedData withType:(NSString *)thisType {
	
	//Check if the Grabber was for the badges
	
	if ([thisType isEqualToString:@"badges"]) {
	    NSLog (@"%@", @"WE ARE IN BADGES!");
	
		//Grab each badge and stick the BID in the current Lender's badgelist

        if (recievedData) {
            NSLog(@"The receivedData for badges is: %@",recievedData);

            for (int x = 0; x < [recievedData count]; x++) {
						
                NSDictionary *newDic = [recievedData objectAtIndex:x];
                NSString *addString = [[NSString alloc] initWithFormat:@"%@",[newDic objectForKey:@"bid"]];
                [self.badges addObject:addString];
                [addString release];
            }
	//	[self initializeExistingTransactions]; //???
            [self initializeExistingBadges];
        }
        else {
            NSLog (@"%@", @"No badges!!");
        }
		
	}

	
	if ([thisType isEqualToString:@"transactions"]) {
        
		if (recievedData) {
       
            NSLog(@"The receivedData for transactions is: %@",recievedData);
            NSUInteger Mysize = [recievedData count];
       //     NSLog(@"Size is: %i", Mysize);
      //      NSLog(@"The receivedData for transactions is: %@",[recievedData count]);

    //        for (int y = 0; y < [recievedData count]; y++) {
            for (int y = 0; y < Mysize; y++) {
                NSLog (@"%@", @"Inside of Loop!!");
                NSDictionary *newDic = [recievedData objectAtIndex:y];
                Transaction *newTrans = [[Transaction alloc] initFromLender:self.uid 
															 toBorrower:[newDic objectForKey:@"buid"] 
														 withThisAmount:[newDic objectForKey:@"amount"]];
			
                [self.transactions addObject:newTrans];
                [newTrans release];
            }
            [self initializeExistingBorrowers];
        }
        else {
            NSLog (@"%@", @"No matching transactions!");
        }
		
	}
	
	if ([thisType isEqualToString:@"user"]) {
			
        NSLog(@"The user details are: %@",recievedData);
//		NSDictionary *userInfo = [recievedData objectAtIndex:0];
		
/*		self.firstName = [userInfo valueForKey:@"first_name"];
		self.lastName = [userInfo valueForKey:@"last_name"];
		self.userclass = [userInfo valueForKey:@"class_type"];
		self.totalXP = [userInfo valueForKey:@"exp"];
		self.credit = [[userInfo valueForKey:@"credit"] intValue];
        self.uid = [userInfo valueForKey:@"id"]; 
		*/
        self.firstName = [recievedData valueForKey:@"first_name"];
		self.lastName = [recievedData valueForKey:@"last_name"];
		self.userclass = [recievedData valueForKey:@"class_type"];
		self.totalXP = [recievedData valueForKey:@"exp"];
		self.credit = [[recievedData valueForKey:@"credit"] intValue];
        self.uid = [recievedData valueForKey:@"id"];
        self.email = [recievedData valueForKey:@"email"];
		
        NSLog(@"Email is %@", [recievedData valueForKey:@"email"]);
	//	[self initializeExistingBadges];
        [self.lenderDelegate didFinishSettingUpLender:YES withLender:self];

	}
	
	if ([thisType isEqualToString:@"borrowers"]) {
		
		NSLog(@"%i",[recievedData count]);
		
		for (int y = 0; y < [recievedData count]; y++) {
			
			NSDictionary *newDic = [recievedData objectAtIndex:y];
			Borrower *newBorrower = [[Borrower alloc] initWithUserName:[newDic objectForKey:@"first_name"]];
			
			
			[self.borrowers addObject:newBorrower];
			[newBorrower release];
			
		}
		
		NSLog(@"credit: %i",self.credit);
		[self.lenderDelegate didFinishSettingUpLender:YES withLender:self];
		
		
	}
//	[self checkForUserClassChange]; //new addition ... causing problems
}

//Method to check for a change in user class

-(void)checkForUserClassChange {
	
	//Create the appDelegate to access the user class array
	
	MicrolendingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	
	//Create a large minimum
    NSLog (@"%@", @"IN checkForUserClassChange!");

	int min = 1000000;
	
	NSString *newClass = [[NSString alloc] init];
	
	for(id key in appDelegate.userClasses) {
		int value = [[appDelegate.userClasses objectForKey:key] intValue];
		if (value > [self.totalXP intValue] && value < min) {
			min = value;
			newClass = key;
			self.userclass = newClass;
            NSLog (@"%@", @"Just moved to a new class!");
		}
	}
	
	//Create a dictionary and a json string from the new user class
	
	NSDictionary *putDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
								   newClass,@"class_type",
								   nil];
    NSLog(@"first putDictionary has: %@", putDictionary);
	[newClass release];
	NSString *jsondict = [putDictionary JSONRepresentation];
	[putDictionary release];
	
	//Create a Sender with the json string and the PUT command. This will update the database
    NSLog (@"%@", @"ABOUT to user newSender!");
	Sender *newSender = [[Sender alloc] initWithParams:@"users" 
											jsonString:jsondict 
										 idToBeChanged:appDelegate.uid
											   apiCall:@"PUT"]; //uid, users
    NSLog (@"%@", @"Just used newSender!");
	[newSender release];
	
	
}


//Method for adding XP to this Lender

-(void)addXP:(NSInteger)amountToBeAdded {
	
	//Add value onto current XP
    MicrolendingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];

	int updated = [self.totalXP intValue] + amountToBeAdded;
	NSString *updatedString = [[NSString alloc] initWithFormat:@"%i",updated];
	self.totalXP = updatedString;
	[self checkForUserClassChange];
	[updatedString release];
	
	//Create a new dictionary with the correct amount
	
	NSString *newXP = [[NSString alloc] initWithFormat:@"%i",updated];
	NSDictionary *putDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
								   newXP,@"exp",
								   nil]; //experience to exp
    NSLog(@"second putDictionary has: %@",putDictionary);

	[newXP release];
	
	//Create a JSON object from this dictionary
	
	NSString *jsondict = [putDictionary JSONRepresentation];
	[putDictionary release];
	
	//Create a Sender with the json string and the PUT command. This will update the database
	
	Sender *newSender = [[Sender alloc] initWithParams:@"users" 
											jsonString:jsondict 
										 idToBeChanged:appDelegate.uid
											   apiCall:@"PUT"]; //realid to uid, lenders to users
	[newSender release];
	
//	MicrolendingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
//	[[[appDelegate.tabBarController.tabBar items] objectAtIndex:1] setBadgeValue:@"3"];
	
	
}

//Add a transaction to this lender

-(void)addTransaction:(Transaction *)thisTrans {
	
	if (![self.transactions containsObject:thisTrans]) {
		
		[self.transactions addObject:thisTrans];
		
		NSDictionary *newTrans = [NSDictionary dictionaryWithObjectsAndKeys:self.uid,@"luid",
								  thisTrans.toUID,@"buid",
								  thisTrans.amount,@"amount",
								  [thisTrans.dateAndTime descriptionWithLocale:@"YYYY-MM-DD"],@"date",
								  nil];
		NSString *jsonTrans = [newTrans JSONRepresentation];
		
		//Send Transaction via POST request
		
		Sender *newTransSender = [[Sender alloc] initWithParams:@"transactions" 
													 jsonString:jsonTrans 
												  idToBeChanged:@"" 
														apiCall:@"POST"];
		[newTransSender release];
		
	}
	
	
}



-(void)incrementProfilesNumber {
	
	if (currentLevel == 0) {
		
		self.profilesObserved++;
		
		if (self.profilesObserved == 5) {
			
			[self setCurrentLevel:1];
			
			MicrolendingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
			[[[appDelegate.tabBarController.tabBar items] objectAtIndex:0] setBadgeValue:@"3"];
			
		}
		
		
	}
			
		
}

-(void)incrementCategoriesNumber {
	
	MicrolendingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];

	
	if (self.currentLevel == 1) {
		
		[self setCurrentLevel:2];
		
		[[[appDelegate.tabBarController.tabBar items] objectAtIndex:0] setBadgeValue:@"3"];

		
		
	} else if (self.currentLevel == 2) {
		
		categoriesObserved++;
		
		NSLog(@"categories observed: %i",categoriesObserved);
		
		if (self.categoriesObserved == 3) {
			
			[self setCurrentLevel:3];
			
			
			[[[appDelegate.tabBarController.tabBar items] objectAtIndex:0] setBadgeValue:@"3"];
			
		}
		
	}
	
	
	
}

-(void)incrementTheLevelNumberBecauseOfSpecificBorrower {
	
	if (currentLevel == 3) {
		
			
			[self setCurrentLevel:4];
			
			MicrolendingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
			[[[appDelegate.tabBarController.tabBar items] objectAtIndex:0] setBadgeValue:@"3"];
			
		}
		
	
	
}

-(NSInteger)getCurrentLevel {
	
	return currentLevel;
	
}

-(void)addBadge:(NSString *)badgeID {
	
	//First check if the badge already exists in the Lender's badge list
	
	if (![self.badges containsObject:badgeID]) {
		
		
		
		//Add the badge to the Lender's badge list
		
		[self.badges addObject:badgeID];
		
		//Create a dictionary with the correct badge
		
		NSDictionary *newBadge = [NSDictionary dictionaryWithObjectsAndKeys:badgeID,@"bid",self.uid,@"uid",nil];
		NSString *jsonBadge = [newBadge JSONRepresentation];
		
		//Send badge via POST request
		
		Sender *newBadgeSender = [[Sender alloc] initWithParams:@"badge_lists" 
													 jsonString:jsonBadge 
												  idToBeChanged:@"" 
														apiCall:@"POST"];
		[newBadgeSender release];
		
		MicrolendingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
		[[[appDelegate.tabBarController.tabBar items] objectAtIndex:1] setBadgeValue:@"2"];
		
	}
	
}



//Subtract credit from this lender

-(void)subtractCredit:(NSInteger)thisAmount {
    
    MicrolendingAppDelegate *appDelegate;
    appDelegate = [[UIApplication sharedApplication] delegate];
	//self.credit -= thisAmount;
	appDelegate.credit -= thisAmount;
		
	NSString *newCredit = [[NSString alloc] initWithFormat:@"%i",appDelegate.credit];
	NSDictionary *putDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
								   newCredit,@"credit",
								   nil];
	[newCredit release];
	
	//Create a JSON object from this dictionary
	
	NSString *jsondict = [putDictionary JSONRepresentation];
	[putDictionary release];
	
	//Create a Sender with the json string and the PUT command. This will update the database
	
	Sender *newSender = [[Sender alloc] initWithParams:@"users" 
											jsonString:jsondict 
										 idToBeChanged:appDelegate.uid
											   apiCall:@"PUT"];
	[newSender release];
}

//Add credit to this lender

-(void)addCredit:(NSDecimalNumber *)thisAmount {
    NSLog (@"%@", @"going to add credit!");
    NSInteger myNum = [thisAmount intValue];
    
    MicrolendingAppDelegate *appDelegate;
    appDelegate = [[UIApplication sharedApplication] delegate];
	//self.credit += myNum;
	appDelegate.credit += myNum;
    
	NSString *newCredit = [[NSString alloc] initWithFormat:@"%i",appDelegate.credit];
	NSDictionary *putDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
								   newCredit,@"credit",
								   nil];
	[newCredit release];
	
	//Create a JSON object from this dictionary
	
	NSString *jsondict = [putDictionary JSONRepresentation];
	[putDictionary release];
	
	//Create a Sender with the json string and the PUT command. This will update the database
	
	Sender *newSender = [[Sender alloc] initWithParams:@"users" 
											jsonString:jsondict 
										 idToBeChanged:appDelegate.uid
											   apiCall:@"PUT"];
	[newSender release];
}

//Grab the appropriate image
	
	
-(UIImage *)getImage {
		
	return [UIImage imageNamed:@"lender.png"]; 	
		
}

@end
