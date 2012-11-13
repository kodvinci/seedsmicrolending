//
//  Citadel.m
//  Microlending
//
//  Created by guest user on 9/29/12.
//
//

#import "Citadel.h"

@class MicrolendingAppDelegate;
@class Seedling;
@class FloorViewController;
@class SingleFloor;
@class Floor;

@implementation Citadel

@synthesize citFloors;
@synthesize citFurniture;
@synthesize level;
@synthesize citSeedlings;
@synthesize citadelDelegate;
@synthesize playerXP, playerLeaves, playerCoins, playerLevel;

-(void)initialize
{
    NSLog(@"%@", @"citadel initialize");
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    // Retrieve stored data from NSUserDefaults before the view loads

    playerXP = [appDelegate.citadelData integerForKey:@"experience"];
    playerLevel = [appDelegate.citadelData integerForKey:@"playerLevel"];
    playerCoins = [appDelegate.citadelData integerForKey:@"coins"];
    playerLeaves = [appDelegate.citadelData integerForKey:@"leaves"];
    citFloors = [appDelegate.citadelData integerForKey:@"floors"];
    level = [appDelegate.citadelData integerForKey:@"level"];
    
//    seedlingID = [appDelegate.citadelData integerForKey:@"seedling"];
   // NSData *myFurniture = [appDelegate.citadelData objectForKey:@"furniture"];
 //   citFurniture = [NSKeyedUnarchiver unarchiveObjectWithData:myFurniture];
  //  citSeedlings = [appDelegate.citadelData objectForKey:@"seedlings"];
    
    NSLog(@"%@", @"calling citadelSetUpDone...");
    [self.citadelDelegate citadelSetUpDone:YES];

}

-(void)addFloor:(NSInteger)floorNumber
{
    //TO_DO
    //Do whatever setup might be needed to determine if one can add floor
    if (floorNumber == 1) {
        //all players can purchase this floor
        if (playerCoins >= 100) {
            playerCoins = playerCoins - 100;
            //TO_DO
            //initialize floor with grow time = 5 minutes
            Floor *myFloor = [Floor alloc];
            [myFloor init];
        }
        else {
            //Alert player that they do not have enough coins to buy floor
        }
    }
    if (floorNumber == 2) {
        if (playerLevel >= 3) {
            if (playerCoins >= 1000) {
                //have enough coins to buy floor
                playerCoins = playerCoins - 1000;
                //TO_DO
                //initialize floor with grow time = 1 hour
                
            }
        }
    }
    
    NSInteger maxFloors = 3; //Make maximum floors 3 for testing purposes
    appDelegate = [[UIApplication sharedApplication] delegate];
//    appDelegate.CitadelDelegate = self;
    NSInteger x = [appDelegate.citadelData integerForKey:@"floors"] + 1;
    if (x > maxFloors) {
        citFloors = maxFloors;
    }
    else {
        citFloors = x;
    }
    
    NSLog(@"new floors:%d", citFloors);
    
    [self saveChanges:@"FLOOR"];
}

-(void)addSeedling
{
    //TO_DO
    //Do the magic of generating the name for my seedling here...then use that name to initialize it
    
    Seedling *mySeedling = [[Seedling alloc]initWithImage:@"nameGenerated"];
    [citSeedlings addObject:mySeedling];
    [self saveChanges:@"SEEDLING"];
}

-(void)addFurniture
{
    //TO_DO
    //Figure out what Furniture class was added, then add it to our citadel furniture
    //USE PROTOCOLS? DELEGATES?
    
    [citFurniture addObject:@"WHATEVER FURNITURE WAS ADDED"];
    [self saveChanges:@"FURNITURE"];
}

//Save changes to NSUserDefaults
//TO_DO: Regularly update the database with whatever changes have been made in the game.

-(void)saveChanges:(NSString *)thisChanged
{
    if ([thisChanged isEqualToString:@"FLOOR"]) {
        [appDelegate.citadelData setInteger:citFloors forKey:@"floors"];
        [appDelegate.citadelData synchronize];
    }
    
    if ([thisChanged isEqualToString:@"SEEDLING"]) {
        [appDelegate.citadelData setObject:citSeedlings forKey:@"seedlings"];
    }
    
    if ([thisChanged isEqualToString:@"FURNITURE"]) {
        [appDelegate.citadelData setObject:citFurniture forKey:@"furniture"];
    }
    NSLog(@"NumFloors:%@", [appDelegate.citadelData objectForKey:@"floors"]);
  
    
   [self.citadelDelegate needToRefreshView:YES];

}

-(void)findHappyObj:(Seedling *)seed
{
    
}

@end
