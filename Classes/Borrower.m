//
//  Borrower.m
//  Microlending
//
//  Created by Leonard Ng'eno on 10/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Borrower.h"

@implementation Borrower

@synthesize name, category, business_description, loans_received;

-(id)initWithUserName:(NSString *)userName {
	
	if (self = [super init]) {
		
        self.name = userName;
		
    }
	
    return self;
	
}

-(UIImage *)getImage {
	
	return [UIImage imageNamed:@"borrower.png"]; 	

}


@end

