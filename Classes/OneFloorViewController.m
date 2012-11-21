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
@class SeedlingV2View;

@implementation OneFloorViewController

@synthesize addFloor;
@synthesize coins, leaves, level;
@synthesize myFurnitureView, myFarmView;
@synthesize myfurniture, furnitureViews;
@synthesize pt, pos, myTouch;
@synthesize myseedlings;
@synthesize mySeedlingView;
@synthesize myTime;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        appDelegate = [[UIApplication sharedApplication] delegate];
       //  _seedlings = [[NSMutableArray alloc] init];
        
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
  //  [self.view setMultipleTouchEnabled:YES];
    
    NSData *myFurniture = [appDelegate.citadelData objectForKey:@"furniture"];
    NSArray *myarray = [NSKeyedUnarchiver unarchiveObjectWithData:myFurniture];
    myfurniture = [[NSMutableArray alloc]initWithArray:myarray];
    
    for (int k=0; k < myfurniture.count; k++) {
        UIImage *furnitureImage = [[myfurniture objectAtIndex:k]furnPic];
        
        //Non-plot furniture
        if (![[[myfurniture objectAtIndex:k]itemName] isEqualToString:@"plot"]) {
            NSLog(@"My Furniture: %@", [myfurniture objectAtIndex:k]);
            myFurnitureView = [[ViewFurniture alloc]initWithImage:furnitureImage];
            myFurnitureView.center = CGPointMake([[myfurniture objectAtIndex:k]xPos], [[myfurniture objectAtIndex:k]yPos]);
            myFurnitureView.tag = k;
            myFurnitureView.name = [[myfurniture objectAtIndex:k]itemName];
            [self.myFurnitureView setUserInteractionEnabled:YES];
            
            furnitureViews = [[NSMutableArray alloc]initWithObjects: nil];
            [furnitureViews addObject:myFurnitureView];

            [self.view addSubview:myFurnitureView];

        }
        
        //The farm
        if ([[[myfurniture objectAtIndex:k]itemName] isEqualToString:@"plot"]) {
            NSLog(@"My plot: %@", [myfurniture objectAtIndex:k]);
            xPosition = [[myfurniture objectAtIndex:k]xPos];
            yPosition = [[myfurniture objectAtIndex:k]yPos];
            myFarmView = [[ViewFurniture alloc]initWithImage:furnitureImage];
            myFarmView.center = CGPointMake([[myfurniture objectAtIndex:k]xPos], [[myfurniture objectAtIndex:k]yPos]);
            [self.myFarmView setUserInteractionEnabled:YES];
            [self.view addSubview:myFarmView];
        }
        
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"!!: %@", @"hitTest");

    UIView *hitView = [self.view hitTest:point withEvent:event];
    if (hitView == self.view) {
        NSLog(@"what is returned? %@", hitView);
        return nil;
    }
    else
        return hitView;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"?? %@", @"touchesMoved");
    
    myTouch = [[event allTouches]anyObject];
    pt = CGPointMake([myTouch locationInView:self.view].x, [myTouch locationInView:self.view].y);
    
    if (CGRectContainsPoint(myFarmView.frame, pt)) {
        myFarmView.center = [myTouch locationInView:self.view];
        NSLog(@"Farm x pos: %f",[myTouch locationInView:self.view].x);
        
        //store the new farm position
        for (int k=0; k < myfurniture.count; k++) {
            if ([[[myfurniture objectAtIndex:k]itemName] isEqualToString:@"plot"]) {
                [[myfurniture objectAtIndex:k] setXPos:[myTouch locationInView:self.view].x];
                [[myfurniture objectAtIndex:k] setYPos:[myTouch locationInView:self.view].y];
                NSData *furnData = [NSKeyedArchiver archivedDataWithRootObject:myfurniture];
                [appDelegate.citadelData setObject:furnData forKey:@"furniture"];
            }
            NSLog(@"New Farm X position: %d",[[myfurniture objectAtIndex:k]xPos]);
        } 
    }
    
    //seedling
    if (CGRectContainsPoint(mySeedlingView.frame, pt)) {
        mySeedlingView.center = [myTouch locationInView:self.view];
    }
    
    else {
        
        UITouch *touch = [touches anyObject];
        UIView *touchedView = [[UIView alloc] init];
        touchedView =  [self.view hitTest:[touch locationInView:self.view] withEvent:event];
        NSLog(@"touchedView tag: %d",touchedView.tag);
        if (touchedView.tag != 1000) {
            [touchedView setCenter:[touch locationInView:self.view]];
            [[myfurniture objectAtIndex:touchedView.tag] setXPos:[touch locationInView:self.view].x];
            [[myfurniture objectAtIndex:touchedView.tag] setYPos:[touch locationInView:self.view].y];
            NSData *furnData = [NSKeyedArchiver archivedDataWithRootObject:myfurniture];
            [appDelegate.citadelData setObject:furnData forKey:@"furniture"];
        }
    }
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setUserInteractionEnabled:YES];
    self.view.tag = 1000; //tag for super view

    NSLog(@"coins: %d", [appDelegate.citadelData integerForKey:@"coins"]);

    coins.text = [NSString stringWithFormat:@"%d",[appDelegate.citadelData integerForKey:@"coins"]];
    leaves.text = [NSString stringWithFormat:@"%@",[appDelegate.citadelData objectForKey:@"leaves"]];
    level.text = [NSString stringWithFormat:@"%@",[appDelegate.citadelData objectForKey:@"playerLevel"]];
    
    //display furniture
    [self displayFurniture];
    //display seedlings
    [self displaySeedlings];
}

