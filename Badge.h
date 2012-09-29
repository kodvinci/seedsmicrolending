//
//  Badge.h
//  Microlending
//
//  Created by Cody Kolodziejzyk on 11/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Badge : NSObject {
	
	NSString *badgeTitle;
	NSString *description;
	NSString *badgeID;

}

@property (nonatomic, retain) NSString *badgeTitle;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *badgeID;

-(id)initWithParams:(NSString *)thisTitle badgeDescription:(NSString *)thisDescription badgeID:(NSString *)thisID;
-(NSString *)getBadgeTitle;
-(NSString *)getBadgeDescription;
-(NSString *)getBadgeBID;
-(UIImage *)getBadgeImage;


@end
