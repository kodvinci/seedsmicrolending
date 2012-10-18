//
//  ViewFurniture.m
//  Microlending
//
//  Created by guest user on 10/17/12.
//
//

#import "ViewFurniture.h"

@class Pool;

@implementation ViewFurniture

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImage *myPic = [UIImage imageNamed:@"pool.png"];
//        Pool *myPool = [[Pool alloc] initWithLevel:1 image:myPic];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
