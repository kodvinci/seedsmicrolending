//
//  FloorTest.m
//  Microlending
//
//  Created by guest user on 10/2/12.
//
//

#import "SingleFloor.h"

@implementation SingleFloor

- (id)initWithFrame:(CGRect)frame
{
    NSLog(@"%@", @"at the UIView!");
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"%@", @"drawRect!");
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGRect rectangle = CGRectMake(0,0,320,460);
    CGContextAddRect(context, rectangle);
   // CGContextAddEllipseInRect(context, rectangle);
    CGContextStrokePath(context);
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    //CGContextAddEllipseInRect(context, rectangle);
    CGContextFillRect(context, rectangle);
}

@end
