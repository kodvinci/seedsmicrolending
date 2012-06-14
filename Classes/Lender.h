//
//  Lender.h
//  Microlending
//
//  Created by Leonard Ngeno on 06/13/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Grabber.h"
#import "Transaction.h"

@class Transaction;

@protocol LenderDelegate <NSObject>

-(void)didFinishSettingUpLender:(BOOL)result withLender:(id)thisLender;

@end


@interface Lender : NSObject <GrabberDelegate> {
	
	NSString *firstName;
	NSString *lastName;
	NSString *userclass;
	NSString *totalXP;
	NSString *uid;
	NSString *realid;
	NSMutableArray *badges;
	NSMutableArray *friends;
	NSMutableArray *transactions;
	NSMutableArray *borrowers;
	NSInteger *totalLoans;
	NSInteger *totalCredit;
	NSInteger profilesObserved;
	NSInteger categoriesObserved;
	NSInteger currentLevel;
	NSInteger credit;
    NSInteger useriden;
	id lenderDelegate;


}

@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, retain) NSString *userclass;
@property (nonatomic, retain) NSString *totalXP;
@property (nonatomic, retain) NSString *uid;
@property (nonatomic, retain) NSString *realid;
@property (nonatomic, retain) NSMutableArray *badges;
@property (nonatomic, retain) NSMutableArray *friends;
@property (nonatomic, retain) NSMutableArray *transactions;
@property (nonatomic, retain) NSMutableArray *borrowers;
@property (nonatomic, assign) NSInteger *totalLoans;
@property (nonatomic, assign) NSInteger *totalCredit;
@property (nonatomic, assign) NSInteger profilesObserved;
@property (nonatomic, assign) NSInteger currentLevel;
@property (nonatomic, assign) NSInteger categoriesObserved;
@property (nonatomic, assign) NSInteger credit;
@property (nonatomic, assign) NSInteger useriden;
@property (nonatomic, assign) id<LenderDelegate> lenderDelegate;

-(id)initWithUserID:(NSString *)userID;
-(void)addXP:(NSInteger)amountToBeAdded;
-(void)addBadge:(NSString *)badgeID;
-(void)initializeEverythingFromServer;
-(void)addTransaction:(Transaction *)thisTrans;
-(void)incrementProfilesNumber;
-(void)incrementCategoriesNumber;
-(void)incrementTheLevelNumberBecauseOfSpecificBorrower;
-(void)subtractCredit:(NSInteger)thisAmount;
-(NSInteger)getCurrentLevel;
-(UIImage *)getImage;


@end
