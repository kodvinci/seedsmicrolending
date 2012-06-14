//
//  MicrolendingAppDelegate.h
//  Microlending
//
//  Created by Leonard Ngeno on 06/08/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

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
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) LoginViewController *loginView;
@property (nonatomic, retain) NSString *ipaddress;
@property (nonatomic, retain) NSString *userID;
@property (nonatomic, retain) Lender *currentLender;
@property (nonatomic, retain) NSMutableDictionary *userClasses;
@property (nonatomic, retain) NSMutableArray *badgeList;


@end