-(void)viewWillAppear:(BOOL)animated
{
    
}

-(void)displaySeedlings
{
    NSData *mySeedling = [appDelegate.citadelData objectForKey:@"seedlings"];
    NSArray *myarray = [NSKeyedUnarchiver unarchiveObjectWithData:mySeedling];
    myseedlings = [[NSMutableArray alloc]initWithArray:myarray];
    
    for (int k=0; k < myseedlings.count; k++) {
        UIImage *seedlingImage = [[myseedlings objectAtIndex:k] myImage];
        mySeedlingView = [[SeedlingV2View alloc]initWithImage:seedlingImage];
        mySeedlingView.center = CGPointMake(100,100);
        [self.mySeedlingView setUserInteractionEnabled:YES];
        [self.view addSubview:mySeedlingView];
        //make seedling move
        [self moveSeedlingTimer];
        pos = CGPointMake(0.1, 0.1); //(X speed, Y speed)
     //   myTime = [NSTimer scheduledTimerWithTimeInterval:(0.03) target:self selector:@selector(moveSeedling) userInfo:nil repeats:YES];
        //CHECK SEEDLING CHARACTERISTICS
        NSLog(@"seedling: %@", myseedlings);
        NSLog(@"seedling name: %@", [[myseedlings objectAtIndex:0] myName]);
        NSLog(@"seedling happiness: %d", [[myseedlings objectAtIndex:0] myHappiness]);
        NSLog(@"seedling characteristic count: %d", [[[myseedlings objectAtIndex:0] myCharacteristics] count]);
        NSLog(@"seedling characteristics: %@", [[myseedlings objectAtIndex:0] myCharacteristics]);
        NSLog(@"seedling desires: %@", [[myseedlings objectAtIndex:0] myDesires]);

    }
    
}

-(void)moveSeedlingTimer
{
     myTime = [NSTimer scheduledTimerWithTimeInterval:(0.13) target:self selector:@selector(moveSeedling) userInfo:nil repeats:YES];
}

