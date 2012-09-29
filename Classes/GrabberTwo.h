//
//  GrabberTwo.h
//  Microlending
//
//  Created by Leonard Ngeno on 6/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GrabberTwoDelegate <NSObject>

-(void)didGetUID:(NSArray *)recievedData withType:(NSString *)thisType;

@end


@interface GrabberTwo : NSObject {
	
	NSArray *results;
	NSString *currentTableName;
	NSString *currentAPIName;
	NSString *currentArgument;
	NSString *currentType;
	NSData *receivedData;
	id grabbertwoDelegate;
    
}

@property (nonatomic, retain) NSArray *results;
@property (nonatomic, retain) NSString *currentTableName;
@property (nonatomic, retain) NSString *currentAPIName;
@property (nonatomic, retain) NSString *currentArgument;
@property (nonatomic, retain) NSString *currentType;
@property (nonatomic, retain) NSData *receivedData;
@property (nonatomic, assign) id<GrabberTwoDelegate> grabbertwoDelegate;

- (id)initWithParams:(NSString *)tableName apiName:(NSString *)thisApiName 
            argument:(NSString *)thisArgument apiCall:(NSString *)thisAPICall
       typeOfGrabber:(NSString *)thisType;
- (NSArray *)getResultArray;

@end
