//
//  FloorViewController.m
//  Microlending
//
//  Created by Leonard Ng'eno on 11/9/12.
//
//

#import "FloorViewController.h"

@class MicrolendingAppDelegate;
@class CitadelViewController;
@class ViewFurniture;
@class SeedlingV2View;
@class SeedlingDataViewController;

@implementation FloorViewController

@synthesize addFloor;
@synthesize coins, leaves, level;
@synthesize myFurnitureView, myFarmView;
@synthesize myfurniture, furnitureViews;
@synthesize pt, pos, myTouch;
@synthesize myseedlings;
@synthesize mySeedlingView;
@synthesize myTime;
@synthesize des1, des2;
@synthesize floor1, floor2;
@synthesize scrollView;
@synthesize nibFileName;
@synthesize citadelView;
@synthesize panRecognizer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        appDelegate = [[UIApplication sharedApplication] delegate];
        nibFileName = [[NSString alloc]initWithString:nibNameOrNil];
    }
    
    return self;
}


-(void)floorGrowTimer
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

//add a new floor
-(IBAction)buyFloor
{
    if ([appDelegate.citadelData integerForKey:@"coins"] >= 100 && [appDelegate.citadelData integerForKey:@"playerLevel"] >= 1) {
        //can buy a new floor
        int newCoins = [appDelegate.citadelData integerForKey:@"coins"] - 100;
        [appDelegate.citadelData setInteger:newCoins forKey:@"coins"];
        [NSTimer scheduledTimerWithTimeInterval:(300.0) target:self selector:@selector(floorGrowTimer) userInfo:nil repeats:NO];
        [self viewWillAppear:YES];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Floor!" message:@"Your new floor will take 5 minutes to grow" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        alert.tag=2;
        [alert show];
        [alert release];
    }
    else {
        //alert that not enough coins or experience
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You don't have enough coins!" message:@"If your seedling has 100 happiness, drag it to the farm plot to earn more coins. Or help the seedling interact with a piece of furniture that can increase its happiness." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        alert.tag=1;
        [alert show];
        [alert release];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (alertView.tag==1) {
        // NO = 0, YES = 1
        if(buttonIndex == 0){
            // DO whatever "NO" is
        }
        else {
            // Do whatever "YES" is
        }
    }
    
    else if(alertView.tag==2) {
        if (buttonIndex == 0) {
            
        }
        else {
            
        }
        
    }
}

-(void)displayFarm
{
    NSData *myFarm = [appDelegate.citadelData objectForKey:@"plot"];
    NSDictionary *mydic = [[NSDictionary alloc]initWithDictionary:[NSKeyedUnarchiver unarchiveObjectWithData:myFarm]];
    UIImage *farmImage = [[mydic objectForKey:@"1"]furnPic];
    myFarmView = [[ViewFurniture alloc]initWithImage:farmImage];
    myFarmView.center = CGPointMake([[mydic objectForKey:@"1"] xPos],[[mydic objectForKey:@"1"] yPos]);
    [self.myFarmView setUserInteractionEnabled:NO];
    // [self.view addSubview:myFarmView];
    [self.citadelView addSubview:myFarmView];
    [mydic release];
}

//display the furniture
-(void)displayFurniture
{
    NSData *myFurnit = [appDelegate.citadelData objectForKey:@"furniture"];
    NSArray *myarray = [NSKeyedUnarchiver unarchiveObjectWithData:myFurnit];
    myfurniture = [[NSMutableArray alloc]init];
    [myfurniture addObjectsFromArray:myarray];
    furnitureViews = [[NSMutableArray alloc]init];
    
    for (int k=0; k < myfurniture.count; k++) {
        UIImage *furnitureImage = [[myfurniture objectAtIndex:k]furnPic];
        
        //Furniture
        if (![[[myfurniture objectAtIndex:k]itemName] isEqualToString:@"plot"]) {
            NSLog(@"My Furniture: %@", [[myfurniture objectAtIndex:k]itemName]);
            NSLog(@"My Furn desire1: %@", [[myfurniture objectAtIndex:k] desire1]);
            NSLog(@"My Furn desire2: %@", [[myfurniture objectAtIndex:k] desire2]);
            //   des1 = [[NSString alloc] initWithString:[[myfurniture objectAtIndex:k] desire1]];
            //   newHappiness = [[myfurniture objectAtIndex:k] happinessReward1];
            //  des2 = [[NSString alloc] initWithString:[[myfurniture objectAtIndex:k] desire2]];
            
            myFurnitureView = [[ViewFurniture alloc]initWithImage:furnitureImage];
            myFurnitureView.center = CGPointMake([[myfurniture objectAtIndex:k]xPos], [[myfurniture objectAtIndex:k]yPos]);
            myFurnitureView.tag = k;
            myFurnitureView.name = [[myfurniture objectAtIndex:k]itemName];
            [self.myFurnitureView setUserInteractionEnabled:YES];
            
            //add Pan Recognizer to FurnitureViews
            UIPanGestureRecognizer *panRecognizerF = [[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)] autorelease];
            [panRecognizer setMinimumNumberOfTouches:1];
            [panRecognizer setMaximumNumberOfTouches:1];
            [self.myFurnitureView addGestureRecognizer:panRecognizerF];
            
            [furnitureViews addObject:myFurnitureView];
            
            //   [self.view addSubview:myFurnitureView];
            [self.citadelView addSubview:myFurnitureView];
        }
        
    }
}
/*
 - (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
 {
 NSLog(@"!!: %@", @"hitTest");
 
 UIView *hitView = [self.view hitTest:point withEvent:event];
 // UIView *hitView = [self.citadelView hitTest:point withEvent:event];
 if (hitView == self.view) {
 // if (hitView == self.citadelView) {
 NSLog(@"what is returned? %@", hitView);
 return nil;
 }
 else
 return hitView;
 } */


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    /*  NSLog(@"Touches ended");
     UITouch *meTouch = [touches anyObject];
     if (CGRectContainsPoint(self.mySeedlingView.frame, [meTouch locationInView:self.scrollView])) {
     // your touch handling code goes here
     mySeedlingView.center = CGPointMake([meTouch locationInView:self.scrollView].x, [meTouch locationInView:self.scrollView].y);
     NSLog(@"YES");
     } */
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesMoved");
    /*
     myTouch = [[event allTouches]anyObject];
     pt = CGPointMake([myTouch locationInView:self.view].x, [myTouch locationInView:self.view].y);
     
     //seedling moved to a new spot
     if (CGRectContainsPoint(mySeedlingView.frame, pt)) {
     mySeedlingView.center = [myTouch locationInView:self.view];
     //Check if Seedling is brought to contact with farm
     if (CGRectIntersectsRect(mySeedlingView.frame, myFarmView.frame)) {
     //check if seedling has 100 happiness
     if ([[myseedlings objectAtIndex:0] myHappiness] >= 100) {
     NSLog(@"Seedling on Farm!!");
     //put Seedling at center of Farm
     //Disable further interaction with Seedling & further seedling movement
     //set a timer to fire after an hour
     mySeedlingView.center = myFarmView.center;
     [mySeedlingView setUserInteractionEnabled:NO];
     [self.myTime invalidate];
     [NSTimer scheduledTimerWithTimeInterval:(10.0) target:self selector:@selector(happinessCollectedTimer) userInfo:nil repeats:NO];
     }
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
     } */
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Citadel";
    //scrollView
    self.citadelView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
 //   if (![nibFileName isEqualToString:@"FloorViewController"] && ![nibFileName isEqualToString:@"TwoFloorsViewController"] && ![nibFileName isEqualToString:@"ThreeFloorsViewController"]) {
        NSLog(@"Scrollable Floors");
        [scrollView setScrollEnabled:YES];
        self.scrollView.delegate = self;
        [self.scrollView addSubview:self.citadelView];
 //   }
    
    
    //   [self.view setUserInteractionEnabled:YES];
    //   self.view.tag = 1000; //tag for super view
    [self.citadelView setUserInteractionEnabled:YES];
    self.citadelView.tag = 1000;
    
    coins.text = [NSString stringWithFormat:@"%d",[appDelegate.citadelData integerForKey:@"coins"]];
    leaves.text = [NSString stringWithFormat:@"%@",[appDelegate.citadelData objectForKey:@"leaves"]];
    level.text = [NSString stringWithFormat:@"%@",[appDelegate.citadelData objectForKey:@"playerLevel"]];
    
    //two floors variables
    [floor2 setImage:[UIImage imageNamed:@"citadel1"]];
    floor2.contentMode = UIViewContentModeTop;
    
    //display farm
    [self displayFarm];
    //display furniture
    [self displayFurniture];
    //display seedlings
    [self displaySeedlings];
    
    //Now tell the scrollView the size of the view
    self.scrollView.contentSize = self.citadelView.frame.size;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    coins.text = [NSString stringWithFormat:@"%d",[appDelegate.citadelData integerForKey:@"coins"]];
    leaves.text = [NSString stringWithFormat:@"%@",[appDelegate.citadelData objectForKey:@"leaves"]];
    level.text = [NSString stringWithFormat:@"%@",[appDelegate.citadelData objectForKey:@"playerLevel"]];
    
}

