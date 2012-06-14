//
//  CustomNavBar.m
//  Microlending
//
//  Created by Leonard Ngeno on 06/11/12
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomNavBar.h"


@implementation CustomNavBar

- (void)drawRect:(CGRect)rect {
	UIImage *image = [UIImage imageNamed:@"topbar.png"];
	[image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

@end
