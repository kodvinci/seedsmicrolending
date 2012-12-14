//
//  Citadel.m
//  Microlending
//
//  Created by Leonard Ng'eno on 9/29/12.
//
//

#import "Citadel.h"

@class MicrolendingAppDelegate;
@class Seedling;
@class FloorViewController;
@class CitadelViewController;

@implementation Citadel

@synthesize citFloors;
@synthesize citFurniture;
@synthesize level;
@synthesize citSeedlings;
@synthesize citadelDelegate;
@synthesize playerXP, playerLeaves, playerCoins, playerLevel;

-(id)init
{
    if (self = [super init]) {
        //return something
        appDelegate = [[UIApplication sharedApplication] delegate];
    }
    return self;
}

-(void)initialize
{
    NSLog(@"%@", @"citadel initialize");
  //  appDelegate = [[UIApplication sharedApplication] delegate];
    
    // Retrieve stored data from NSUserDefaults before the view loads

    playerXP = [appDelegate.citadelData integerForKey:@"experience"];
    playerLevel = [appDelegate.citadelData integerForKey:@"playerLevel"];
    playerCoins = [appDelegate.citadelData integerForKey:@"coins"];
    playerLeaves = [appDelegate.citadelData integerForKey:@"leaves"];
    citFloors = [appDelegate.citadelData integerForKey:@"floors"];
    level = [appDelegate.citadelData integerForKey:@"level"];
    
   // NSData *myFurniture = [appDelegate.citadelData objectForKey:@"furniture"];
 //   citFurniture = [NSKeyedUnarchiver unarchiveObjectWithData:myFurniture];
  //  citSeedlings = [appDelegate.citadelData objectForKey:@"seedlings"];
    
    NSLog(@"%@", @"calling citadelSetUpDone...");
    [self.citadelDelegate citadelSetUpDone:YES];

}

//returns a boolean value to indicate that the floor has been purchased.
//If the player has enough coins and is at the required level, then they can buy the floor using coins. However, if the player does not have enough coins and the required level, they can use the early unlock option and buy the floor using leaves if they have the required number of leaves.

-(BOOL)addFloor:(NSInteger)newNumFloors
{
    NSLog(@"addFloor called");
    if (newNumFloors == 2) {
        if ([appDelegate.citadelData integerForKey:@"coins"] >= 100 && [appDelegate.citadelData integerForKey:@"playerLevel"] >= 1) {
            //can buy floor
            [self recordFloorPurchase:100];
            NSLog(@"Return YES");
            return YES;
        }
        else {
            NSLog(@"Return NO");
            return NO;
        }
    }
    if (newNumFloors == 3) {
        if ([appDelegate.citadelData integerForKey:@"coins"] >= 1000 && [appDelegate.citadelData integerForKey:@"playerLevel"] >= 3) {
            //can buy floor
            NSLog(@"Regular purchase");
            [self recordFloorPurchase:1000];
            return YES;
        }
        else if ([appDelegate.citadelData integerForKey:@"leaves"] >= 10) {
            //early unlock cost
            NSLog(@"Early Unlock");
            [self recordEarlyUnlockFloorPurchase:10];
            return YES;
        }
        else {
            NSLog(@"Return No");
            return NO;
        }
    }
    if (newNumFloors == 4) {
        if ([appDelegate.citadelData integerForKey:@"coins"] >= 2000 && [appDelegate.citadelData integerForKey:@"playerLevel"] >= 6) {
            //can buy floor
            [self recordFloorPurchase:2000];
            return YES;
        }
        else if ([appDelegate.citadelData integerForKey:@"leaves"] >= 25) {
            //early unlock cost
            [self recordEarlyUnlockFloorPurchase:25];
            return YES;
        }
        else {
            return NO;
        }
    }
    if (newNumFloors == 5) {
        if ([appDelegate.citadelData integerForKey:@"coins"] >= 3000 && [appDelegate.citadelData integerForKey:@"playerLevel"] >= 9) {
            //can buy floor
            [self recordFloorPurchase:3000];
            return YES;
        }
        else if ([appDelegate.citadelData integerForKey:@"leaves"] >= 50) {
            //early unlock cost
            [self recordEarlyUnlockFloorPurchase:50];
            return YES;
        }
        else {
            return NO;
        }
    }
    if (newNumFloors == 6) {
        if ([appDelegate.citadelData integerForKey:@"coins"] >= 5000 && [appDelegate.citadelData integerForKey:@"playerLevel"] >= 12) {
            //can buy floor
            [self recordFloorPurchase:5000];
            return YES;
        }
        else if ([appDelegate.citadelData integerForKey:@"leaves"] >= 75) {
            //early unlock cost
            [self recordEarlyUnlockFloorPurchase:75];
            return YES;
        }
        else {
            return NO;
        }
    }
    if (newNumFloors == 7) {
        if ([appDelegate.citadelData integerForKey:@"coins"] >= 8000 && [appDelegate.citadelData integerForKey:@"playerLevel"] >= 15) {
            //can buy floor
            [self recordFloorPurchase:8000];
            return YES;
        }
        else if ([appDelegate.citadelData integerForKey:@"leaves"] >= 100) {
            //early unlock cost
            [self recordEarlyUnlockFloorPurchase:100];
            return YES;
        }
        else {
            return NO;
        }
    }
    if (newNumFloors == 8) {
        if ([appDelegate.citadelData integerForKey:@"coins"] >= 13000 && [appDelegate.citadelData integerForKey:@"playerLevel"] >= 18) {
            //can buy floor
            [self recordFloorPurchase:13000];
            return YES;
        }
        else if ([appDelegate.citadelData integerForKey:@"leaves"] >= 125) {
            //early unlock cost
            [self recordEarlyUnlockFloorPurchase:125];
            return YES;
        }
        else {
            return NO;
        }
    }
    if (newNumFloors == 9) {
        if ([appDelegate.citadelData integerForKey:@"coins"] >= 21000 && [appDelegate.citadelData integerForKey:@"playerLevel"] >= 21) {
            //can buy floor
            [self recordFloorPurchase:21000];
            return YES;
        }
        else if ([appDelegate.citadelData integerForKey:@"leaves"] >= 150) {
            //early unlock cost
            [self recordEarlyUnlockFloorPurchase:150];
            return YES;
        }
        else {
            return NO;
        }
    }
    if (newNumFloors == 10) {
        if ([appDelegate.citadelData integerForKey:@"coins"] >= 34000 && [appDelegate.citadelData integerForKey:@"playerLevel"] >= 24) {
            //can buy floor
            [self recordFloorPurchase:34000];
            return YES;
        }
        else if ([appDelegate.citadelData integerForKey:@"leaves"] >= 175) {
            //early unlock cost
            [self recordEarlyUnlockFloorPurchase:175];
            return YES;
        }
        else {
            return NO;
        }
    }    
    return NO; //If none of the above if statements is true, then just return NO
}