-(void)happinessCollectedTimer
{
    //Subtract happiness from Seedling, Award Coins to Player
    //release Seedling from Farm
    //Enable interaction with Farm and Seedling
    int newHappiness = [[myseedlings objectAtIndex:0] myHappiness] - 100;
    [[myseedlings objectAtIndex:0] setMyHappiness:newHappiness];
    [[myseedlings objectAtIndex:0] setHappinessDeposited:[[myseedlings objectAtIndex:0] happinessDeposited] + 100];
    NSData *seedData = [NSKeyedArchiver archivedDataWithRootObject:myseedlings];
    [appDelegate.citadelData setObject:seedData forKey:@"seedlings"];
    int initialCoins = [appDelegate.citadelData integerForKey:@"coins"];
    [appDelegate.citadelData setInteger:(initialCoins+100) forKey:@"coins"];
    mySeedlingView.center = CGPointMake(myFarmView.frame.size.width+20, myFarmView.frame.size.height+20); // (100, 100);
    [myFarmView setUserInteractionEnabled:YES];
    [mySeedlingView setUserInteractionEnabled:YES];
    [self moveSeedlingTimer];
}

-(void)moveSeedling
{
    //Random movement
    mySeedlingView.center = CGPointMake(mySeedlingView.center.x + pos.x, mySeedlingView.center.y + pos.y);
    if (mySeedlingView.center.x > 320 || mySeedlingView.center.x < 0) {
        pos.x = -pos.x;
    }
    if (mySeedlingView.center.y > 370 || mySeedlingView.center.y < 0) {
        pos.y = -pos.y;
    }
    //Check if Seedling in contact with farm
    if (CGRectIntersectsRect(mySeedlingView.frame, myFarmView.frame)) {
        //check if seedling has 100 happiness
        if ([[myseedlings objectAtIndex:0] myHappiness] >= 100) {
            NSLog(@"Seedling on Farm!!");
            [self.myTime invalidate];
            mySeedlingView.center = myFarmView.center;
            //Disable interaction with Farm & Seedling
            [mySeedlingView setUserInteractionEnabled:NO];
            [myFarmView setUserInteractionEnabled:NO];
            //set a timer to fire after an hour
            [NSTimer scheduledTimerWithTimeInterval:(10.0) target:self selector:@selector(happinessCollectedTimer) userInfo:nil repeats:NO];
        }
    }
    //Check if Seedling in contact with any furniture
    for (ViewFurniture *myFun in furnitureViews) {
        NSLog(@"In loop!!");
        if ((CGRectIntersectsRect(mySeedlingView.frame, myFun.frame))) {
            NSDictionary *desires = [[NSDictionary alloc]initWithDictionary:[[myseedlings objectAtIndex:0] myDesires]];
            //check if they have same desires
            if ([[desires objectForKey:@"First Desire"] isEqualToString: [[myfurniture objectAtIndex:0] desire1]] || [[desires objectForKey:@"First Desire"] isEqualToString: [[myfurniture objectAtIndex:0] desire2]] ) {
                    //do something
                NSLog(@"Seedling on Furniture!!");
            }
            if ([[desires objectForKey:@"Second Desire"] isEqualToString: [[myfurniture objectAtIndex:0] desire1]] || [[desires objectForKey:@"Second Desire"] isEqualToString: [[myfurniture objectAtIndex:0] desire2]] ) {
                //do something
                NSLog(@"Seedling on Furniture!!");
            }
            if ([[desires objectForKey:@"Third Desire"] isEqualToString: [[myfurniture objectAtIndex:0] desire1]] || [[desires objectForKey:@"Third Desire"] isEqualToString: [[myfurniture objectAtIndex:0] desire2]] ) {
                //do something
                NSLog(@"Seedling on Furniture!!");
            }

        }
    }
}

/*
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

} */

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
/*
-(void)dealloc
{
    [super dealloc];
    [myfurniture release];
    [addFloor release];
    [appDelegate release];
    [coins release];
    [leaves release];
    [level release];
    [myFurnitureView release];
    [myFarmView release];
    [myTouch release];
} */

@end
