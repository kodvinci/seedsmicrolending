//
//  FloorTest.m
//  Microlending
//
//  Created by guest user on 10/2/12.
//
//

#import "SingleFloor.h"

@class FloorViewController;
@class MicrolendingAppDelegate;

@implementation SingleFloor

- (id)initWithFrame:(CGRect)frame
{
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSLog(@"%@", @"at the UIView!");
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"%@", @"drawRect!");
  /*  CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGRect rectangle = CGRectMake(0,0,320,460);
    CGContextAddRect(context, rectangle);
   // CGContextAddEllipseInRect(context, rectangle);
    CGContextStrokePath(context);
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    //CGContextAddEllipseInRect(context, rectangle);
    CGContextFillRect(context, rectangle); */
    
    NSInteger numFloors = [appDelegate.citadelData integerForKey:@"floors"];
    NSInteger height = 0;
    
    for (int f=0; f<numFloors; f++) {
        if (f == 0) {
            floor2 = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height / numFloors);
          
            [[UIColor blueColor] set]; // blue color
            UIRectFill(floor2);
            height = rect.size.height / numFloors;
        }
        
        if (f == 1) {
            floor1 = CGRectMake(rect.origin.x, rect.origin.y + height, rect.size.width, rect.size.height / numFloors);
            
            [[UIColor redColor] set]; // blue color
            UIRectFill(floor1);
            height += rect.size.height / numFloors;
        }
/*
        if (f>0) {
            CGRect myRect = CGRectMake(rect.origin.x, rect.origin.y + height, rect.size.width, rect.size.height / numFloors);
            if (f % 2) {
                [[UIColor redColor] set]; // red color
                UIRectFill(myRect);
            }
            else{
                [[UIColor blueColor] set]; // blue color
                UIRectFill(myRect);
            }
            height += (rect.size.height / numFloors) + 5;
        } */
    }
    
    // First, create a new rect with the upper half of the view
	//CGRect upperRect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height / 2);
	// Very similar to creating the upperRect, however for the lower portion of the view
	//CGRect lowerRect = CGRectMake(rect.origin.x, rect.origin.y + (rect.size.width / 2), rect.size.width, rect.size.height / 2);
	
	//[[UIColor redColor] set]; // red team color
	//UIRectFill(upperRect); // this will fill the upper rect all red,
    // if you'd like, try these lines to get a nice effect
    // [[UIColor whiteColor] set];
    // UIRectFrame(upperRect); // This will frame the rect with a one point line I believe
	//[[UIColor blueColor] set]; // blue team color
	//UIRectFill(lowerRect); // and of course, fill our lower rect with blue
    
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", @"touched floor! SingleFloor");
    [self resizeRect:floor1];
    
    //UITouch *myTouch = [[event allTouches]anyObject];
    //mySeedling.center = [myTouch locationInView:self.view];
    
}

- (void)resizeRect:(CGRect)rect
{
    NSLog(@"%@", @"resizeRect!");
    CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
//    [[UIColor greenColor] set];
//	UIRectFill(rect);
}
    
@end
