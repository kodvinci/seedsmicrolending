//
//  Logout.h
//  Microlending
//
//  Created by Leonard Ngeno on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LogoutDelegate <NSObject>

-(void)tokenAck:(NSData *)recievedData;

@end

@interface Logout : NSObject {
    id logDelegate;
    NSData *results;
	NSString *currentTableName;
	NSString *currentAPIName;
	NSString *currentArgument;
	NSData *receivedData;
}

@property (nonatomic, retain) NSData *results;
@property (nonatomic, retain) NSString *currentTableName;
@property (nonatomic, retain) NSString *currentAPIName;
@property (nonatomic, retain) NSString *currentArgument;
@property (nonatomic, retain) NSData *receivedData;
@property (nonatomic, assign) id<LogoutDelegate> logDelegate;

- (id)initWithParams:(NSString *)tableName apiName:(NSString *)thisApiName tokenToBeDeleted:(NSString *)thisToken apiCall:(NSString *)thisAPICall;

- (NSData *)getResultArray;

@end
