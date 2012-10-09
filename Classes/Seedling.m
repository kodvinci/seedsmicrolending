//
//  Seedling.m
//  Microlending
//
//  Created by guest user on 10/6/12.
//
//

#import "Seedling.h"

@implementation Seedling
@synthesize myName;
@synthesize myImage;
@synthesize myHappiness;
@synthesize myXP;
@synthesize myRelationships;
@synthesize myDesires;

-(id)initWithImage:(NSString *)imageName {
	self = [super init];
    myName = imageName;
   // myName = @"seedling1";
    /*
     NEED TO FIX IMAGE OF SEEDLING - OR SHOULD HAVE SEPARATE VIEW CONTROLLER?
     myImage = [UIImageView initWithImage: (UIImage*) @"Seedling.png"]; */
    
    myHappiness = 0;
    myXP = 0;
    myRelationships = [NSMutableDictionary dictionary];
    myDesires = [NSMutableDictionary dictionary];
	return self;
}

- (void) updateHappiness: (int) happinessDifference {
    myHappiness += happinessDifference;
}

- (void) updateXP: (int) xpDifference {
    myXP += xpDifference;
}

-(void)dealloc
{
    [myName release];
    [myImage release];
    [myRelationships release];
    [myDesires release];
    [super dealloc];
}

@end