//When a Seedling is double-tapped, it opens a new view to display the Seedling properties such as its name, body color, desires etc.
-(void)handleDoubleTap:(UIGestureRecognizer *) gestureRecognizer
{
    NSLog(@"double tapped!");
    SeedlingDataViewController *OFVCmyTap = [[SeedlingDataViewController alloc] init];
	[self.navigationController pushViewController:OFVCmyTap animated:YES];
    [OFVCmyTap release];
}

//Handles the dragging of a Seedling to a new location
- (void)handlePan:(UIPanGestureRecognizer *)recognizer {
    NSLog(@"handlePan");
    //This returns a point identifying the new location of the seedling in the coordinate system of its designated superview
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y);
    // Set the new Seedling location in the coordinate system of the specified view
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    if ([appDelegate.citadelData integerForKey:@"floors"] == 2) {
        
        if (recognizer.view.center.y > 0 && recognizer.view.center.y < 200) {
            //Seedling dragged to top floor
            floorOne = YES;
            floorTwo = NO;
            NSLog(@"handlePan top floor");
        }
        
        if (recognizer.view.center.y > 220 && recognizer.view.center.y < 400) {
            //Seedling dragged to first floor
            floorOne = NO;
            floorTwo = YES;
            NSLog(@"handlePan first floor");
        }
        
    }
    
    //floor determination for Nib files with three or more floor. Sets the bool variable of the final location (floor) of the Seedling to YES and the rest to NO
    if ([appDelegate.citadelData integerForKey:@"floors"] > 2) {
        NSLog(@"3 or more floors!");
        //Floors are named from the top with the top most floor being called
        //floorOne and the one below it being called floorTwo and so on.
        if (recognizer.view.center.y > 0 && recognizer.view.center.y < 110) {
            floorOne = YES; floorTwo=floorThree=floorFour=floorFive=floorSix=floorSeven=floorEight=floorNine = NO;
        }
        if (recognizer.view.center.y > 110 && recognizer.view.center.y < 240) {
            floorTwo = YES; floorOne=floorThree=floorFour=floorFive=floorSix=floorSeven=floorEight=floorNine = NO;
        }
        if (recognizer.view.center.y > 240 && recognizer.view.center.y < 370) {
            floorThree = YES; floorOne=floorFour=floorTwo=floorFive=floorSix=floorSeven=floorEight=floorNine = NO;
        }
        if (recognizer.view.center.y > 370 && recognizer.view.center.y < 500) {
            floorFour = YES; floorOne=floorTwo=floorThree = NO;
        }
        if (recognizer.view.center.y > 500 && recognizer.view.center.y < 630) {
            floorFive = YES; floorOne=floorTwo=floorThree=floorFour = NO;
        }
        if (recognizer.view.center.y > 630 && recognizer.view.center.y < 760) {
            floorSix = YES; floorOne=floorTwo=floorThree=floorFour=floorFive = NO;
        }
        if (recognizer.view.center.y > 760 && recognizer.view.center.y < 890) {
            floorSeven = YES; floorOne=floorTwo=floorThree=floorFour=floorFive=floorSix = NO;
        }
        if (recognizer.view.center.y > 890 && recognizer.view.center.y < 1020) {
            floorEight = YES; floorOne=floorTwo=floorThree=floorFour=floorFive=floorSix=floorSeven = NO;
        }
        if (recognizer.view.center.y > 1020 && recognizer.view.center.y < 1150) {
            floorNine = YES; floorOne=floorTwo=floorThree=floorFour=floorFive=floorSix=floorSeven=floorEight = NO;
        }
        if (recognizer.view.center.y > 1150 && recognizer.view.center.y < 1280) {
            floorTen = YES; floorOne=floorTwo=floorThree=floorFour=floorFive=floorSix=floorSeven=floorEight=floorNine = NO;
        }
    }
    
    //Check if Seedling is brought to contact with farm
    if (CGRectIntersectsRect(mySeedlingView.frame, myFarmView.frame)) {
        //check if seedling has 100 happiness
        if ([[myseedlings objectAtIndex:0] myHappiness] >= 100) {
            NSLog(@"Seedling on Farm!!");
            //put Seedling at center of Farm
            //Disable further interaction with Seedling & further seedling movement
            //set a timer to fire after an hour
            mySeedlingView.center = myFarmView.center;
            [mySeedlingView setUserInteractionEnabled:NO];
            if ([myTime isValid]) {
                NSLog(@"Valid");
                [myTime invalidate];
                myTime = nil;
            }
            [NSTimer scheduledTimerWithTimeInterval:(10.0) target:self selector:@selector(happinessCollectedTimer) userInfo:nil repeats:NO];
        }
    }
    
}

