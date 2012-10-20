//
//  MicrolendingAppDelegate.m
//  Microlending
//
//  Created by Leonard Ngeno on 06/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MicrolendingAppDelegate.h"
#import "LoginViewController.h"
#import "Badge.h"
#import "Grabber.h"
#import "PayPal.h"
#import "PayButtonViewController.h"


@class LoginViewController;
@class Badge;
@class Grabber;

@implementation MicrolendingAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize loginView;
@synthesize ipaddress;
@synthesize userID;
@synthesize currentLender;
@synthesize userClasses;
@synthesize badgeList;
@synthesize myCredit;
@synthesize firstName;
@synthesize lastName;
@synthesize credit;
@synthesize email;
@synthesize userclass;
@synthesize totalXP;
@synthesize uid;
@synthesize citadelData;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    NSLog (@"%@", @"In MicroLendingApp launch!");
    
    //Remove the DecisionsController from the tab Bar
/*    NSMutableArray *items = [NSMutableArray arrayWithArray:self.tabBarController.viewControllers];
    [items removeObjectAtIndex:4];
    [self.tabBarController setViewControllers:items]; */

    //Finding the location of the app
/*    myLocation = [[CLLocationManager alloc] init];
    [myLocation setDistanceFilter:kCLDistanceFilterNone];
    [myLocation setDesiredAccuracy:kCLLocationAccuracyBest];
    [myLocation startUpdatingLocation];
*/   
	ipaddress = [[NSString alloc] initWithString:@"10.180.135.109"];
	userID = [[NSString alloc] init];
	
	userClasses = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"1000", @"Master",
															 @"500",@"Pro",
															@"100",@"Power User",
															@"50",@"Novice",
															@"25",@"Noobie",
															nil];
	
    
    [self.window makeKeyAndVisible];
	loginView = [[LoginViewController alloc] init];
	[window addSubview:tabBarController.view];

    [NSThread detachNewThreadSelector:@selector(initializePayPal) toTarget:self withObject:nil];
	
	[self.tabBarController presentModalViewController:loginView animated:NO]; 
    return YES;
}

-(void)initializePayPal {
    [PayPal initializeWithAppID:@"APP-2GM56961PP5201218" forEnvironment:ENV_LIVE];
}
/*
-(void)myLocation:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *) newLocation fromLocation:(CLLocation *)oldLocation {
    NSLog(@"%@", newLocation);
}*/

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
    
    [[NSUserDefaults standardUserDefaults] synchronize];

}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
    //save changes

//    [super applicationWillTerminate:application];
    NSLog(@"Application Will Terminate");
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[userID release];
	[ipaddress release];
    [window release];
	[tabBarController release];
	[loginView release];
	[currentLender release];
	[userClasses release];
	[badgeList release];
    [myCredit release];

    [super dealloc];
}


@end
