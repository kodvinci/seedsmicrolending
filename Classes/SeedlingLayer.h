//
//  SeedlingView.h
//  Microlending
//
//  Created by guest user on 10/6/12.
//
//

#import "MicrolendingAppDelegate.h"
#import "cocos2d.h"

@interface SeedlingLayer : CCLayerColor
{
    NSMutableArray *_targets;
    NSMutableArray *_projectiles;
    int _projectilesDestroyed;
    CCSprite *seedling;
    MicrolendingAppDelegate *appDelegate;
}

// returns a CCScene that contains the SeedlingLayer as the only child
+(CCScene *) scene;

@end