-(void)displaySeedlings
{
    NSData *mySeedling = [appDelegate.citadelData objectForKey:@"seedlings"];
    NSArray *myarray = [NSKeyedUnarchiver unarchiveObjectWithData:mySeedling];
    myseedlings = [[NSMutableArray alloc]initWithArray:myarray];
    
    for (int k=0; k < myseedlings.count; k++) {
        UIImage *seedlingImage = [[myseedlings objectAtIndex:k] myImage];
        mySeedlingView = [[SeedlingV2View alloc]initWithImage:seedlingImage];
        mySeedlingView.center = CGPointMake(150,350);
        [self.mySeedlingView setUserInteractionEnabled:YES];
        
        //add double tap gesture to seedling
        UITapGestureRecognizer *doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
        doubleTapGestureRecognizer.numberOfTapsRequired = 2;
        // doubleTapGestureRecognizer.delegate = self;
        [mySeedlingView addGestureRecognizer:doubleTapGestureRecognizer];
        [doubleTapGestureRecognizer release];
        
        //add Pan Recognizer to UIImageView
        panRecognizer = [[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)] autorelease];
        [panRecognizer setMinimumNumberOfTouches:1];
        [panRecognizer setMaximumNumberOfTouches:1];
        //  [panRecognizer setDelegate:self];
        [self.mySeedlingView addGestureRecognizer:panRecognizer];
        
        //  self.scrollView.subViewRect = self.mySeedlingView.frame;
        [self.scrollView setSubViewRect:self.mySeedlingView.frame];
        //   [self.view addSubview:mySeedlingView];
        [self.citadelView addSubview:mySeedlingView];
        //make seedling move
        [self moveSeedlingTimer];
        
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
    //Seedling speed (X speed, Y speed)
    pos = CGPointMake(0.3, 0.3);
    [mySeedlingView setUserInteractionEnabled:YES];
    myTime = [NSTimer scheduledTimerWithTimeInterval:(0.13) target:self selector:@selector(moveSeedling) userInfo:nil repeats:YES];
}

