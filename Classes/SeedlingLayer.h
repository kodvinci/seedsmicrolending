//
//  SeedlingView.h
//  Microlending
//
//  Created by guest user on 10/6/12.
//
//

#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

@interface SeedlingLayer : CCLayerColor
{
    NSMutableArray *_targets;
    NSMutableArray *_projectiles;
    int _projectilesDestroyed;
}

// returns a CCScene that contains the SeedlingLayer as the only child
+(CCScene *) scene;

@end