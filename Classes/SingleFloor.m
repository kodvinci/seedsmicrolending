//
//  FloorTest.m
//  Microlending
//
//  Created by guest user on 10/2/12.
//
//
/*
#import "SingleFloor.h"

@class FloorViewController;
@class MicrolendingAppDelegate;
@class SeedlingView;
@class ViewFurniture;
@class Citadel;
@class Seedling;

@implementation SingleFloor

@synthesize seedling, mySeedling, myFun, furniture, myTime;

- (id)initWithFrame:(CGRect)frame
{
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSLog(@"SingleFloor: %@", @"at initWithFrame...");
    NSLog(@"Frame: %@", NSStringFromCGRect(frame));
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}*/

/*
-(void)needToRefreshView:(BOOL)result
{
    NSLog(@"%@", @"needToRefreshView!");
    if (result) {
 //need to redraw view
        NSLog(@"NumFloors: %@", [appDelegate.citadelData objectForKey:@"floors"]);
        [self setNeedsDisplay];
    }

}*/
/*
-(void)setupSeedling
{
    //(X speed, Y speed)
    pos = CGPointMake(0.1, 0.1);
    //convert png image to UIImage
    seedling = [UIImage imageNamed:@"seedling.png"];
    mySeedling = [[SeedlingView alloc] initWithImage:seedling];
    
    //TO_DO
    //Need to figure out the floor...then center the seedling within it and let the seedling move within its boundaries...
    if (numFloors == 1) {
        mySeedling.center = CGPointMake(160, 250);
    }
    if (numFloors == 2) {
        mySeedling.center = CGPointMake(160, 277.5);
    }
    if (numFloors == 3) {
        mySeedling.center = CGPointMake(160, 320);
    }
    
    //launch Seedling
    myTime = [NSTimer scheduledTimerWithTimeInterval:(0.03) target:self selector:@selector(moveSeedlingAround) userInfo:nil repeats:YES];
    
    [self addSubview:mySeedling];
    
}


-(void)moveSeedlingAround
{
//    NSLog(@"%@", @"in moveSeedlingAround!");
    int floorY = 370/numFloors;
    int Ypos = (floorY * numFloors) - floorY + 30;

    mySeedling.center = CGPointMake(mySeedling.center.x+pos.x, mySeedling.center.y+pos.y);
    if (mySeedling.center.x > 320 || mySeedling.center.x < 0) {
        pos.x = -pos.x;
    }
    if (mySeedling.center.y > (370) || mySeedling.center.y < Ypos) { 
        pos.y = -pos.y;
    }
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"SingleFloor: %@", @"drawRect!");
    
    numFloors = [appDelegate.citadelData integerForKey:@"floors"];
    height = rect.size.height;
    
    if (numFloors == 1) {
        NSLog(@"SingleFloor: %@", @"1 floor only!!");
        //set up floor
        CGRect floor = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
        [[UIColor blueColor] set]; // blue color
        UIRectFill(floor);
        height = rect.size.height;
        
        [self displayFurniture];
        [self setupSeedling];
    }
    
    else if(numFloors > 1) {
        NSLog(@"SingleFloor: %@", @"more than 1 floor!");
        height = rect.size.height/numFloors;
        NSInteger floorYorigin;
        
        for (int f=0; f<numFloors; f++) {
            if (f == 0) {
                floor1 = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height / numFloors);
          
                [[UIColor blueColor] set]; // blue color
                UIRectFill(floor1);
                floorYorigin = rect.size.height / numFloors;
                
                 [self setupSeedling];
                [self displayFurniture];

            }
        
            if (f == 1) {
                floor2 = CGRectMake(rect.origin.x, rect.origin.y + floorYorigin, rect.size.width, rect.size.height / numFloors);
            
                [[UIColor redColor] set]; // red color
                UIRectFill(floor2);
                floorYorigin += rect.size.height / numFloors;

                [self displayFurniture];
                [self setupSeedling];
            }
            if (f == 2) {
                floor3 = CGRectMake(rect.origin.x, rect.origin.y + floorYorigin, rect.size.width, rect.size.height / numFloors);
                
                [[UIColor yellowColor] set]; // yellow color
                UIRectFill(floor3);
                floorYorigin += rect.size.height / numFloors;
                
                [self displayFurniture];
                [self setupSeedling];
            }

        }
    }
    
}

-(void)displayFurniture
{
    NSData *myFurniture = [appDelegate.citadelData objectForKey:@"furniture"];
    NSMutableArray *myfurniture = [NSKeyedUnarchiver unarchiveObjectWithData:myFurniture];
    for (int k=0; k < myfurniture.count; k++) {
        NSLog(@"My Furniture: %@", [myfurniture objectAtIndex:k]);
        NSString *item = [[myfurniture objectAtIndex:k] itemName];
        NSLog(@"My furniture name: %@", item);
            //display level 1 furniture
        if ([[myfurniture objectAtIndex:k] itemLevel] == 1) {
          //  furniture = [[myfurniture objectAtIndex:k] furnPic];
            furniture = [UIImage imageNamed:@"pool.png"];
            myFun = [[ViewFurniture alloc] initWithImage:furniture];
            myFun.center = CGPointMake(50, 320); //figure out an efficient way of arranging furniture in the floor
            [self addSubview:myFun];
        }
    }
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", @"touched floor! SingleFloor");
//    [self resizeRect:floor1];
    
    //UITouch *myTouch = [[event allTouches]anyObject];
    //mySeedling.center = [myTouch locationInView:self.view];
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", @"touchesMoved! FloorViewController");
    UITouch *myTouch = [[event allTouches]anyObject];
    mySeedling.center = [myTouch locationInView:self];
    
}

- (void)resizeRect:(CGRect)rect
{
    NSLog(@"%@", @"resizeRect!");
    CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
//    [[UIColor greenColor] set];
//	UIRectFill(rect);
}
  
-(void)dealloc
{
    [super dealloc];
    [seedling release];
    [mySeedling release];
    [myTime release];
    [furniture release];
    [myFun release];
}

@end
*/