-(void)happinessCollectedTimer
{
    //Subtract happiness from Seedling, Award Coins to Player
    //release Seedling from Farm
    //Enable interaction with Seedling
    NSInteger newSmilly = [[myseedlings objectAtIndex:0] myHappiness] - 100;
    [[myseedlings objectAtIndex:0] setMyHappiness:newSmilly];
    [[myseedlings objectAtIndex:0] setHappinessDeposited:[[myseedlings objectAtIndex:0] happinessDeposited] + 100];
    NSData *seedData = [NSKeyedArchiver archivedDataWithRootObject:myseedlings];
    [appDelegate.citadelData setObject:seedData forKey:@"seedlings"];
    NSInteger initialCoins = [appDelegate.citadelData integerForKey:@"coins"];
    [appDelegate.citadelData setInteger:(initialCoins+100) forKey:@"coins"];
    
    mySeedlingView.center = CGPointMake(myFarmView.center.x+150, myFarmView.center.y);
    [NSTimer scheduledTimerWithTimeInterval:(7.0) target:self selector:@selector(moveSeedlingTimer) userInfo:nil repeats:NO];
    
    [self viewWillAppear:YES];
    
}

-(void)seedlingDoneInteractingWithFurniture
{
    NSInteger prevHappiness = [[myseedlings objectAtIndex:0] myHappiness];
    NSInteger RewardHappiness = [[myfurniture objectAtIndex:furniturePos] happinessReward1];
    NSInteger actualHappiness;
    //compute happiness to be awarded
    if (prevHappiness + RewardHappiness > 100) {
        actualHappiness = 100;
    }
    else
        actualHappiness = RewardHappiness + prevHappiness;
    
    [[myseedlings objectAtIndex:0] setMyHappiness:actualHappiness];
    NSData *seedData = [NSKeyedArchiver archivedDataWithRootObject:myseedlings];
    [appDelegate.citadelData setObject:seedData forKey:@"seedlings"];
    mySeedlingView.center = CGPointMake(20, 340);
    //   NSLog(@"seedlingHappiness After: %d",[[myseedlings objectAtIndex:0] myHappiness]);
    [NSTimer scheduledTimerWithTimeInterval:(7.0) target:self selector:@selector(seedlingDoneIdling) userInfo:nil repeats:NO];
    
}

