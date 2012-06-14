//
//  Transaction.h
//  Microlending
//
//  Created by Cody Kolodziejzyk on 11/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Grabber.h"

@protocol TransactionDelegate <NSObject>

-(void)didFinishSettingUpTransaction:(BOOL)result withTransaction:(id)thisTransaction;

@end


@interface Transaction : NSObject {
	
	NSString *fromUID;
	NSString *fromUsername;
	NSString *toUsername;
	NSString *toUID;
	NSString *amount;
	NSDate *dateAndTime;
	id transactionDelegate;

}

@property (nonatomic, retain) NSString *fromUID;
@property (nonatomic, retain) NSString *fromUsername;
@property (nonatomic, retain) NSString *toUsername;
@property (nonatomic, retain) NSString *toUID;
@property (nonatomic, retain) NSString *amount;
@property (nonatomic, retain) NSDate *dateAndTime;
@property (nonatomic, assign) id<TransactionDelegate> transactionDelegate;


-(id)initFromLender:(NSString *)thisFromUID 
		 toBorrower:(NSString *)thisBorrower 
	 withThisAmount:(NSString *)thisAmount; 
- (NSComparisonResult)compare:(Transaction *)otherTrans;
-(NSString *)getTransactionLender;
-(NSString *)getTransactionName;
-(NSDate *)getTransactionDate;



@end
