//
//  SeedlingView.m
//  Microlending
//
//  Created by guest user on 10/6/12.
//
//

#import "SeedlingView.h"

@implementation SeedlingView

@synthesize animationImages;

- (id)initWithImage:(UIImage *)image
{
    self = [super initWithImage:image];
    if (self) {
        // Initialization code
      //  [self moveAround:image];
    }
    return self;
}

-(void)moveAround:(UIImage *)image {
  //  [animationImages initWithObjects:image, nil ];
 //   [self startAnimating];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", @"touchesBegan! SeedlingView");
}

- (void) dragging: (UIPanGestureRecognizer *) p {
    UIView * vv = p.view;
    if (p.state == UIGestureRecognizerStateBegan ||
        p.state == UIGestureRecognizerStateChanged) {
        CGPoint delta = [p translationInView: vv.superview];
        CGPoint c = vv.center;
        c.x += delta.x; c.y += delta.y;
        vv.center = c;
        [p setTranslation: CGPointZero inView: vv.superview];
    }
}

@end
