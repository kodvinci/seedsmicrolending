//
//  Furniture.m
//  Microlending
//
//  Created by guest user on 10/4/12.
//
//

#import "Furniture.h"

@implementation Furniture

@synthesize desire1, desire2, itemName, itemLevel, users, useTime, itemWidth, desireReward, happinessReward, coinsCost, leavesCost;

-(void)initWithName:(NSString *)furnitureName level:(NSInteger)furnitureLevel
{
    //check name and level and then initialize with appropriate properties
    if ([furnitureName isEqualToString:@"pool"]) {
        if (furnitureLevel == 1) {
            [self properties:[[NSString alloc] initWithString:@"pool"] desire1:[[NSString alloc] initWithString:@"water"] desire2:[[NSString alloc] initWithString:@" "] level:1 users:2 useTime:30 itemWidth:2 happiness:3 desire:nil cost1:500 cost2:nil];
        }
        if (furnitureLevel == 2) {
            [self properties:[[NSString alloc] initWithString:@"pool"] desire1:[[NSString alloc] initWithString:@"water"] desire2:[[NSString alloc] initWithString:@" "] level:2 users:2 useTime:30 itemWidth:2 happiness:4 desire:nil cost1:2000 cost2:5];

        }
        if (furnitureLevel == 3) {
            [self properties:[[NSString alloc] initWithString:@"pool"] desire1:[[NSString alloc] initWithString:@"water"] desire2:[[NSString alloc] initWithString:@" "] level:3 users:2 useTime:30 itemWidth:2 happiness:5 desire:nil cost1:8000 cost2:10];

        }
    }

    if ([furnitureName isEqualToString:@"waterbed"]) {
        if (furnitureLevel == 1) {
            [self properties:[[NSString alloc] initWithString:@"waterbed"] desire1:[[NSString alloc] initWithString:@"water"] desire2:[[NSString alloc] initWithString:@"relax"] level:1 users:1 useTime:30 itemWidth:2 happiness:3 desire:1 cost1:500 cost2:nil];

        }
        if (furnitureLevel == 2) {
            [self properties:[[NSString alloc] initWithString:@"waterbed"] desire1:[[NSString alloc] initWithString:@"water"] desire2:[[NSString alloc] initWithString:@"relax"] level:2 users:1 useTime:30 itemWidth:2 happiness:4 desire:1 cost1:1600 cost2:4];

        }
        if (furnitureLevel == 3) {
            [self properties:[[NSString alloc] initWithString:@"waterbed"] desire1:[[NSString alloc] initWithString:@"water"] desire2:[[NSString alloc] initWithString:@"relax"] level:3 users:1 useTime:30 itemWidth:2 happiness:4 desire:2 cost1:6400 cost2:8];

        }
    }
    
    if ([furnitureName isEqualToString:@"hammock"]) {
        if (furnitureLevel == 1) {
            [self properties:[[NSString alloc] initWithString:@"hammock"] desire1:[[NSString alloc] initWithString:@"relax"] desire2:[[NSString alloc] initWithString:@" "] level:1 users:1 useTime:30 itemWidth:2 happiness:3 desire:nil cost1:250 cost2:nil];

        }
        if (furnitureLevel == 2) {
            [self properties:[[NSString alloc] initWithString:@"hammock"] desire1:[[NSString alloc] initWithString:@"relax"] desire2:[[NSString alloc] initWithString:@" "] level:2 users:1 useTime:30 itemWidth:2 happiness:4 desire:nil cost1:1000 cost2:3];

        }
        if (furnitureLevel == 3) {
            [self properties:[[NSString alloc] initWithString:@"hammock"] desire1:[[NSString alloc] initWithString:@"relax"] desire2:[[NSString alloc] initWithString:@" "] level:3 users:1 useTime:30 itemWidth:2 happiness:5 desire:nil cost1:4000 cost2:6];

        }
    }
    
    if ([furnitureName isEqualToString:@"bookshelf"]) {
        if (furnitureLevel == 1) {
            [self properties:[[NSString alloc] initWithString:@"bookshelf"] desire1:[[NSString alloc] initWithString:@"intelligence"] desire2:[[NSString alloc] initWithString:@"relax"] level:1 users:1 useTime:30 itemWidth:1 happiness:2 desire:1 cost1:250 cost2:nil];

        }
        if (furnitureLevel == 2) {
            [self properties:[[NSString alloc] initWithString:@"bookshelf"] desire1:[[NSString alloc] initWithString:@"intelligence"] desire2:[[NSString alloc] initWithString:@"relax"] level:2 users:1 useTime:30 itemWidth:1 happiness:3 desire:1 cost1:1000 cost2:3];

        }
        if (furnitureLevel == 3) {
            [self properties:[[NSString alloc] initWithString:@"bookshelf"] desire1:[[NSString alloc] initWithString:@"intelligence"] desire2:[[NSString alloc] initWithString:@"relax"] level:3 users:1 useTime:30 itemWidth:1 happiness:3 desire:2 cost1:4000 cost2:6];

        }
    }
    
    if ([furnitureName isEqualToString:@"desk"]) {
        if (furnitureLevel == 1) {
            [self properties:[[NSString alloc] initWithString:@"desk"] desire1:[[NSString alloc] initWithString:@"intelligence"] desire2:[[NSString alloc] initWithString:@" "] level:1 users:1 useTime:30 itemWidth:1 happiness:4 desire:nil cost1:400 cost2:nil];
            
        }
        if (furnitureLevel == 2) {
            [self properties:[[NSString alloc] initWithString:@"desk"] desire1:[[NSString alloc] initWithString:@"intelligence"] desire2:[[NSString alloc] initWithString:@" "] level:2 users:1 useTime:30 itemWidth:1 happiness:5 desire:nil cost1:1600 cost2:4];
            
        }
        if (furnitureLevel == 3) {
            [self properties:[[NSString alloc] initWithString:@"desk"] desire1:[[NSString alloc] initWithString:@"intelligence"] desire2:[[NSString alloc] initWithString:@" "] level:3 users:1 useTime:30 itemWidth:1 happiness:6 desire:nil cost1:6400 cost2:8];
            
        }
    }
    
    if ([furnitureName isEqualToString:@"easel"]) {
        if (furnitureLevel == 1) {
            [self properties:[[NSString alloc] initWithString:@"easel"] desire1:[[NSString alloc] initWithString:@"artistic"] desire2:[[NSString alloc] initWithString:@" "] level:1 users:1 useTime:30 itemWidth:1 happiness:4 desire:nil cost1:400 cost2:nil];
            
        }
        if (furnitureLevel == 2) {
            [self properties:[[NSString alloc] initWithString:@"easel"] desire1:[[NSString alloc] initWithString:@"artistic"] desire2:[[NSString alloc] initWithString:@" "] level:2 users:1 useTime:30 itemWidth:1 happiness:5 desire:nil cost1:1600 cost2:4];
            
        }
        if (furnitureLevel == 3) {
            [self properties:[[NSString alloc] initWithString:@"easel"] desire1:[[NSString alloc] initWithString:@"artistic"] desire2:[[NSString alloc] initWithString:@" "] level:3 users:1 useTime:30 itemWidth:1 happiness:6 desire:nil cost1:6400 cost2:8];
            
        }
    }
    
    if ([furnitureName isEqualToString:@"karaokemachine"]) {
        if (furnitureLevel == 1) {
            [self properties:[[NSString alloc] initWithString:@"karaokemachine"] desire1:[[NSString alloc] initWithString:@"musical"] desire2:[[NSString alloc] initWithString:@" "] level:1 users:1 useTime:30 itemWidth:2 happiness:4 desire:nil cost1:500 cost2:nil];
            
        }
        if (furnitureLevel == 2) {
            [self properties:[[NSString alloc] initWithString:@"karaokemachine"] desire1:[[NSString alloc] initWithString:@"musical"] desire2:[[NSString alloc] initWithString:@" "] level:2 users:1 useTime:30 itemWidth:2 happiness:5 desire:nil cost1:2000 cost2:5];
            
        }
        if (furnitureLevel == 3) {
            [self properties:[[NSString alloc] initWithString:@"karaokemachine"] desire1:[[NSString alloc] initWithString:@"musical"] desire2:[[NSString alloc] initWithString:@" "] level:3 users:2 useTime:30 itemWidth:2 happiness:5 desire:nil cost1:8000 cost2:10];
            
        }
    }
    
    if ([furnitureName isEqualToString:@"tightrope"]) {
        if (furnitureLevel == 1) {
            [self properties:[[NSString alloc] initWithString:@"tightrope"] desire1:[[NSString alloc] initWithString:@"acrobatic"] desire2:[[NSString alloc] initWithString:@" "] level:1 users:1 useTime:30 itemWidth:3 happiness:5 desire:nil cost1:400 cost2:nil];
            
        }
        if (furnitureLevel == 2) {
            [self properties:[[NSString alloc] initWithString:@"tightrope"] desire1:[[NSString alloc] initWithString:@"acrobatic"] desire2:[[NSString alloc] initWithString:@" "] level:2 users:2 useTime:30 itemWidth:3 happiness:5 desire:nil cost1:1600 cost2:4];
            
        }
        if (furnitureLevel == 3) {
            [self properties:[[NSString alloc] initWithString:@"tightrope"] desire1:[[NSString alloc] initWithString:@"acrobatic"] desire2:[[NSString alloc] initWithString:@" "] level:3 users:3 useTime:30 itemWidth:3 happiness:5 desire:nil cost1:6400 cost2:8];
            
        }
    }
    
    if ([furnitureName isEqualToString:@"barbell"]) {
        if (furnitureLevel == 1) {
            [self properties:[[NSString alloc] initWithString:@"barbell"] desire1:[[NSString alloc] initWithString:@"strength"] desire2:[[NSString alloc] initWithString:@" "] level:1 users:1 useTime:30 itemWidth:1 happiness:5 desire:nil cost1:500 cost2:nil];
            
        }
        if (furnitureLevel == 2) {
            [self properties:[[NSString alloc] initWithString:@"barbell"] desire1:[[NSString alloc] initWithString:@"strength"] desire2:[[NSString alloc] initWithString:@" "] level:2 users:1 useTime:30 itemWidth:1 happiness:6 desire:nil cost1:2000 cost2:5];
            
        }
        if (furnitureLevel == 3) {
            [self properties:[[NSString alloc] initWithString:@"barbell"] desire1:[[NSString alloc] initWithString:@"strength"] desire2:[[NSString alloc] initWithString:@" "] level:3 users:1 useTime:30 itemWidth:1 happiness:7 desire:nil cost1:8000 cost2:10];
            
        }
    }

if ([furnitureName isEqualToString:@"magmahottub"]) {
    if (furnitureLevel == 1) {
        [self properties:[[NSString alloc] initWithString:@"magmahottub"] desire1:[[NSString alloc] initWithString:@"water"] desire2:[[NSString alloc] initWithString:@" "] level:1 users:1 useTime:30 itemWidth:2 happiness:4 desire:nil cost1:500 cost2:nil];
        
    }
    if (furnitureLevel == 2) {
        [self properties:[[NSString alloc] initWithString:@"magmahottub"] desire1:[[NSString alloc] initWithString:@"water"] desire2:[[NSString alloc] initWithString:@" "] level:2 users:2 useTime:30 itemWidth:2 happiness:4 desire:nil cost1:2000 cost2:5];
        
    }
    if (furnitureLevel == 3) {
        [self properties:[[NSString alloc] initWithString:@"magmahottub"] desire1:[[NSString alloc] initWithString:@"water"] desire2:[[NSString alloc] initWithString:@" "] level:3 users:2 useTime:30 itemWidth:2 happiness:5 desire:nil cost1:8000 cost2:10];
        
    }
}

if ([furnitureName isEqualToString:@"couch"]) {
    if (furnitureLevel == 1) {
        [self properties:[[NSString alloc] initWithString:@"couch"] desire1:[[NSString alloc] initWithString:@"relax"] desire2:[[NSString alloc] initWithString:@" "] level:1 users:2 useTime:30 itemWidth:2 happiness:3 desire:nil cost1:400 cost2:nil];
        
    }
    if (furnitureLevel == 2) {
        [self properties:[[NSString alloc] initWithString:@"couch"] desire1:[[NSString alloc] initWithString:@"relax"] desire2:[[NSString alloc] initWithString:@" "] level:2 users:2 useTime:30 itemWidth:2 happiness:4 desire:nil cost1:1600 cost2:4];
        
    }
    if (furnitureLevel == 3) {
        [self properties:[[NSString alloc] initWithString:@"couch"] desire1:[[NSString alloc] initWithString:@"relax"] desire2:[[NSString alloc] initWithString:@" "] level:3 users:2 useTime:30 itemWidth:2 happiness:5 desire:nil cost1:6400 cost2:8];
        
    }
}

if ([furnitureName isEqualToString:@"yogapad"]) {
    if (furnitureLevel == 1) {
        [self properties:[[NSString alloc] initWithString:@"yogapad"] desire1:[[NSString alloc] initWithString:@"relax"] desire2:[[NSString alloc] initWithString:@"strength"] level:1 users:2 useTime:30 itemWidth:2 happiness:2 desire:1 cost1:250 cost2:nil];
        
    }
    if (furnitureLevel == 2) {
        [self properties:[[NSString alloc] initWithString:@"yogapad"] desire1:[[NSString alloc] initWithString:@"relax"] desire2:[[NSString alloc] initWithString:@"strength"] level:2 users:2 useTime:30 itemWidth:2 happiness:3 desire:1 cost1:1000 cost2:3];
        
    }
    if (furnitureLevel == 3) {
        [self properties:[[NSString alloc] initWithString:@"yogapad"] desire1:[[NSString alloc] initWithString:@"relax"] desire2:[[NSString alloc] initWithString:@"strength"] level:3 users:2 useTime:30 itemWidth:2 happiness:3 desire:2 cost1:4000 cost2:6];
        
    }
}

if ([furnitureName isEqualToString:@"bandstand"]) {
    if (furnitureLevel == 1) {
        [self properties:[[NSString alloc] initWithString:@"bandstand"] desire1:[[NSString alloc] initWithString:@"music"] desire2:[[NSString alloc] initWithString:@" "] level:1 users:1 useTime:30 itemWidth:3 happiness:4 desire:nil cost1:300 cost2:nil];
        
    }
    if (furnitureLevel == 2) {
        [self properties:[[NSString alloc] initWithString:@"bandstand"] desire1:[[NSString alloc] initWithString:@"music"] desire2:[[NSString alloc] initWithString:@" "] level:2 users:2 useTime:30 itemWidth:3 happiness:4 desire:nil cost1:1200 cost2:3];
        
    }
    if (furnitureLevel == 3) {
        [self properties:[[NSString alloc] initWithString:@"bandstand"] desire1:[[NSString alloc] initWithString:@"music"] desire2:[[NSString alloc] initWithString:@" "] level:3 users:3 useTime:30 itemWidth:3 happiness:4 desire:nil cost1:4800 cost2:6];
        
    }
}

if ([furnitureName isEqualToString:@"climbingrope"]) {
    if (furnitureLevel == 1) {
        [self properties:[[NSString alloc] initWithString:@"climbingrope"] desire1:[[NSString alloc] initWithString:@"acrobatic"] desire2:[[NSString alloc] initWithString:@" "] level:1 users:1 useTime:30 itemWidth:1 happiness:4 desire:nil cost1:400 cost2:nil];
        
    }
    if (furnitureLevel == 2) {
        [self properties:[[NSString alloc] initWithString:@"climbingrope"] desire1:[[NSString alloc] initWithString:@"acrobatic"] desire2:[[NSString alloc] initWithString:@" "] level:2 users:1 useTime:30 itemWidth:1 happiness:5 desire:nil cost1:1600 cost2:4];
        
    }
    if (furnitureLevel == 3) {
        [self properties:[[NSString alloc] initWithString:@"climbingrope"] desire1:[[NSString alloc] initWithString:@"acrobatic"] desire2:[[NSString alloc] initWithString:@" "] level:3 users:1 useTime:30 itemWidth:1 happiness:6 desire:nil cost1:6400 cost2:8];
        
    }
}

if ([furnitureName isEqualToString:@"hamsterwheel"]) {
    if (furnitureLevel == 1) {
        [self properties:[[NSString alloc] initWithString:@"hamsterwheel"] desire1:[[NSString alloc] initWithString:@"acrobatic"] desire2:[[NSString alloc] initWithString:@" "] level:1 users:1 useTime:30 itemWidth:2 happiness:2 desire:nil cost1:250 cost2:nil];
        
    }
    if (furnitureLevel == 2) {
        [self properties:[[NSString alloc] initWithString:@"hamsterwheel"] desire1:[[NSString alloc] initWithString:@"acrobatic"] desire2:[[NSString alloc] initWithString:@" "] level:2 users:1 useTime:30 itemWidth:2 happiness:3 desire:nil cost1:1000 cost2:3];
        
    }
    if (furnitureLevel == 3) {
        [self properties:[[NSString alloc] initWithString:@"hamsterwheel"] desire1:[[NSString alloc] initWithString:@"acrobatic"] desire2:[[NSString alloc] initWithString:@" "] level:3 users:1 useTime:30 itemWidth:2 happiness:4 desire:nil cost1:4000 cost2:6];
        
    }
}

if ([furnitureName isEqualToString:@"strongmanhammer"]) {
    if (furnitureLevel == 1) {
        [self properties:[[NSString alloc] initWithString:@"strongmanhammer"] desire1:[[NSString alloc] initWithString:@"strength"] desire2:[[NSString alloc] initWithString:@" "] level:1 users:1 useTime:30 itemWidth:1 happiness:3 desire:nil cost1:250 cost2:nil];
        
    }
    if (furnitureLevel == 2) {
        [self properties:[[NSString alloc] initWithString:@"strongmanhammer"] desire1:[[NSString alloc] initWithString:@"strength"] desire2:[[NSString alloc] initWithString:@" "] level:2 users:1 useTime:30 itemWidth:1 happiness:4 desire:nil cost1:1000 cost2:3];
        
    }
    if (furnitureLevel == 3) {
        [self properties:[[NSString alloc] initWithString:@"strongmanhammer"] desire1:[[NSString alloc] initWithString:@"strength"] desire2:[[NSString alloc] initWithString:@" "] level:3 users:1 useTime:30 itemWidth:1 happiness:5 desire:nil cost1:4000 cost2:6];
        
    }
}

if ([furnitureName isEqualToString:@"whackamole"]) {
    if (furnitureLevel == 1) {
        [self properties:[[NSString alloc] initWithString:@"whackamole"] desire1:[[NSString alloc] initWithString:@"strength"] desire2:[[NSString alloc] initWithString:@"acrobatic"] level:1 users:1 useTime:30 itemWidth:2 happiness:1 desire:2 cost1:250 cost2:nil];
        
    }
    if (furnitureLevel == 2) {
        [self properties:[[NSString alloc] initWithString:@"whackamole"] desire1:[[NSString alloc] initWithString:@"strength"] desire2:[[NSString alloc] initWithString:@"acrobatic"] level:2 users:2 useTime:30 itemWidth:2 happiness:1 desire:2 cost1:1000 cost2:3];
        
    }
    if (furnitureLevel == 3) {
        [self properties:[[NSString alloc] initWithString:@"whackamole"] desire1:[[NSString alloc] initWithString:@"strength"] desire2:[[NSString alloc] initWithString:@"acrobatic"] level:3 users:2 useTime:30 itemWidth:2 happiness:1 desire:3 cost1:4000 cost2:6];
        
    }
}
}