//Subtract the coins cost of the floor and save the balance of coins
-(void)recordFloorPurchase:(NSInteger) cost
{
    NSInteger oldCoins = [appDelegate.citadelData integerForKey:@"coins"];
    NSInteger newCoins = oldCoins - cost;
    [appDelegate.citadelData setInteger:newCoins forKey:@"coins"];
    [appDelegate.citadelData synchronize];
}

//Subtract the early unlock cost and record the balance of the leaves
-(void)recordEarlyUnlockFloorPurchase:(NSInteger)cost
{
    NSInteger oldLeaves = [appDelegate.citadelData integerForKey:@"leaves"];
    NSInteger newLeaves = oldLeaves - cost;
    [appDelegate.citadelData setInteger:newLeaves forKey:@"leaves"];
    [appDelegate.citadelData synchronize];
}

//This method is called by a scheduled NSTimer once the required wait time elapses. The method calls the CitadelViewController's displayFloors method with the new number of floors to display in the citadel. It also sets the BOOL floorGrowing to NO so that the player can be able to buy another floor if they have the means to do so.

-(void)floorGrowTimer
{
    NSInteger numFloor = [appDelegate.citadelData integerForKey:@"floors"];
    numFloor +=1;
    NSLog(@"numFloor: %d", numFloor);
    CitadelViewController *OFmyCitadel = [[CitadelViewController alloc] init];
 //   [self.navigationController initWithRootViewController:OFmyCitadel];
    [OFmyCitadel displayFloors:numFloor];
    [appDelegate.citadelData setInteger:numFloor forKey:@"floors"];
    [appDelegate.citadelData synchronize];
    
    appDelegate.floorGrowing = NO; //to enable purchase of new floor later
    
    [OFmyCitadel release];
}

-(void)addSeedling
{
    //TO_DO
    //Do the magic of generating the name for my seedling here...then use that name to initialize it
    
    SeedlingV2 *mySeedling = [[SeedlingV2 alloc]initWithImage:@"nameGenerated"];
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
  
    
  // [self.citadelDelegate needToRefreshView:YES];

}

-(void)findHappyObj:(SeedlingV2 *)seed
{
    
}

@end
