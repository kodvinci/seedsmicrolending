//
//  SeedlingView.m
//  Microlending
//
//  Created by guest user on 10/6/12.
//
//

// Import the interfaces
#import "SeedlingLayer.h"
#import "MicrolendingAppDelegate.h"

// SeedlingLayer implementation
@implementation SeedlingLayer

// Helper class method that creates a Scene with the SeedlingLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	SeedlingLayer *layer = [SeedlingLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (void)update:(ccTime)dt {
    
/*    NSMutableArray *projectilesToDelete = [[NSMutableArray alloc] init];
    for (CCSprite *projectile in _projectiles) {
        CGRect projectileRect = CGRectMake(
                                           projectile.position.x - (projectile.contentSize.width/2),
                                           projectile.position.y - (projectile.contentSize.height/2),
                                           projectile.contentSize.width,
                                           projectile.contentSize.height);
        
        NSMutableArray *targetsToDelete = [[NSMutableArray alloc] init];
        for (CCSprite *target in _targets) {
            CGRect targetRect = CGRectMake(
                                           target.position.x - (target.contentSize.width/2),
                                           target.position.y - (target.contentSize.height/2),
                                           target.contentSize.width,
                                           target.contentSize.height);
            
            if (CGRectIntersectsRect(projectileRect, targetRect)) {
                [targetsToDelete addObject:target];
            }
        }
  
        for (CCSprite *target in targetsToDelete) {
            [_targets removeObject:target];
            [self removeChild:target cleanup:YES];
            
            _projectilesDestroyed++; 
            if (_projectilesDestroyed > 30) {
                GameOverScene *gameOverScene = [GameOverScene node];
                _projectilesDestroyed = 0;
                [gameOverScene.layer.label setString:@"You Win!"];
                [[CCDirector sharedDirector] replaceScene:gameOverScene]; 
            }
        }
        
      if (targetsToDelete.count > 0) {
            [projectilesToDelete addObject:projectile];
        }
        [targetsToDelete release];
    }
    
    for (CCSprite *projectile in projectilesToDelete) {
        [_projectiles removeObject:projectile];
        [self removeChild:projectile cleanup:YES];
    }
    [projectilesToDelete release]; */
    
    CGRect seedlingRect = CGRectMake(seedling.position.x - (seedling.contentSize.width/2), seedling.position.y - (seedling.contentSize.height/2),seedling.contentSize.width,seedling.contentSize.height);
}
/*
-(void)spriteMoveFinished:(id)sender {
    CCSprite *sprite = (CCSprite *)sender;
    
    if (sprite.tag == 1) { // target
        [_targets removeObject:sprite];
    } else if (sprite.tag == 2) { // projectile
        [_projectiles removeObject:sprite];
    }
    
    [self removeChild:sprite cleanup:YES];
    
    GameOverScene *gameOverScene = [GameOverScene node];
    [gameOverScene.layer.label setString:@"You Lose :["];
    [[CCDirector sharedDirector] replaceScene:gameOverScene];
} */

-(void)addTarget {
    NSLog(@"SeedlingLayer: %@", @"addTarget");

//    CCSprite *target = [CCSprite spriteWithFile:@"seedling.png" rect:CGRectMake(0, 0, 50, 50)];
    
    //new additions
//    target.tag = 1;
//    [_targets addObject:target];
    
    // Determine where to spawn the target along the Y axis
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    int minY = seedling.contentSize.height/2;
    int maxY = winSize.height - seedling.contentSize.height/2;
    int rangeY = maxY - minY;
    int actualY = (arc4random() % rangeY) + minY;
    
    // Create the target along the right edge,
    // and along a random position along the Y axis as calculated above
    seedling.position = ccp(winSize.width - (seedling.contentSize.width/2), actualY);
    [self addChild:seedling];
    
    // Determine speed of the target
    int minDuration = 5.0;
    int maxDuration = 8.0;
    int rangeDuration = maxDuration - minDuration;
    int actualDuration = (arc4random() % rangeDuration) + minDuration;
    
    // Create the actions
    id actionMove = [CCMoveTo actionWithDuration:actualDuration
                                        position:ccp(-seedling.contentSize.width/2, actualY)];
 //   id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(spriteMoveFinished:)];
  
 //   [seedling runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
    [seedling runAction:[CCSequence actions:actionMove, nil]];
 
}


