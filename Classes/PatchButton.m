//
//  PatchButton.m
//  Microlending
//
//  Created by guest user on 11/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PatchButton.h"

@implementation PatchButton

@synthesize button_link_location;
@synthesize myBadge;
@synthesize myTransaction;

-(id)init {
	self = [super init];
	
	return self;
	
}

- (void) setBadge:(Badge *)badge {
    
        myBadge = badge;
        button_link_location = @"badge";
    
}

- (void) setTransaction:(Transaction *)transaction {
	
		myTransaction = transaction;
        [self setButton_link_location:@"transaction"];
    
}

-(void) set_button_link_location:(NSString*) location {
    button_link_location = location;
}

-(NSString*) get_button_link_location {
    return button_link_location;
}

-(Badge*) getBadge {
    return myBadge;
}

-(Transaction*) getTransaction {
    return myTransaction;
}

@end