-(void)properties:(NSString *) name desire1:(NSString *) desireOne desire2:(NSString *) desireTwo level:(NSInteger) furnitureLevel users:(NSInteger)numUsers useTime:(NSInteger) time itemWidth:(NSInteger) width happiness:(NSInteger)happinessR desire:(NSInteger)desireR cost1:(NSInteger) coins cost2:(NSInteger)leaves
{
    itemName = [[NSString alloc] initWithString:name];
    desire1 = [[NSString alloc] initWithString:desireOne];
    desire2 = [[NSString alloc] initWithString:desireTwo];
    itemLevel = furnitureLevel;
    users = numUsers;
    useTime = time;
    itemWidth = width;
    happinessReward = happinessR;
    desireReward = desireR;
    coinsCost = coins;
    leavesCost = leaves;
}

-(void)purchaseFurniture
{
    //check if user has the required amount
    //check what level it is in
    //if bought, assign the furniture its level & floor it is in
}

-(void)interactWithFurniture
{
    //check if collision has occured OR some other mechanism does this so as to enable interaction with seedling
    //check if max number of users - if not, then interaction can occur
    //start timer to time how long the inteaction should take
    //Award happiness Reward or Desire based on the circumstance
    //say space available once timer expires
    //kick out seedling
}

-(void) dealloc
{
    [desire1 release];
    [desire2 release];
    [itemName release];
    
    [super dealloc];
}

@end
