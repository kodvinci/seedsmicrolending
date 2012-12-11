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

//This method attaches the furniture items to their views using the ViewFurniture class which is a subclass of the UIImageView class. The furniture items are stored in an NSMutableArray.
//The resulting furniture views are then added as subViews to the main citadelView

-(void)displayFurniture
{
    NSData *myFurnit = [appDelegate.citadelData objectForKey:@"furniture"];
    NSArray *myarray = [NSKeyedUnarchiver unarchiveObjectWithData:myFurnit];
    myfurniture = [[NSMutableArray alloc]init];
    [myfurniture addObjectsFromArray:myarray];
    furnitureViews = [[NSMutableArray alloc]init];
    
    for (int k=0; k < myfurniture.count; k++) {
        UIImage *furnitureImage = [[myfurniture objectAtIndex:k]furnPic];
        
        //Non-plot Furniture
        if (![[[myfurniture objectAtIndex:k]itemName] isEqualToString:@"plot"]) {
            NSLog(@"My Furniture: %@", [[myfurniture objectAtIndex:k]itemName]);
            NSLog(@"My Furn desire1: %@", [[myfurniture objectAtIndex:k] desire1]);
            NSLog(@"My Furn desire2: %@", [[myfurniture objectAtIndex:k] desire2]);
            
            myFurnitureView = [[ViewFurniture alloc]initWithImage:furnitureImage];
            myFurnitureView.center = CGPointMake([[myfurniture objectAtIndex:k]xPos], [[myfurniture objectAtIndex:k]yPos]);
            myFurnitureView.tag = k;
            myFurnitureView.name = [[myfurniture objectAtIndex:k]itemName];
            [self.myFurnitureView setUserInteractionEnabled:YES];
            
            //add Pan Recognizer to FurnitureViews so that their individual displacement can be tracked.
            UIPanGestureRecognizer *panRecognizerF = [[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleFurnitureDisplacement:)] autorelease];
            [panRecognizerF setMinimumNumberOfTouches:1];
            [panRecognizerF setMaximumNumberOfTouches:1];
            [self.myFurnitureView addGestureRecognizer:panRecognizerF];
            
            [furnitureViews addObject:myFurnitureView];
            
            [self.citadelView addSubview:myFurnitureView];
        }
    }
}

//This method uses UIPanGestureRecognizer to track movements of the furniture within the citadel. The final position is saved as the new furniture position.
-(void)handleFurnitureDisplacement:(UIPanGestureRecognizer *)recognizer
{
    NSLog(@"handleFurnitureDisplacement");
    //This returns a point identifying the new location of the furniture in the coordinate system of its designated superview
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y);
    // Set the new furniture location in the coordinate system of the specified view
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    //Find the view the recognizer is attached to.
    NSInteger k = recognizer.view.tag;
    //Save the new x and y coordinates of the furniture
    [[myfurniture objectAtIndex:k] setXPos:recognizer.view.center.x];
    [[myfurniture objectAtIndex:k] setYPos:recognizer.view.center.y];
    NSData *furnData = [NSKeyedArchiver archivedDataWithRootObject:myfurniture];
    [appDelegate.citadelData setObject:furnData forKey:@"furniture"];
}

