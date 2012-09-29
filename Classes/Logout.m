//
//  Logout.m
//  Microlending
//
//  Created by Leonard Ngeno on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Logout.h"
#import "Lender.h"
#import "LoginViewController.h"
#import "SBJsonParser.h"
#import "SBJson.h"
#import "MicrolendingAppDelegate.h"

@class Lender;
@class LoginViewController;
@class SBJsonParser;
@class MicrolendingAppDelegate;

@implementation Logout

@synthesize logDelegate;
@synthesize results;
@synthesize currentTableName;
@synthesize currentAPIName;
@synthesize currentArgument;
@synthesize receivedData;

- (id)initWithParams:(NSString *)tableName apiName:(NSString *)thisApiName tokenToBeDeleted:(NSString *)thisToken apiCall:(NSString *)thisAPICall {
    
    if (self = [super init]) {
        
		self.currentTableName = tableName;
		self.currentAPIName = thisApiName;
		self.currentArgument = thisToken;
        
        NSString *urlFormat;
        if ([tableName isEqualToString:@"users"]) {
            urlFormat = [[NSString alloc] initWithFormat:@"http://seedsmicroloans.herokuapp.com/%@/%@.json?authentication_token=%@",tableName,thisApiName,thisToken]; 
            
		}
        NSLog(@"%@",urlFormat);
        
        NSURL *jsonurl = [NSURL URLWithString:urlFormat];
        [urlFormat release];
        
     //   NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:jsonurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
        
     //   NSData *requestData = [NSData dataWithBytes:[thisToken UTF8String] length:[thisToken length]];
        
     //   [request setHTTPMethod:thisAPICall];
     //   [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
     //   [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
     //   [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
     //   [request setHTTPBody: requestData];
        
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: jsonurl];
        [request setHTTPMethod:thisAPICall];
        
        NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
       
        if (connection) { 
            NSLog (@"%@", @"connection made!");
            receivedData = [[NSMutableData data] retain];
        } else {
            NSLog (@"%@", @"No connection made!");
        } 
        [connection release]; 
        [request release];
    } 
    return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    [receivedData setLength:0];
    NSLog (@"%@", @"Set it to 0!");
    //TERRIBLE PLACEHOLDERS!
    MicrolendingAppDelegate *appDelegate;
	appDelegate = [[UIApplication sharedApplication] delegate];			
    LoginViewController *newLogin = [[LoginViewController alloc] init];
    [appDelegate.tabBarController presentModalViewController:newLogin animated:YES];
    [newLogin release];
} 

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    [receivedData appendData:data];
    NSLog (@"%@", @"Appended Data!");

	SBJsonParser *parser = [[SBJsonParser alloc] init];
	

	results = [parser objectWithData:receivedData];
	[parser release];
    
    NSLog(@"LogoutSender result has: %@",results);
    
    [self.logDelegate tokenAck:results];
    //    NSLog (@"%@", @"Results passed!");
    //	[results release];
	
}

- (NSData *)getResultArray {
	
	return results;
	
}
/*
-(void) dealloc{
    [results release];
    [currentAPIName release];
    [currentArgument release];
    [currentTableName release];
    [receivedData release];
    
    [super dealloc];
} */

@end