-(void)seedlingDoneIdling
{
    [mySeedlingView setUserInteractionEnabled:YES];
    [self moveSeedlingTimer];
}
//Single Seedling
-(void)moveSeedling
{
    //Random movement. Restricted to individual floor
    mySeedlingView.center = CGPointMake(mySeedlingView.center.x + pos.x, mySeedlingView.center.y + pos.y);
    //Horizontal movement restrictions
    if (mySeedlingView.center.x > 310 || mySeedlingView.center.x < 10) {
        pos.x = -pos.x;
    }
    //One Floor
    if ([appDelegate.citadelData integerForKey:@"floors"]==1) {
        if (mySeedlingView.center.y > 360 || mySeedlingView.center.y < 25) {
            pos.y = -pos.y;
        }
    }
    //Two floors
    if ([appDelegate.citadelData integerForKey:@"floors"]==2) {
        //floor 1 / top floor
        if (floorOne) {
            NSLog(@"top floor");
            if (mySeedlingView.center.y > 180 || mySeedlingView.center.y < 25) {
                pos.y = -pos.y;
            }
        }
        //floor 2 / first floor
        if (floorTwo) {
            NSLog(@"first floor");
            if (mySeedlingView.center.y > 420 || mySeedlingView.center.y < 250) {
                pos.y = -pos.y;
            }
        }
    }
    //Three floors and above
    if ([appDelegate.citadelData integerForKey:@"floors"] > 2) {
        [self moveWithinFloor];
    }
    
    //Check if Seedling in contact with any furniture
    for (ViewFurniture *myFun in furnitureViews) {
        if ((CGRectIntersectsRect(mySeedlingView.frame, myFun.frame))) {
            //Dealing with one seedling
            NSDictionary *desires = [[NSDictionary alloc]initWithDictionary:[[myseedlings objectAtIndex:0] myDesires]];
            
            //find out which furniture the seedling is interacting with
            furniturePos = 0;
            NSLog(@"Furniture is: %@", [myFun name]);
            for (int k=0; k<[myfurniture count]; k++) {
                if ([[[myfurniture objectAtIndex:k]itemName]isEqualToString:[myFun name]]) {
                    furniturePos = k;
                }
            }
            NSLog(@"Furniture position: %d", furniturePos);
            
            
            NSLog(@"furniture desire1: %@", [[myfurniture objectAtIndex:0] desire1]);
            NSLog(@"furniture desire2: %@", [[myfurniture objectAtIndex:0] desire2]);
            
            //check if Seedling desires are the same as that of furniture
            if ([[desires objectForKey:@"First Desire"] isEqualToString:[[myfurniture objectAtIndex:furniturePos] desire1]] || [[desires objectForKey:@"First Desire"] isEqualToString: [[myfurniture objectAtIndex:furniturePos] desire2]] ) {
                //do something
                NSLog(@"Seedling on Furniture!!");
                if ([myTime isValid]) {
                    [self.myTime invalidate];
                    myTime = nil;
                }
                mySeedlingView.center = myFun.center;
                //Disable interaction with Furniture & Seedling
                [mySeedlingView setUserInteractionEnabled:NO];
                
                //set a timer to fire after an hour
                [NSTimer scheduledTimerWithTimeInterval:(30.0) target:self selector:@selector(seedlingDoneInteractingWithFurniture) userInfo:nil repeats:NO];
                break; //get out of loop
            }
            if ([[desires objectForKey:@"Second Desire"] isEqualToString:[[myfurniture objectAtIndex:furniturePos] desire1]] || [[desires objectForKey:@"Second Desire"] isEqualToString: [[myfurniture objectAtIndex:furniturePos] desire2]] ) {
                //do something
                NSLog(@"Seedling on Furniture!!");
                if ([myTime isValid]) {
                    [self.myTime invalidate];
                    myTime = nil;
                }
                mySeedlingView.center = myFun.center;
                //Disable interaction with Furniture & Seedling
                [mySeedlingView setUserInteractionEnabled:NO];
                NSLog(@"seedlingHappiness before: %d",[[myseedlings objectAtIndex:0] myHappiness]);
                //set a timer to fire after an hour
                [NSTimer scheduledTimerWithTimeInterval:(30.0) target:self selector:@selector(seedlingDoneInteractingWithFurniture) userInfo:nil repeats:NO];
                break;
            }
            if ([[desires objectForKey:@"Third Desire"] isEqualToString:[[myfurniture objectAtIndex:furniturePos] desire1]] || [[desires objectForKey:@"Third Desire"] isEqualToString: [[myfurniture objectAtIndex:furniturePos] desire2]] ) {
                //do something
                NSLog(@"Seedling on Furniture!!");
                if ([myTime isValid]) {
                    [self.myTime invalidate];
                    myTime = nil;
                }
                mySeedlingView.center = myFun.center;
                //Disable interaction with Furniture & Seedling
                [mySeedlingView setUserInteractionEnabled:NO];
                NSLog(@"seedlingHappiness before: %d",[[myseedlings objectAtIndex:0] myHappiness]);
                //set a timer to fire after an hour
                [NSTimer scheduledTimerWithTimeInterval:(30.0) target:self selector:@selector(seedlingDoneInteractingWithFurniture) userInfo:nil repeats:NO];
            }
            [desires release];
        }
    }
}

