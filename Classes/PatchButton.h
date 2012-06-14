//
//  PatchButton.h
//  Microlending
//
//  Created by guest user on 11/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Badge.h"
#import "Transaction.h"

@class Badge;
@class Transaction;


@interface PatchButton : UIButton {

    Badge* myBadge;
    Transaction* myTransaction;
    NSString* button_link_location;

}

@property (nonatomic, retain) NSString* button_link_location;
@property (nonatomic, retain) Badge* myBadge;
@property (nonatomic, retain) Transaction* myTransaction;


- (void) setBadge: (Badge*) badge;
- (void) setTransaction: (Transaction*) transaction; 
- (void) set_button_link_location:(NSString*) location;
- (NSString*) get_button_link_location;
- (Badge*) getBadge;
- (Transaction*) getTransaction;

@end
