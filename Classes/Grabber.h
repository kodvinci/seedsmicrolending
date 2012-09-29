//
//  Grabber.h
//  Microlending
//
//  Created by Leonard Ngeno on 06/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

/* in order to use this class, you must create a new Grabber object with a table name, 
 api call and an argument that you'd like to include. Then, you have to implement the didGetData
 method in whatever class you're using the grabber. This method will get automatically once data
 has been retrieved.
 */

#import <Foundation/Foundation.h>

@protocol GrabberDelegate <NSObject>

-(void)didGetData:(NSArray *)recievedData withType:(NSString *)thisType;

@end

@interface Grabber : NSObject {
	
	NSArray *results;
	NSString *currentTableName;
	NSString *currentAPIName;
	NSString *currentArgument;
	NSString *currentType;
	NSData *receivedData;
	id grabberDelegate;

}

@property (nonatomic, retain) NSArray *results;
@property (nonatomic, retain) NSString *currentTableName;
@property (nonatomic, retain) NSString *currentAPIName;
@property (nonatomic, retain) NSString *currentArgument;
@property (nonatomic, retain) NSString *currentType;
@property (nonatomic, retain) NSData *receivedData;
@property (nonatomic, assign) id<GrabberDelegate> grabberDelegate;

- (id)initWithParams:(NSString *)tableName apiName:(NSString *)thisApiName 
           argument:(NSString *)thisArgument apiCall:(NSString *)thisAPICall
			typeOfGrabber:(NSString *)thisType;
- (NSArray *)getResultArray;

@end
