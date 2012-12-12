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
@class Citadel;

@implementation FloorViewController

@synthesize addFloor;
@synthesize coins, leaves, level;
@synthesize myFurnitureView, myFarmView;
@synthesize myfurniture, furnitureViews;
@synthesize pt, pos, myTouch;
@synthesize myseedlings;
@synthesize mySeedlingView;
@synthesize myTime;
@synthesize scrollView;
@synthesize nibFileName;
@synthesize citadelView;
@synthesize panRecognizer;
@synthesize floorGrowing;

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

//This method is called by a scheduled NSTimer once the required wait time elapses. The method calls the CitadelViewController's displayFloors method with the new number of floors to display in the citadel. It also sets the BOOL floorGrowing to NO so that the player can be able to buy another floor if they have the means to do so.

-(void)floorGrowTimer
{
    NSInteger numFloor = [appDelegate.citadelData integerForKey:@"floors"];
    numFloor +=1;
    NSLog(@"numFloor: %d", numFloor);
    CitadelViewController *OFmyCitadel = [[CitadelViewController alloc] init];
    [self.navigationController initWithRootViewController:OFmyCitadel];
    [OFmyCitadel displayFloors:numFloor];
    [appDelegate.citadelData setInteger:numFloor forKey:@"floors"];
    [appDelegate.citadelData synchronize];
   
    floorGrowing = NO; //to enable purchase of new floor later
    
    [OFmyCitadel release];
}

//add a new floor to the citadel. This method is called when the button with + on the top right hand side is pressed. The calculations for the cost of the new floor is done in the Citadel class. If the floor is bought, a timer is scheduled to avail the new floors once the grow time for the floor elapses.

-(IBAction)buyFloor
{
    NSLog(@"buyFloor pressed");
    
if (floorGrowing == NO) {
    NSInteger currentNumFloors = [appDelegate.citadelData integerForKey:@"floors"];
    NSInteger newNumFloors = currentNumFloors + 1;
    
    //Purchase of the floor is done in the citadel class. If the floor is successfully bought, the return value is YES, if not, the return value is NO
    Citadel *newFloor = [[Citadel alloc]init];
    BOOL result = [newFloor addFloor:(newNumFloors)];
    
     //Floor bought
    if (result == YES) {
        NSLog(@"YES");
        floorGrowing = YES;
        //Two floors
        if (newNumFloors == 2) {
            [NSTimer scheduledTimerWithTimeInterval:(300.0) target:self selector:@selector(floorGrowTimer) userInfo:nil repeats:NO];
            [self viewWillAppear:YES];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Floor Added!" message:@"Your new floor will take 5 minutes to grow" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            alert.tag=2;
            [alert show];
            [alert release];
        }
        //Three floors
        if (newNumFloors == 3) {
            [NSTimer scheduledTimerWithTimeInterval:(3600.0) target:self selector:@selector(floorGrowTimer) userInfo:nil repeats:NO];
            [self viewWillAppear:YES];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Floor Added!" message:@"Your new floor will take 1 hour to grow" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            alert.tag=2;
            [alert show];
            [alert release];
        }
        //Four floors
        if (newNumFloors == 4) {
            [NSTimer scheduledTimerWithTimeInterval:(14400.0) target:self selector:@selector(floorGrowTimer) userInfo:nil repeats:NO];
            [self viewWillAppear:YES];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Floor Added!" message:@"Your new floor will take 4 hours to grow" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            alert.tag=2;
            [alert show];
            [alert release];
        }
        //Five floors
        if (newNumFloors == 5) {
            [NSTimer scheduledTimerWithTimeInterval:(28800.0) target:self selector:@selector(floorGrowTimer) userInfo:nil repeats:NO];
            [self viewWillAppear:YES];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Floor Added!" message:@"Your new floor will take 8 hours to grow" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            alert.tag=2;
            [alert show];
            [alert release];
        }
        //Six floors
        if (newNumFloors == 6) {
            [NSTimer scheduledTimerWithTimeInterval:(57600.0) target:self selector:@selector(floorGrowTimer) userInfo:nil repeats:NO];
            [self viewWillAppear:YES];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Floor Added!" message:@"Your new floor will take 16 hours to grow" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            alert.tag=2;
            [alert show];
            [alert release];
        }
        //Seven floors
        if (newNumFloors == 7) {
            [NSTimer scheduledTimerWithTimeInterval:(115200.0) target:self selector:@selector(floorGrowTimer) userInfo:nil repeats:NO];
            [self viewWillAppear:YES];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Floor Added!" message:@"Your new floor will take 32 hours to grow" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            alert.tag=2;
            [alert show];
            [alert release];
        }
        //Eight floors
        if (newNumFloors == 8) {
            [NSTimer scheduledTimerWithTimeInterval:(230400.0) target:self selector:@selector(floorGrowTimer) userInfo:nil repeats:NO];
            [self viewWillAppear:YES];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Floor Added!" message:@"Your new floor will take 64 hours to grow" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            alert.tag=2;
            [alert show];
            [alert release];
        }
        // Nine floors
        if (newNumFloors == 9) {
            [NSTimer scheduledTimerWithTimeInterval:(460800.0) target:self selector:@selector(floorGrowTimer) userInfo:nil repeats:NO];
            [self viewWillAppear:YES];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Floor Added!" message:@"Your new floor will take 128 hours to grow" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            alert.tag=2;
            [alert show];
            [alert release];
        }
        //Ten floors
        if (newNumFloors == 10) {
            [NSTimer scheduledTimerWithTimeInterval:(921600.0) target:self selector:@selector(floorGrowTimer) userInfo:nil repeats:NO];
            [self viewWillAppear:YES];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Floor Added!" message:@"Your new floor will take 256 hours to grow" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            alert.tag=2;
            [alert show];
            [alert release];
        }

    }
    //Floor not bought. Send an alert to the player with suggestions on what they can do to be able to buy a new floor
    else if (result == NO) {
        NSLog(@"NO");
        //Unable to buy floor
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unable to add new floor!" message:@"Drag seedling to farm plot to earn more coins or to any furniture to increase its happiness. You can also buy new floor using leaves." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        alert.tag=1;
        [alert show];
        [alert release];
    }
    
    [newFloor release];
}
    //Another floor is currently growing
else {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Floor Currently Growing!" message:@"A new floor is currently growing. You cannot buy another floor until that floor is fully grown." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    alert.tag=3;
    [alert show];
    [alert release];
}
    
}

