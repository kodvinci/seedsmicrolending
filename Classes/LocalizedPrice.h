//
//  LocalizedPrice.h
//  Microlending
//
//  Created by Leonard Ng'eno on 11/8/12.
//
//

#import <StoreKit/StoreKit.h>

@interface SKProduct (LocalizedPrice)

@property (nonatomic, readonly) NSString *localizedPrice;

@end