//Handle movement within a single floor
-(void)moveWithinFloor
{
    //floor 1
    if (floorOne) {
        if (mySeedlingView.center.y > 80 || mySeedlingView.center.y < 25) {
            pos.y = -pos.y;
        }
    }
    //floor 2
    if (floorTwo) {
        if (mySeedlingView.center.y > 210 || mySeedlingView.center.y < 155) {
            pos.y = -pos.y;
        }
    }
    //floor 3
    if (floorThree) {
        if (mySeedlingView.center.y > 340 || mySeedlingView.center.y < 285) {
            pos.y = -pos.y;
        }
    }
    //floor 4
    if (floorFour) {
        if (mySeedlingView.center.y > 470 || mySeedlingView.center.y < 415) {
            pos.y = -pos.y;
        }
    }
    //floor 5
    if (floorFive) {
        if (mySeedlingView.center.y > 600 || mySeedlingView.center.y < 545) {
            pos.y = -pos.y;
        }
    }
    //floor 6
    if (floorSix) {
        if (mySeedlingView.center.y > 730 || mySeedlingView.center.y < 675) {
            pos.y = -pos.y;
        }
    }
    //floor 7
    if (floorSeven) {
        if (mySeedlingView.center.y > 860 || mySeedlingView.center.y < 805) {
            pos.y = -pos.y;
        }
    }
    //floor 8
    if (floorEight) {
        if (mySeedlingView.center.y > 990 || mySeedlingView.center.y < 935) {
            pos.y = -pos.y;
        }
    }
    //floor 9
    if (floorNine) {
        if (mySeedlingView.center.y > 1120 || mySeedlingView.center.y < 1065) {
            pos.y = -pos.y;
        }
    }
    //floor 10
    if (floorTen) {
        if (mySeedlingView.center.y > 1250 || mySeedlingView.center.y < 1195) {
            pos.y = -pos.y;
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
}

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
    [myseedlings release];
    [mySeedlingView release];
    [furnitureViews release];
    [myTime release];
    [scrollView release];
}

@end