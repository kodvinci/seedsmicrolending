//
//  LoginGrabber.h
//  Microlending
//
//  Created by Leonard Ngeno on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LoginGrabberDelegate <NSObject>

-(void)didGetUser:(NSArray *)recievedData withType:(NSString *)thisType;


@end


@interface LoginGrabber : NSObject {
	
	NSArray *results;
	NSString *currentTableName;
	NSString *currentAPIName;
	NSString *currentArgument1;
    NSString *currentArgument2;
	NSString *currentType;
	NSData *receivedData;
	id logingrabberDelegate;
        
}

@property (nonatomic, retain) NSArray *results;
@property (nonatomic, retain) NSString *currentTableName;
@property (nonatomic, retain) NSString *currentAPIName;
@property (nonatomic, retain) NSString *currentArgument1;
@property (nonatomic, retain) NSString *currentArgument2;
@property (nonatomic, retain) NSString *currentType;
@property (nonatomic, retain) NSData *receivedData;
@property (nonatomic, assign) id<LoginGrabberDelegate> logingrabberDelegate;

- (id)initWithParams:(NSString *)tableName apiName:(NSString *)thisApiName 
            argument1:(NSString *)thisArgument1 argument2:(NSString *)thisArgument2 apiCall:(NSString *)thisAPICall
       typeOfGrabber:(NSString *)thisType;
- (NSArray *)getResultArray;



@end
