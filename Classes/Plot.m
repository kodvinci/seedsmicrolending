//
//  Plot.m
//  Microlending
//
//  Created by Leonard Ng'eno on 11/13/12.
//
//

#import "Plot.h"

@implementation Plot

-(void)initWithLevel:(NSInteger)furnitureLevel
{
    self.furnPic = [UIImage imageNamed:@"plot"];
    self.itemName = @"Plot";
    self.xPos = 40;
    self.yPos = 330;
}


@end
