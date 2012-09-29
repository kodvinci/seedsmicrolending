//
//  RecordTransactions.m
//  Microlending
//
//  Created by Leonard Ngeno on 7/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RecordTransactions.h"
#import "MicrolendingAppDelegate.h"
#import "Lender.h"
#import "SBJson.h"
#import "SBJsonParser.h"

@class Lender;
@class MicrolendingAppDelegate;

@implementation RecordTransactions

@synthesize receivedData;
@synthesize results;

- (id)initWithParams:(NSString *)tableName apiName:(NSString *)thisApiName jsonString:(NSString *)thisJsonString apiCall:(NSString *)thisAPICall; {
	
	if (self = [super init]) {

        
		NSString *urlFormat;
		
        if ([tableName isEqualToString:@"paypaltransactions"]) {
            NSLog (@"%@", @"Post it...!");
            urlFormat = [[NSString alloc] initWithFormat:@"http://seedsmicroloans.herokuapp.com/%@.json",tableName];
        }
        
        NSLog(@"%@",urlFormat);
        
        NSURL *jsonurl = [NSURL URLWithString:urlFormat];
        [urlFormat release];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:jsonurl
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];	//prepare http body
        
        
        NSData *requestData = [NSData dataWithBytes:[thisJsonString UTF8String] length:[thisJsonString length]];
    
        NSLog(@"%@",urlFormat);

        [request setHTTPMethod:thisAPICall];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody: requestData];
        NSLog (@"%@", @"Got here...!");

        NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
        NSLog (@"%@", @"Going to release connection...!");
        if (connection) { 
            NSLog (@"%@", @"connection made!");
            receivedData = [[NSMutableData data] retain];
        } else {
            NSLog (@"%@", @"No connection made!");
        }

        [connection release];
		
    }
	
	return self;
	
}
/*
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data

{
	
	NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
  //  NSLog(@"Sender result has: %@",result);
    NSLog (@"%@", @"Got to results...!");
	[result release];
	
} */

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response

{
	
    // This method is called when the server has determined that it
	
    // has enough information to create the NSURLResponse.
	
	
	
    // It can be called multiple times, for example in the case of a
	
    // redirect, so each time we reset the data.
	
	
	
    // receivedData is an instance variable declared elsewhere.
	
    [receivedData setLength:0];
    //  [receivedData length:0];
	
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data

{
	
    // Append the new data to receivedData.
	
    // receivedData is an instance variable declared elsewhere.
	
    [receivedData appendData:data];
	
	SBJsonParser *parser = [[SBJsonParser alloc] init];
	
	
	// Creates a list of NSDictionaries
	
	results = [parser objectWithData:receivedData];
	[parser release];
	
    // NSLog (@"The content is%@",results);
	
//	[self.grabberDelegate didGetData:results withType:currentType];
    
}

- (NSArray *)getResultArray {
	
	return results;
	
}

@end
