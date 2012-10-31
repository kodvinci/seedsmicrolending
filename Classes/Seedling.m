//
//  Seedling.m
//  Microlending
//
//  Created by Tori Reynolds on 10/6/12.
//
//

#import "Seedling.h"

@implementation Seedling
@synthesize myName = myName_;
@synthesize myImage = myImage_;
@synthesize myHappiness = myHappiness_;
@synthesize myXP = myXP_;
@synthesize myRelationships = myRelationships_;
@synthesize myDesires = myDesires_;

-(id)initWithImage:(NSString *)imageName {
	self = [super init];
    myName = imageName;
    myHappiness = 0;
    myXP = 0;
    myRelationships = [NSMutableDictionary dictionary];
    myDesires = [NSMutableDictionary dictionary];
	return self;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    return true;
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.myName = [decoder decodeObjectForKey:@"myName"];
        self.myHappiness = [decoder decodeIntegerForKey:@"myHappiness"];
        self.myXP = [decoder decodeIntegerForKey:@"myXP"];
        self.myRelationships = [decoder decodeObjectForKey:@"myRelationships"];
        self.myDesires = [decoder decodeObjectForKey:@"myDesires"];
        self.myImage = [decoder decodeObjectForKey:@"myImage"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:myName forKey:@"myName"];
    [encoder encodeInteger:myHappiness forKey:@"myHappiness"];
    [encoder encodeInteger:myXP forKey:@"myXP"];
    [encoder encodeObject:myRelationships forKey:@"myRelationships"];
    [encoder encodeObject:myDesires forKey:@"myDesires"];
    [encoder encodeObject:myImage forKey:@"myImage"];
}


- (void) updateHappiness: (int) happinessDifference {
    myHappiness += happinessDifference;
}

- (void) updateXP: (int) xpDifference {
    myXP += xpDifference;
}

// FINISH THIS METHOD
- (void) makeNewFriend: (Seedling *)newFriend {
    [myRelationships setObject: newFriend forKey: 0];
}

// FINISH THIS METHOD
- (void) updateRelationshipPoints: (Seedling *) acquaintance: (int) pointChange {
}

-(void)dealloc
{
    [myName release];
    [myImage release];
    [myRelationships release];
    [myDesires release];
    [super dealloc];
}

-(CGRect) getBounds{
    CGSize size = [self contentSize];
    size.width *= scaleX_;
    size.height += scaleY_;
    return CGRectMake( position_.x - size.width* anchorPoint_.x,
                      position_.y - size.height* anchorPoint_.y, size.width,
                      size.height);
}

@end
