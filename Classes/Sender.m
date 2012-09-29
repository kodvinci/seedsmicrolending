//
//  Sender.m
//  Microlending
//
//  Created by Cody Kolodziejzyk on 11/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Sender.h"
#import "Lender.h"
#import "MicrolendingAppDelegate.h"

@class MicrolendingAppDelegate;
@class Lender;

@implementation Sender

- (id)initWithParams:(NSString *)tableName jsonString:(NSString *)thisJsonString
			idToBeChanged:(NSString *)thisID apiCall:(NSString *)thisAPICall {
	
	if (self = [super init]) {
 /*       MicrolendingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate]; //ADDITION

        NSString *theID;
        theID = appDelegate.currentLender.realid; //ADDITION
      //  thisID = theID; */
        
		NSString *urlFormat;
		
		if ([tableName isEqualToString:@"badge_lists"] || [tableName isEqualToString:@"transactions"]) {
			 urlFormat = [[NSString alloc] initWithFormat:@"http://seedsmicroloans.herokuapp.com/%@/",tableName]; 

		} if ([tableName isEqualToString:@"paypaltransactions"]) {
            NSLog (@"%@", @"SECOND url format!");
            urlFormat = [[NSString alloc] initWithFormat:@"http://seedsmicroloans.herokuapp.com/%@/%@.json",tableName,thisJsonString,thisID,thisAPICall];
        } else if ([tableName isEqualToString:@"lenders"]) {
            NSLog (@"%@", @"THIRD url format!");
            urlFormat = [[NSString alloc] initWithFormat:@"http://seedsmicroloans.herokuapp.com/%@/%@.json",tableName,thisID]; 
        } 
        
        NSLog(@"%@",urlFormat);
	
	NSURL *jsonurl = [NSURL URLWithString:urlFormat];
	[urlFormat release];
	
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:jsonurl
														   cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];	//prepare http body
	
	
	NSData *requestData = [NSData dataWithBytes:[thisJsonString UTF8String] length:[thisJsonString length]];
	
	[request setHTTPMethod:thisAPICall];
	[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
	[request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
	[request setHTTPBody: requestData];
	
	NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
	[connection release];
		
		}
	
	return self;
	
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data

{
	
	NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//	NSLog(@"%@",result);
    NSLog(@"Sender result has: %@",result);
	[result release];
	
}



	
	
	

@end
