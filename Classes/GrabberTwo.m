//
//  GrabberTwo.m
//  Microlending
//
//  Created by Leonard Ngeno on 6/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GrabberTwo.h"
#import "SBJson.h"
#import "SBJsonParser.h"


@implementation GrabberTwo

@synthesize results;
@synthesize currentTableName;
@synthesize currentAPIName;
@synthesize currentArgument;
@synthesize grabbertwoDelegate;
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
        
        if ([thisApiName isEqualToString:@"byAuthToken"]) {
            urlFormat = [[NSString alloc] initWithFormat:@"http://seedsmicroloans.herokuapp.com/%@/%@.json?authentication_token=%@",
                         currentTableName,currentAPIName,currentArgument];
			
			NSLog(@"%@",urlFormat);
            
		}
        
        NSURL *jsonurl = [NSURL URLWithString:urlFormat];
        [urlFormat release];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: jsonurl];
        [request setHTTPMethod:thisAPICall];
        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        if (connection) {
            NSLog (@"%@", @"Made connection!");   
            receivedData = [[NSMutableData data] retain];
            
        } else {
            NSLog (@"%@", @"connection NOT made!");
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
	
    [self.grabbertwoDelegate didGetUID:results withType:currentType];
    
}


- (NSArray *)getResultArray {
	
	return results;
	
}

@end
