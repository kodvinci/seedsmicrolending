//
//  ViewFurniture.m
//  Microlending
//
//  Created by Leonard Ng'eno on 10/17/12.
//
//

#import "ViewFurniture.h"

@class Pool;

@implementation ViewFurniture

@synthesize name;

- (id)initWithImage:(UIImage *)image
{
    NSLog(@"ViewFurniture: %@", @"initWithImage...");

    self = [super initWithImage:image];
    if (self) {
        // Initialization code
        NSLog(@"ViewFurniture: %@", @"self is true!");
    }
    return self;
}


@end
