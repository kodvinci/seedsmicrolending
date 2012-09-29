//
//  Badge.m
//  Microlending
//
//  Created by Cody Kolodziejzyk on 11/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Badge.h"


@implementation Badge

@synthesize badgeTitle, description, badgeID;

-(id)initWithParams:(NSString *)thisTitle badgeDescription:(NSString *)thisDescription badgeID:(NSString *)thisID {
	
	if (self = [super init]) {
		
        self.badgeTitle = thisTitle;
		self.description = thisDescription;
		self.badgeID = thisID;
		
    }
	
    return self;
	
	
}

-(NSString *)getBadgeTitle {
	
	return self.badgeTitle;	
}

-(NSString *)getBadgeDescription {
	
	return self.description;
	
}

-(NSString *)getBadgeBID {
	
	return self.badgeID;
}

-(UIImage *)getBadgeImage {
    NSString *myBID = self.getBadgeBID;
	if ([myBID isEqualToString:@"1"]) {
        return [UIImage imageNamed:@"green.png"]; 
    }
	if ([myBID isEqualToString:@"2"]) {
        return [UIImage imageNamed:@"red.png"];
    }
    if ([myBID isEqualToString:@"3"]) {
        return [UIImage imageNamed:@"yellow.png"];
    }
    if ([myBID isEqualToString:@"4"]) {
        return [UIImage imageNamed:@"orange.png"];
    }
    if ([myBID isEqualToString:@"5"]) {
        return [UIImage imageNamed:@"master.png"];
    }
    else {
        return [UIImage imageNamed:@"badge.png"];
    }
}




@end
