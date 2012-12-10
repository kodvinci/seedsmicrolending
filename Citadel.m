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
    
   // NSData *myFurniture = [appDelegate.citadelData objectForKey:@"furniture"];
 //   citFurniture = [NSKeyedUnarchiver unarchiveObjectWithData:myFurniture];
  //  citSeedlings = [appDelegate.citadelData objectForKey:@"seedlings"];
    
    NSLog(@"%@", @"calling citadelSetUpDone...");
    [self.citadelDelegate citadelSetUpDone:YES];

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
  
    
  // [self.citadelDelegate needToRefreshView:YES];

}

-(void)findHappyObj:(Seedling *)seed
{
    
}

@end
