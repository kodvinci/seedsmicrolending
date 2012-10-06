//
//  MicrolendingAppDelegate.h
//  Microlending
//
//  Created by Leonard Ngeno on 06/08/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "PayButtonViewController.h"
#import <CoreLocation/CoreLocation.h>

@class Lender;
@class LoginViewController;

@interface MicrolendingAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	IBOutlet UITabBarController *tabBarController;
	LoginViewController *loginView;
	NSString *userID;
	NSString *ipaddress;
	Lender *currentLender;
	NSMutableDictionary *userClasses;
	NSMutableArray *badgeList;
    NSDecimalNumber *myCredit;
    NSString *email;
	NSString *firstName;
	NSString *lastName;
	NSString *userclass;
	NSString *totalXP;
	NSString *uid;
    int *credit;

    CLLocationManager *myLocation;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) LoginViewController *loginView;
@property (nonatomic, retain) NSString *ipaddress;
@property (nonatomic, retain) NSString *userID;
@property (nonatomic, retain) Lender *currentLender;
@property (nonatomic, retain) NSMutableDictionary *userClasses;
@property (nonatomic, retain) NSMutableArray *badgeList;
@property (nonatomic, assign, readwrite) NSDecimalNumber *myCredit;
@property (nonatomic, retain) NSDecimalNumber *valueAmount;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, retain) NSString *userclass;
@property (nonatomic, retain) NSString *totalXP;
@property (nonatomic, retain) NSString *uid;
@property (nonatomic, assign) int *credit;

@end

