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

// initialize the seedling with the given image
-(id)initWithImage:(NSString *) imageName seedlingName:(NSString *) name
{
	self = [super init];
    myName = name;
    myHappiness = 0;
    myXP = 0;
    myRelationships = [NSMutableDictionary dictionary];
    myDesires = [NSMutableDictionary dictionary];
//    [self initWithFile: imageName rect:CGRectMake(0, 0, 20, 40)];
    CCSprite *target = [CCSprite spriteWithFile:imageName rect:CGRectMake(0, 0, 27, 40)];
    
    //new additions
    target.tag = 1;
    [_targets addObject:target];
    
    // Determine where to spawn the target along the Y axis
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    int minY = target.contentSize.height/2;
    int maxY = winSize.height - target.contentSize.height/2;
    int rangeY = maxY - minY;
    int actualY = (arc4random() % rangeY) + minY;
    
    // Create the target slightly off-screen along the right edge,
    // and along a random position along the Y axis as calculated above
    target.position = ccp(winSize.width + (target.contentSize.width/2), actualY);
    [self addChild:target];
    
    // Determine speed of the target
    int minDuration = 2.0;
    int maxDuration = 4.0;
    int rangeDuration = maxDuration - minDuration;
    int actualDuration = (arc4random() % rangeDuration) + minDuration;
    
    // Create the actions
    id actionMove = [CCMoveTo actionWithDuration:actualDuration
                                        position:ccp(-target.contentSize.width/2, actualY)];
    id actionMoveDone = [CCCallFuncN actionWithTarget:self
                                             selector:@selector(spriteMoveFinished:)];
    [target runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
    

	return self;
}


// 
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

//-(CGRect) getBounds{
//    CGSize size = [self contentSize];
//    size.width *= scaleX_;
//    size.height += scaleY_;
//    return CGRectMake( position_.x - size.width* anchorPoint_.x,
//                      position_.y - size.height* anchorPoint_.y, size.width,
//                      size.height);
//}

@end