-(void)gameLogic:(ccTime)dt {
    [self moveAround];
}

// on "init" you need to initialize your instance

-(void)moveAround
{
    // Determine speed of seedling
    int minDuration = 5.0;
    int maxDuration = 8.0;
    int rangeDuration = maxDuration - minDuration;
    int actualDuration = (arc4random() % rangeDuration) + minDuration;
    
    //determine where to move to
    NSData *myFurniture = [appDelegate.citadelData objectForKey:@"furniture"];
    NSMutableArray *myfurniture = [NSKeyedUnarchiver unarchiveObjectWithData:myFurniture];
    for (int k=0; k < myfurniture.count; k++) {
        NSLog(@"My Furniture: %@", [myfurniture objectAtIndex:k]);
        int actualX = [[myfurniture objectAtIndex:k]xPos];
        int actualY = [[myfurniture objectAtIndex:k]yPos];

        id actionMove = [CCMoveTo actionWithDuration:actualDuration position:ccp(actualX, actualY)];
        
        [seedling runAction:[CCSequence actions:actionMove, nil]];
    }
}

-(id) init
{
    NSLog(@"SeedlingLayer: %@", @"init");
    
    appDelegate = [[UIApplication sharedApplication]delegate];
 
    if( (self=[super initWithColor:ccc4(0,0,0,0)] )) {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        seedling = [CCSprite spriteWithFile:@"seedling.png" rect:CGRectMake(0, 0, 50, 50)];
        seedling.tag = 1;
        seedling.position = ccp(seedling.contentSize.width/2, winSize.height/2);
        [self addChild:seedling];
    }
    
    self.isTouchEnabled = YES;
    
 //   [self schedule:@selector(update:)];
    
    [self moveAround];
    
//    [self schedule:@selector(gameLogic:) interval:1.0];
    
    return self;

}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    //gimme some noise
 //   [[SimpleAudioEngine sharedEngine] playEffect:@"pew-pew-lei.caf"];
    // Choose one of the touches to work with
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
    // Set up initial location of projectile
 //   CGSize winSize = [[CCDirector sharedDirector] winSize];
//    CCSprite *projectile = [CCSprite spriteWithFile:@"red.png" rect:CGRectMake(0, 0, 20, 20)];
//    projectile.position = ccp(20, winSize.height/2);
    
    //new additions
 //   projectile.tag = 2;
 //   [_projectiles addObject:projectile];
    
    // Determine offset of location to projectile
 //   int offX = location.x - projectile.position.x;
  //  int offY = location.y - projectile.position.y;
    
    // Bail out if we are shooting down or backwards
  //  if (offX <= 0) return;
    
    // Ok to add now - we've double checked position
  //  [self addChild:projectile];
    
    // Determine where we wish to shoot the projectile to
  //  int realX = winSize.width + (projectile.contentSize.width/2);
 //   float ratio = (float) offY / (float) offX;
  //  int realY = (realX * ratio) + projectile.position.y;
  //  CGPoint realDest = ccp(realX, realY);
    
    // Determine the length of how far we're shooting
 //   int offRealX = realX - projectile.position.x;
 //   int offRealY = realY - projectile.position.y;
//    float length = sqrtf((offRealX*offRealX)+(offRealY*offRealY));
 //   float velocity = 480/1; // 480pixels/1sec
 //   float realMoveDuration = length/velocity;
    
    // Move projectile to actual endpoint
 /*   [projectile runAction:[CCSequence actions:
                           [CCMoveTo actionWithDuration:realMoveDuration position:realDest],
                           [CCCallFuncN actionWithTarget:self selector:@selector(spriteMoveFinished:)],
                           nil]];
   */
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
    [_targets release];
    _targets = nil;
    [_projectiles release];
    _projectiles = nil;
    
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate
/*
-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	MicrolendingAppDelegate *app = [[UIApplication sharedApplication] delegate];
	[[app navigationController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	MicrolendingAppDelegate *app = [[UIApplication sharedApplication] delegate];
	[[app navigationController] dismissModalViewControllerAnimated:YES];
} */
@end
