//
//  InAppPurchaseManager.h
//  Microlending
//
//  Created by guest user on 11/8/12.
//
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

#define kInAppPurchaseManagerProductsFetchedNotification @"kInAppPurchaseManagerProductsFetchedNotification"

@interface InAppPurchaseManager : NSObject <SKProductsRequestDelegate>
{
    SKProduct *leafProduct;
    SKProductsRequest *productsRequest;
}

-(void)requestleafProductData;

@end