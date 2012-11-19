//
//  Namegenerator.h
//  Microlending
//
//  Created by Benjamin Mozenter on 11/4/12.
//
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <stdlib.h>

@interface NameGenerator : NSObject
{
  NSMutableArray *nameParts;
}

@property(nonatomic, assign) NSMutableArray *nameParts;

-(NSString *) generateName;
-(id) init;
-(NSString *) capitalize: (NSString *)string;

@end
