//
//  Grabber.m
//  Microlending
//
//  Created by Leonard Ngeno on 06/12/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

/* in order to use this class, you must create a new Grabber object with a table name, 
 api call and an argument that you'd like to include. Then, you have to implement the didGetData
 method in whatever class you're using the grabber. This method will get automatically once data
 has been retrieved.
 */


#import "Grabber.h"
#import "SBJson.h"
#import "SBJsonParser.h"


@implementation Grabber

@synthesize results;
@synthesize currentTableName;
@synthesize currentAPIName;
@synthesize currentArgument;
@synthesize grabberDelegate;
@synthesize currentType;
@synthesize receivedData;

- (id)initWithParams:(NSString *)tableName apiName:(NSString *)thisApiName 
			argument:(NSString *)thisArgument apiCall:(NSString *)thisAPICall
	   typeOfGrabber:(NSString *)thisType {
	
	if (self = [super init]) {
		
	
		self.currentTableName = tableName;
		self.currentAPIName = thisApiName;
		self.currentArgument = thisArgument;
		self.currentType = thisType;
				
		NSString *urlFormat;

		
		if ([thisApiName isEqualToString:@"byUid"]) {
			 urlFormat = [[NSString alloc] initWithFormat:@"http://warm-spring-9741.herokuapp.com/%@/%@.json?uid=%@",
								   currentTableName,currentAPIName,currentArgument];
			
			NSLog(@"%@",urlFormat);
			
		}
		
		if ([thisApiName isEqualToString:@"getBorrowersByUid"]) {
			urlFormat = [[NSString alloc] initWithFormat:@"http://warm-spring-9741.herokuapp.com/%@/%@.json?uid=%@",
						 currentTableName,currentAPIName,currentArgument];
			
			NSLog(@"%@",urlFormat);
		}
		
		if ([thisApiName isEqualToString:@"byId"]) {
			urlFormat = [[NSString alloc] initWithFormat:@"http://warm-spring-9741.herokuapp.com/%@/%@.json?story_id=%@",
						 currentTableName,currentAPIName,currentArgument];
			
			NSLog(@"%@",urlFormat);
			
		}
			
		if ([thisApiName isEqualToString:@"byCategory"]) {
			urlFormat = [[NSString alloc] initWithFormat:@"http://warm-spring-9741.herokuapp.com/%@/%@.json?category=%@",
								   currentTableName,currentAPIName,currentArgument];
			
		}
        
        if ([thisApiName isEqualToString:@"byBid"]) {
			urlFormat = [[NSString alloc] initWithFormat:@"http://warm-spring-9741.herokuapp.com/%@/%@.json?bid=%@",
						 currentTableName,currentAPIName,currentArgument];
			NSLog(@"%@",urlFormat);
            
		}
		
		if ([thisApiName isEqualToString:@""]) {
			urlFormat = [[NSString alloc] initWithFormat:@"http://warm-spring-9741.herokuapp.com/%@.json",
						 currentTableName];
			NSLog(@"%@",urlFormat);

		}
		
		
		NSURL *jsonurl = [NSURL URLWithString:urlFormat];
		[urlFormat release];
		
		NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: jsonurl];
		[request setHTTPMethod:thisAPICall];
		NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
		
		if (connection) {
			
			// Create the NSMutableData to hold the received data.
			
			// receivedData is an instance variable declared elsewhere.
			
			receivedData = [[NSMutableData data] retain];
			
		} else {
			NSLog (@"%@", @"No connection made!");
			// Inform the user that the connection failed.
			
		}
		
		[connection release];
		[request release];
	
	}
	
	return self;
	
}

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
	
	[self.grabberDelegate didGetData:results withType:currentType];
	
}


- (NSArray *)getResultArray {
	
	return results;
	
}

@end
