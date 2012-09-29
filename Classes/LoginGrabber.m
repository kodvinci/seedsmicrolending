//
//  LoginGrabber.m
//  Microlending
//
//  Created by Leonard Ngeno on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginGrabber.h"
#import "SBJson.h"
#import "SBJsonParser.h"

@implementation LoginGrabber

@synthesize results;
@synthesize currentTableName;
@synthesize currentAPIName;
@synthesize currentArgument1;
@synthesize currentArgument2;
@synthesize logingrabberDelegate;
@synthesize currentType;
@synthesize receivedData;

- (id)initWithParams:(NSString *)tableName apiName:(NSString *)thisApiName 
           argument1:(NSString *)thisArgument1 argument2:(NSString *)thisArgument2 apiCall:(NSString *)thisAPICall
       typeOfGrabber:(NSString *)thisType {
    if (self = [super init]) {
		
        
		self.currentTableName = tableName;
		self.currentAPIName = thisApiName;
		self.currentArgument1 = thisArgument1;
        self.currentArgument2 = thisArgument2;
		self.currentType = thisType;
        
		NSString *urlFormat;
        
		
		if ([thisApiName isEqualToString:@"login"]) {
            urlFormat = [[NSString alloc] initWithFormat:@"http://seedsmicroloans.herokuapp.com/%@/%@.json?email=%@&password=%@",
                         currentTableName,currentAPIName,currentArgument1,currentArgument2];
			
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
	
    NSLog (@"The content is%@",results);
	
	[self.logingrabberDelegate didGetUser:results withType:currentType];
	
}


- (NSArray *)getResultArray {
	
	return results;
	
}


@end