//The three methods, touchesBegan, touchesEnded, touchesMoved have been overriden and implemented in the ScrollSubClass class. This is because UIScrollview steals touches from the main view and does not forward them to the subviews.
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Citadel";
    
    //citadelView is initialized with a frame whose size equals the size of the main view (FloorViewController's view). citadelView is where all the other subViews are added to.
    self.citadelView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    //Enable scrolling and set the scrollView delegate as self.
    //Nest the citadelView in the scrollView so that when scrolling happens, the subViews remain fixed to the scrollView and are not left hanging on the screen.
    [scrollView setScrollEnabled:YES];
    self.scrollView.delegate = self;
    [self.scrollView addSubview:self.citadelView];
    
    //Enable user interaction with the citadelView and add a tag to it so that it can be differentiated from the other subViews
    [self.citadelView setUserInteractionEnabled:YES];
    self.citadelView.tag = 1000;
    
    //Heads-up Display labels. The values corresponding to the labels are fetched from the citadelData, a NSUserDefaults data structure.
    coins.text = [NSString stringWithFormat:@"%d",[appDelegate.citadelData integerForKey:@"coins"]];
    leaves.text = [NSString stringWithFormat:@"%@",[appDelegate.citadelData objectForKey:@"leaves"]];
    level.text = [NSString stringWithFormat:@"%@",[appDelegate.citadelData objectForKey:@"playerLevel"]];
    
    //display farm
    [self displayFarm];
    //display furniture
    [self displayFurniture];
    //display seedlings
    [self displaySeedlings];
    
    //Set the size of the scrollView to the size of the citadelView
    self.scrollView.contentSize = self.citadelView.frame.size;
    
}

//This method reanimates the HUD variables. It is called whenever one of them changes
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
- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    NSLog(@"handlePan");
    //This returns a point identifying the new location of the seedling in the coordinate system of its designated superview
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y);
    // Set the new Seedling location in the coordinate system of the specified view
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    [[myseedlings objectAtIndex:recognizer.view.tag] setSeedlingPosition:recognizer.view.center]; //set the seedlingPosition property in the seedling object
    NSData *seedData = [NSKeyedArchiver archivedDataWithRootObject:myseedlings];
    [appDelegate.citadelData setObject:seedData forKey:@"seedlings"];
    [appDelegate.citadelData synchronize]; //save the new position to disk
    
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
        UIImage *seedlingImage = [UIImage imageNamed:@"seedling"];
        //[[myseedlings objectAtIndex:k] myImage];
        mySeedlingView = [[SeedlingV2View alloc]initWithImage:seedlingImage];
        mySeedlingView.center = [[myseedlings objectAtIndex:k] seedlingPosition];
        [self.mySeedlingView setUserInteractionEnabled:YES];
        self.mySeedlingView.tag = k; //assign a tag for differentiating between various seedlings
        
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
    /* Subtract happiness from Seedling 
     Award Coins to Player
     Release Seedling from Farm
     Enable interaction with Seedling */
    
    //happiness
    [[myseedlings objectAtIndex:0] setMyHappiness:0];
    [[myseedlings objectAtIndex:0] setHappinessDeposited:[[myseedlings objectAtIndex:0] happinessDeposited] + 100];
    //coins
    NSInteger initialCoins = [appDelegate.citadelData integerForKey:@"coins"];
    [appDelegate.citadelData setInteger:(initialCoins+100) forKey:@"coins"];
    //position
    mySeedlingView.center = CGPointMake(myFarmView.center.x+150, myFarmView.center.y);
    [[myseedlings objectAtIndex:mySeedlingView.tag] setSeedlingPosition:mySeedlingView.center];
    
    //Save the new values
    NSData *seedData = [NSKeyedArchiver archivedDataWithRootObject:myseedlings];
    [appDelegate.citadelData setObject:seedData forKey:@"seedlings"];
    [appDelegate.citadelData synchronize];
    
    [NSTimer scheduledTimerWithTimeInterval:(7.0) target:self selector:@selector(moveSeedlingTimer) userInfo:nil repeats:NO];
    
    [self viewWillAppear:YES]; //refresh the HUD labels
    
}

//This method handles the change in the seedling's variables (myHappiness) once it is done interacting with the furniture. The method is called by a scheduled timer that fires 30 seconds after the seedling gets trapped in the furniture
//The seedling is then positioned away from the furniture and stays there for 7 seconds before it starts moving around