//Handles alert Views based on the tag on the alert
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
    else if(alertView.tag==3) {
        if (buttonIndex == 0) {
            
        }
        else {
            
        }
    }
}

//This method adds the farm plot as a subView of the main citadel view. The famr plot is fixed in one position in the citadel and does not allow the player to interact with it through touches.
-(void)displayFarm
{
    NSData *myFarm = [appDelegate.citadelData objectForKey:@"plot"];
    NSDictionary *mydic = [[NSDictionary alloc]initWithDictionary:[NSKeyedUnarchiver unarchiveObjectWithData:myFarm]];
    UIImage *farmImage = [[mydic objectForKey:@"1"]furnPic];
    myFarmView = [[ViewFurniture alloc]initWithImage:farmImage];
    myFarmView.center = CGPointMake([[mydic objectForKey:@"1"] xPos],[[mydic objectForKey:@"1"] yPos]);
    [self.myFarmView setUserInteractionEnabled:NO];
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
        if (![[[myfurniture objectAtIndex:k]itemName] isEqualToString:@"Plot"]) {
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
            panRecognizerF.cancelsTouchesInView = NO;
           // panRecognizerF.delegate = self;
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
    
    [self.citadelView addSubview:addFloor]; //Adding the UIButton as a subview of the citadelView ensures that it is not covered by the scrollView since the button was created in the Nib file. If it is not added, it will be unresponsive to touches. 
    
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
            floorOne = YES; floorTwo=floorThree=floorFour=floorFive=floorSix=floorSeven=floorEight=floorNine=floorTen = NO;
        }
        if (recognizer.view.center.y > 110 && recognizer.view.center.y < 240) {
            floorTwo = YES; floorOne=floorThree=floorFour=floorFive=floorSix=floorSeven=floorEight=floorNine=floorTen = NO;
        }
        if (recognizer.view.center.y > 240 && recognizer.view.center.y < 370) {
            floorThree = YES; floorOne=floorFour=floorTwo=floorFive=floorSix=floorSeven=floorEight=floorNine=floorTen = NO;
        }
        if (recognizer.view.center.y > 370 && recognizer.view.center.y < 500) {
            floorFour = YES; floorOne=floorTwo=floorThree=floorFive=floorSix=floorSeven=floorEight=floorNine=floorTen = NO;
        }
        if (recognizer.view.center.y > 500 && recognizer.view.center.y < 630) {
            floorFive = YES; floorOne=floorTwo=floorThree=floorFour=floorSix=floorSeven=floorEight=floorNine=floorTen = NO;
        }
        if (recognizer.view.center.y > 630 && recognizer.view.center.y < 760) {
            floorSix = YES; floorOne=floorTwo=floorThree=floorFour=floorFive=floorSix=floorSeven=floorEight=floorNine=floorTen = NO;
        }
        if (recognizer.view.center.y > 760 && recognizer.view.center.y < 890) {
            floorSeven = YES; floorOne=floorTwo=floorThree=floorFour=floorFive=floorSix=floorSeven=floorEight=floorNine=floorTen = NO;
        }
        if (recognizer.view.center.y > 890 && recognizer.view.center.y < 1020) {
            floorEight = YES; floorOne=floorTwo=floorThree=floorFour=floorFive=floorSix=floorSeven=floorEight=floorNine=floorTen = NO;
        }
        if (recognizer.view.center.y > 1020 && recognizer.view.center.y < 1150) {
            floorNine = YES; floorOne=floorTwo=floorThree=floorFour=floorFive=floorSix=floorSeven=floorEight=floorNine=floorTen = NO;
        }
        if (recognizer.view.center.y > 1150 && recognizer.view.center.y < 1280) {
            floorTen = YES; floorOne=floorTwo=floorThree=floorFour=floorFive=floorSix=floorSeven=floorEight=floorNine=floorTen = NO;
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
        //doubleTapGestureRecognizer.delegate = self;
        doubleTapGestureRecognizer.numberOfTapsRequired = 2;
        doubleTapGestureRecognizer.cancelsTouchesInView = NO; //Allow other touches to be detected and delivered to their respective views e.g. on UIButtons
        [mySeedlingView addGestureRecognizer:doubleTapGestureRecognizer];
        [doubleTapGestureRecognizer release];
        
        //add Pan Recognizer to UIImageView
        panRecognizer = [[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)] autorelease];
        [panRecognizer setMinimumNumberOfTouches:1];
        [panRecognizer setMaximumNumberOfTouches:1];
        //[panRecognizer setDelegate:self];
        panRecognizer.cancelsTouchesInView = NO;
        [self.mySeedlingView addGestureRecognizer:panRecognizer];
        
        //Determine the initial floor of the seedling if there are more than one floor in the citadel
        [self seedlingInitialFloor];
        
        [self.scrollView setSubViewRect:self.mySeedlingView.frame];
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

//Determine the initial floor where the seedling is located when the game is started so that movement of the seedling can be restricted to that floor alone. Once it is touched and moved around, the restriction floor is determined by the method handlePan.

-(void)seedlingInitialFloor
{
    if ([appDelegate.citadelData integerForKey:@"floors"] == 2) {
        if ([[myseedlings objectAtIndex:mySeedlingView.tag]seedlingPosition].y > 200) {
            floorTwo = YES; floorOne = NO;
        }
        else {
            floorOne = YES; floorTwo = NO;
        }
    }
    if ([appDelegate.citadelData integerForKey:@"floors"] > 2) {
        if ([[myseedlings objectAtIndex:mySeedlingView.tag]seedlingPosition].y > 0 && [[myseedlings objectAtIndex:mySeedlingView.tag]seedlingPosition].y < 110) {
            floorOne = YES; floorTwo=floorThree=floorFour=floorFive=floorSix=floorSeven=floorEight=floorNine=floorTen = NO;
        }
        if ([[myseedlings objectAtIndex:mySeedlingView.tag]seedlingPosition].y > 110 && [[myseedlings objectAtIndex:mySeedlingView.tag]seedlingPosition].y < 240) {
            floorTwo = YES; floorOne=floorThree=floorFour=floorFive=floorSix=floorSeven=floorEight=floorNine=floorTen = NO;
        }
        if ([[myseedlings objectAtIndex:mySeedlingView.tag]seedlingPosition].y > 240 && [[myseedlings objectAtIndex:mySeedlingView.tag]seedlingPosition].y < 370) {
            floorThree = YES; floorTwo=floorOne=floorFour=floorFive=floorSix=floorSeven=floorEight=floorNine=floorTen = NO;
        }
        if ([[myseedlings objectAtIndex:mySeedlingView.tag]seedlingPosition].y > 370 && [[myseedlings objectAtIndex:mySeedlingView.tag]seedlingPosition].y < 500) {
            floorFour = YES; floorTwo=floorThree=floorOne=floorFive=floorSix=floorSeven=floorEight=floorNine=floorTen = NO;
        }
        if ([[myseedlings objectAtIndex:mySeedlingView.tag]seedlingPosition].y > 500 && [[myseedlings objectAtIndex:mySeedlingView.tag]seedlingPosition].y < 630) {
            floorFive = YES; floorTwo=floorThree=floorFour=floorOne=floorSix=floorSeven=floorEight=floorNine=floorTen = NO;
        }
        if ([[myseedlings objectAtIndex:mySeedlingView.tag]seedlingPosition].y > 630 && [[myseedlings objectAtIndex:mySeedlingView.tag]seedlingPosition].y < 760) {
            floorSix = YES; floorTwo=floorThree=floorFour=floorFive=floorOne=floorSeven=floorEight=floorNine=floorTen = NO;
        }
        if ([[myseedlings objectAtIndex:mySeedlingView.tag]seedlingPosition].y > 760 && [[myseedlings objectAtIndex:mySeedlingView.tag]seedlingPosition].y < 890) {
            floorSeven = YES; floorTwo=floorThree=floorFour=floorFive=floorSix=floorOne=floorEight=floorNine=floorTen = NO;
        }
        if ([[myseedlings objectAtIndex:mySeedlingView.tag]seedlingPosition].y > 890 && [[myseedlings objectAtIndex:mySeedlingView.tag]seedlingPosition].y < 1020) {
            floorEight = YES; floorTwo=floorThree=floorFour=floorFive=floorSix=floorSeven=floorOne=floorNine=floorTen = NO;
        }
        if ([[myseedlings objectAtIndex:mySeedlingView.tag]seedlingPosition].y > 1020 && [[myseedlings objectAtIndex:mySeedlingView.tag]seedlingPosition].y < 1150) {
            floorNine = YES; floorTwo=floorThree=floorFour=floorFive=floorSix=floorSeven=floorEight=floorOne=floorTen = NO;
        }
        if ([[myseedlings objectAtIndex:mySeedlingView.tag]seedlingPosition].y > 1150 && [[myseedlings objectAtIndex:mySeedlingView.tag]seedlingPosition].y < 1280) {
            floorTen = YES; floorTwo=floorThree=floorFour=floorFive=floorSix=floorSeven=floorEight=floorNine=floorOne = NO;
        }

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
            if (mySeedlingView.center.y > 400 || mySeedlingView.center.y < 250) {
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
        if (mySeedlingView.center.y > 220 || mySeedlingView.center.y < 155) {
            pos.y = -pos.y;
        }
    }
    //floor 3
    if (floorThree) {
        if (mySeedlingView.center.y > 350 || mySeedlingView.center.y < 285) {
            pos.y = -pos.y;
        }
    }
    //floor 4
    if (floorFour) {
        if (mySeedlingView.center.y > 480 || mySeedlingView.center.y < 415) {
            pos.y = -pos.y;
        }
    }
    //floor 5
    if (floorFive) {
        if (mySeedlingView.center.y > 610 || mySeedlingView.center.y < 545) {
            pos.y = -pos.y;
        }
    }
    //floor 6
    if (floorSix) {
        if (mySeedlingView.center.y > 740 || mySeedlingView.center.y < 675) {
            pos.y = -pos.y;
        }
    }
    //floor 7
    if (floorSeven) {
        if (mySeedlingView.center.y > 870 || mySeedlingView.center.y < 805) {
            pos.y = -pos.y;
        }
    }
    //floor 8
    if (floorEight) {
        if (mySeedlingView.center.y > 1000 || mySeedlingView.center.y < 935) {
            pos.y = -pos.y;
        }
    }
    //floor 9
    if (floorNine) {
        if (mySeedlingView.center.y > 1130 || mySeedlingView.center.y < 1065) {
            pos.y = -pos.y;
        }
    }
    //floor 10
    if (floorTen) {
        if (mySeedlingView.center.y > 1260 || mySeedlingView.center.y < 1195) {
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