//
//  RecordTransactions.h
//  Microlending
//
//  Created by Leonard Ngeno on 7/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecordTransactions : NSObject {

NSData *receivedData;
NSArray *results;
 
}

@property (nonatomic, retain) NSData *receivedData;
@property (nonatomic, retain) NSArray *results;

- (id)initWithParams:(NSString *)tableName apiName:(NSString *)thisApiName jsonString:(NSString *)thisJsonString apiCall:(NSString *)thisAPICall;


@end
