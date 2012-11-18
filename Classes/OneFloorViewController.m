//
//  OneFloorViewController.m
//  Microlending
//
//  Created by guest user on 11/9/12.
//
//

#import "OneFloorViewController.h"

@class MicrolendingAppDelegate;
@class CitadelViewController;
@class ViewFurniture;

@implementation OneFloorViewController

@synthesize addFloor;
@synthesize coins, leaves, level;
@synthesize myFurnitureView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        appDelegate = [[UIApplication sharedApplication] delegate];
         _seedlings = [[NSMutableArray alloc] init];
        
    }
    return self;
}

//add a new floor
-(IBAction)buyFloor
{
    int numFloor = [appDelegate.citadelData integerForKey:@"floors"];
    numFloor +=1;
    NSLog(@"numFloor: %d", numFloor);
    CitadelViewController *OFmyCitadel = [[CitadelViewController alloc] init];
    [self.navigationController initWithRootViewController:OFmyCitadel];
    [OFmyCitadel displayFloors:numFloor];
    [appDelegate.citadelData setInteger:numFloor forKey:@"floors"];
    NSLog(@"floors: %d", [appDelegate.citadelData integerForKey:@"floors"]);
    [OFmyCitadel release];
}

//display the furniture
-(void)displayFurniture
{
    NSData *myFurniture = [appDelegate.citadelData objectForKey:@"furniture"];
    NSMutableArray *myfurniture = [NSKeyedUnarchiver unarchiveObjectWithData:myFurniture];
    for (int k=0; k < myfurniture.count; k++) {
        NSLog(@"My Furniture: %@", [myfurniture objectAtIndex:k]);
        NSString *myImage = [[myfurniture objectAtIndex:k]itemName];
        NSLog(@"name: %@", myImage);
        UIImage *furnitureImage = [[myfurniture objectAtIndex:k]furnPic]; 
        myFurnitureView = [[ViewFurniture alloc]initWithImage:furnitureImage];
        myFurnitureView.center = CGPointMake([[myfurniture objectAtIndex:k]xPos], [[myfurniture objectAtIndex:k]yPos]);

        [self.view addSubview:myFurnitureView];
    }
}
/*
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
 //   NSLog(@"%@", @"touchesEnded! OneFloorViewController");
    UITouch *myTouch = [[event allTouches]anyObject];
    myFurnitureView.center = [myTouch locationInView:self.view];
    NSLog(@"x pos: %f",[myTouch locationInView:self.view].x);
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"coins: %d", [appDelegate.citadelData integerForKey:@"coins"]);

    coins.text = [NSString stringWithFormat:@"%d",[appDelegate.citadelData integerForKey:@"coins"]];
    leaves.text = [NSString stringWithFormat:@"%@",[appDelegate.citadelData objectForKey:@"leaves"]];
    level.text = [NSString stringWithFormat:@"%@",[appDelegate.citadelData objectForKey:@"playerLevel"]];
    
    //display furniture
    [self displayFurniture];
    
//COCOS2D
    CCDirector *director = [CCDirector sharedDirector];
    
    if([director isViewLoaded] == NO)
    {
        NSLog(@"In %@", @"director viewNotLoaded");

        // Create the OpenGL view that Cocos2D will render to.
        CCGLView *glView = [CCGLView viewWithFrame:[[[UIApplication sharedApplication] keyWindow] bounds]
                                       pixelFormat:kEAGLColorFormatRGBA8
                                       depthFormat:0
                                preserveBackbuffer:NO
                                        sharegroup:nil
                                     multiSampling:NO
                                   numberOfSamples:0];
        
        glView.backgroundColor = [UIColor clearColor];

        // Assign the view to the director.
        director.view = glView;
        
        // Initialize other director settings.
        [director setAnimationInterval:1.0f/60.0f];
        [director enableRetinaDisplay:YES];
    }
    
    // Set the view controller as the director's delegate, so we can respond to certain events.
    director.delegate = self;
    
    // Add the director as a child view controller of this view controller.
    [self addChildViewController:director];
    
    // Add the director's OpenGL view as a subview so we can see it.
    [self.view addSubview:director.view];
  //  [self.view sendSubviewToBack:director.view];
   
    
    // Finish up our view controller containment responsibilities.
    [director didMoveToParentViewController:self];
    
    // Run whatever scene we'd like to run here.
    if(director.runningScene)
        [director replaceScene:[SeedlingLayer scene]];
    else
       [director runWithScene:[SeedlingLayer scene]];


}


-(void)displaySeedling
{
    NSLog(@"In %@", @"displaySeedling");
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    CCSprite *seedling = [CCSprite spriteWithFile:@"seedling.png" rect:CGRectMake(0, 0, 27, 40)];
    [_seedlings addObject:seedling];
    
    // Determine where to spawn the target along the Y axis
    int minY = seedling.contentSize.height/2;
    int maxY = winSize.height - seedling.contentSize.height/2;
    int rangeY = maxY - minY;
    int actualY = (arc4random() % rangeY) + minY;
    
    // Create the target slightly off-screen along the right edge,
    // and along a random position along the Y axis as calculated above
   // seedling.position = ccp(winSize.width + (seedling.contentSize.width/2), actualY);
    seedling.position = ccp(100, 100);
//    [self addChild:seedling];
    
    // Determine speed of the target
    int minDuration = 2.0;
    int maxDuration = 4.0;
    int rangeDuration = maxDuration - minDuration;
    int actualDuration = (arc4random() % rangeDuration) + minDuration;
    
    // Create the actions
    id actionMove = [CCMoveTo actionWithDuration:actualDuration
                                        position:ccp(-seedling.contentSize.width/2, actualY)];
    [seedling runAction:[CCSequence actions:actionMove, nil]];

//    id actionMoveDone = [CCCallFuncN actionWithTarget:self
//                                             selector:@selector(spriteMoveFinished:)];
//    [seedling runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    [[CCDirector sharedDirector] setDelegate:nil];
}

@end
