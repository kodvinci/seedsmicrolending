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
@synthesize myFurnitureView, myFarmView;
@synthesize myfurniture, furnitureViews;
@synthesize pt, myTouch;

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
        NSString *myImage = [[myfurniture objectAtIndex:k]itemName];
        NSLog(@"name of furniture: %@", myImage);
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
            //NSLog(@"My Furniture Views Array: %@", [furnitureViews objectAtIndex:0]);
   
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
    NSLog(@"clever asses: %@", @"hitTest");

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
  
/*    UITouch *touch = [touches anyObject];
    for (ViewFurniture *fun in furnitureViews){
        if ([[touch view] tag] == fun.tag) {
            [fun setCenter: CGPointMake([myTouch locationInView:self.view].x, [myTouch locationInView:self.view].y)];
        }
    }
    
    UIView *touchedView = [[UIView alloc] init];
    
    touchedView =  [self.view hitTest:[touch locationInView:self.view] withEvent:event];

    [touchedView setCenter:[touch locationInView:self.view]];
  */
 //   [touchedView release];
    
    /*
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:touch.view];
    for (ViewFurniture *fView in furnitureViews) {
        if(CGRectContainsPoint(fView.frame, point)) {
            oldX = fView.center.x - fView.frame.origin.x - point.x;
            oldY = fView.center.y - fView.frame.origin.y - point.y;
            break;
        }
    } */
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"dumb asses?? %@", @"touchesMoved");
    
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
    
   /* CGPoint pointi = [myTouch locationInView:myTouch.view];
    for (ViewFurniture *funView in furnitureViews) {
        if (CGRectContainsPoint(funView.frame, pointi)) {
            [funView setCenter:CGPointMake(pointi.x+oldX, pointi.y+oldY)];
        }
    } */
    
 /*   else {
        
        for (ViewFurniture *fun in furnitureViews) {
            if (CGRectContainsPoint(fun.frame, pt)) {
                for (int j=0; j < myfurniture.count; j++) {
                    if([fun.name isEqualToString:[[myfurniture objectAtIndex:j]itemName]]) {
                        [[myfurniture objectAtIndex:j] setXPos:[myTouch locationInView:self.view].x];
                        [[myfurniture objectAtIndex:j] setYPos:[myTouch locationInView:self.view].y];
                        NSData *furnData = [NSKeyedArchiver archivedDataWithRootObject:myfurniture];
                        [appDelegate.citadelData setObject:furnData forKey:@"furniture"];
                        NSLog(@"New Furniture X pos: %d",[[myfurniture objectAtIndex:j]xPos]);
                        
                        [fun setCenter: CGPointMake([[myfurniture objectAtIndex:j]xPos], [[myfurniture objectAtIndex:j]yPos])];
                        break;
                    }
                }
            }
        }
   //     [self nonFarm];
        
    } 
   */
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
