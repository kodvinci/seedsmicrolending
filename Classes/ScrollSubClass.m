//
//  ScrollSubClass.m
//  Microlending
//
//  Created by guest user on 11/29/12.
//
//

#import "ScrollSubClass.h"

@implementation ScrollSubClass

@synthesize subViewRect;

- (id)initWithFrame:(CGRect)frame
{
    return [super initWithFrame:frame];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.nextResponder touchesBegan:touches withEvent:event];
    
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // if youre not dragging, sends the touch to the next responder, into the touchedEnded method.
    if (!self.dragging){
        
        [self.nextResponder touchesEnded:touches withEvent:event];
    }
    else
        [super touchesEnded:touches withEvent:event];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (!self.dragging) {
        [self.nextResponder touchesMoved:touches withEvent:event];
    }
    else {
        [super touchesMoved:touches withEvent:event];
       // [super touchesEnded:touches withEvent:event];
    } 
   // [[self nextResponder] touchesMoved:touches withEvent:event];
}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView* result = [super hitTest:point withEvent:event];
    
    if (CGRectContainsPoint([self subViewRect], point)) {
        [self setScrollEnabled:NO];
    } else {
        [self setScrollEnabled:YES];
    }
    
    return result;
}

@end
