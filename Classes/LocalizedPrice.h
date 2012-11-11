//
//  LocalizedPrice.h
//  Microlending
//
//  Created by guest user on 11/8/12.
//
//

#import <StoreKit/StoreKit.h>

@interface SKProduct (LocalizedPrice)

@property (nonatomic, readonly) NSString *localizedPrice;

@end
