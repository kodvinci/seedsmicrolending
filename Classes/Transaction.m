//
//  Transaction.m
//  Microlending
//
//  Created by Cody Kolodziejzyk on 11/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Transaction.h"
#import "Grabber.h"

@class Grabber;


@implementation Transaction

@synthesize fromUID, toUID, amount, dateAndTime, fromUsername, toUsername, transactionDelegate; 

-(id)initFromLender:(NSString *)thisFromUID 
		 toBorrower:(NSString *)thisBorrower 
	 withThisAmount:(NSString *)thisAmount {
	
	if (self = [super init]) {
	
		self.fromUID = thisFromUID;
		self.toUID = thisBorrower;
		self.amount = thisAmount;
		self.dateAndTime = [[NSDate alloc] init];
		
		
		
	}
	
	return self;
}


- (NSComparisonResult)compare:(Transaction *)otherTrans {
	if ([self.amount intValue] > [otherTrans.amount intValue])
		return NSOrderedAscending;
	else if ([self.amount intValue] < [otherTrans.amount intValue])
		return NSOrderedDescending;
	else 
		return NSOrderedSame;
}

-(NSString *)getTransactionLender {
	
	
	return self.fromUID;
	
}

-(NSString *)getTransactionName {
	
	NSString *name = [[NSString alloc] initWithFormat:@"From me to borrower %@",self.toUID];
	return name;
	
	
}

-(NSDate *)getTransactionDate {
	
	return dateAndTime;
	
}


@end
