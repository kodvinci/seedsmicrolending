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

@implementation Citadel

@synthesize citFloors;
@synthesize citFurniture;
@synthesize level;
@synthesize citSeedlings;
@synthesize citadelDelegate;

-(void)initialize
{
    appDelegate = [[UIApplication sharedApplication] delegate];
    // Retrieve stored data from NSUserDefaults before the view loads
   
    //NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //citFloors = [defaults integerForKey:@"floors"];
    
    citFloors = [appDelegate.citadelData integerForKey:@"floors"];
    level = [appDelegate.citadelData integerForKey:@"level"];
    seedlingID = [appDelegate.citadelData integerForKey:@"seedling"];
    citFurniture = [appDelegate.citadelData objectForKey:@"furniture"];
    citSeedlings = [appDelegate.citadelData objectForKey:@"seedlings"];
}

-(void)addFloor
{
    //TO_DO
    //Do whatever setup might be needed
    
    citFloors = citFloors + 1;
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

//Save the changes to NSUserDefaults
//TO_DO: Regularly update the database with whatever changes have been made in the game.

-(void)saveChanges:(NSString *)thisChanged
{
    if ([thisChanged isEqualToString:@"FLOOR"]) {
        [appDelegate.citadelData setInteger:citFloors forKey:@"floors"];
    }
    
    if ([thisChanged isEqualToString:@"SEEDLING"]) {
        [appDelegate.citadelData setObject:citSeedlings forKey:@"seedlings"];
    }
    
    if ([thisChanged isEqualToString:@"FURNITURE"]) {
        [appDelegate.citadelData setObject:citFurniture forKey:@"furniture"];
    }
}

@end
