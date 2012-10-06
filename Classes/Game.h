//
//  Game.h
//  Microlending
//
//  Created by guest user on 9/29/12.
//
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Game : NSObject {
   CLLocationManager *location;
}

@property(nonatomic, retain) NSString *location;

//-(NSString *)findLocation;

@end