-(void)seedlingDoneInteractingWithFurniture
{
    NSInteger prevHappiness = [[myseedlings objectAtIndex:0] myHappiness];
    NSInteger RewardHappiness = [[myfurniture objectAtIndex:furniturePos] happinessReward1];
    NSInteger actualHappiness;
    //compute happiness to be awarded
    //If total happiness exceeds 100, the total happiness for the seedling is set at 100
    if (prevHappiness + RewardHappiness > 100) {
        actualHappiness = 100;
    }
    else {
        actualHappiness = RewardHappiness + prevHappiness;
    }
    //set myHappiness property to its new value
    [[myseedlings objectAtIndex:0] setMyHappiness:actualHappiness];
    
    //Position the seedling away from the furniture but in the same floor
    if (mySeedlingView.center.x + 100 > 300) {
        mySeedlingView.center = CGPointMake(mySeedlingView.center.x - 100, mySeedlingView.center.y);
    }
    else {
        mySeedlingView.center = CGPointMake(mySeedlingView.center.x + 100, mySeedlingView.center.y);
    }
    
    [[myseedlings objectAtIndex:mySeedlingView.tag] setSeedlingPosition:mySeedlingView.center]; //set the seedlingPosition property in the seedling object
    
    //Save the new values
    NSData *seedData = [NSKeyedArchiver archivedDataWithRootObject:myseedlings];
    [appDelegate.citadelData setObject:seedData forKey:@"seedlings"];
    [appDelegate.citadelData synchronize]; //flush the data to disk
    
    //Schedule a timer to fire in 7 seconds. This will release the Seedling and allow it start moving around
    [NSTimer scheduledTimerWithTimeInterval:(7.0) target:self selector:@selector(seedlingDoneIdling) userInfo:nil repeats:NO];
    
}

//This method is called by the NSTimer scheduled in the seedlingDoneInteractingWithFurniture method
//Enable furniture and seedling interaction, then let the seedling start moving again
-(void)seedlingDoneIdling
{
    [mySeedlingView setUserInteractionEnabled:YES];
    [[furnitureViews objectAtIndex:furniturePos] setUserInteractionEnabled:YES];
    [self moveSeedlingTimer];
}

//Single Seedling
//This method handles the movement of the seedling within the floor. It also checks constantly to see if a Seedling has come across a piece of furniture that satisfies its desires. If so, the seedling is trapped within that furniture for 30 seconds as it interacts with the piece of furniture. A timer is used to release the seedling after 30 seconds elapse.

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
            if (mySeedlingView.center.y > 175 || mySeedlingView.center.y < 25) {
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
            NSLog(@"furn desire1: %@", [[myfurniture objectAtIndex:0] desire1]);
            NSLog(@"furn desire2: %@", [[myfurniture objectAtIndex:0] desire2]);
            
            //check if Seedling desires are the same as that of furniture
            if ([[desires objectForKey:@"First Desire"] isEqualToString:[[myfurniture objectAtIndex:furniturePos] desire1]] || [[desires objectForKey:@"First Desire"] isEqualToString: [[myfurniture objectAtIndex:furniturePos] desire2]] ) {
                //do something
                NSLog(@"Seedling on Furniture!!");
                if ([myTime isValid]) {
                    [self.myTime invalidate];
                    myTime = nil;
                }
                mySeedlingView.center = myFun.center;
                //Disable interaction with Furniture & Seedling so that they cannot be moved while interaction occurs
                [mySeedlingView setUserInteractionEnabled:NO];
                [myFun setUserInteractionEnabled:NO];
                
                //set a timer to fire after Furniture UseTime
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
                [myFun setUserInteractionEnabled:NO];

                NSLog(@"seedlingHappiness before: %d",[[myseedlings objectAtIndex:0] myHappiness]);
                //set a timer to fire after furniture usetime
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
                [myFun setUserInteractionEnabled:NO];

                NSLog(@"seedlingHappiness before: %d",[[myseedlings objectAtIndex:0] myHappiness]);
                //set a timer to fire after furniture use time
                [NSTimer scheduledTimerWithTimeInterval:(30.0) target:self selector:@selector(seedlingDoneInteractingWithFurniture) userInfo:nil repeats:NO];
            }
            [desires release];
        }
    }
}

//Handle movement within a single floor. This method restricts the movement of the seedling on its own to the boundaries of the floor it is on.

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