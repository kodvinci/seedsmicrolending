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

-(UIImage *)getImage {
	
	return [UIImage imageNamed:@"badge.png"]; 	
	
}




@end
