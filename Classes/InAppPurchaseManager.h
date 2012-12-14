//
//  InAppPurchaseManager.h
//  Microlending
//
//  Created by Leonard Ng'eno on 11/8/12.
//
//

/* 
 This class handles purchases from the App Store. As of now (Fall 2012 version), the only products that can be bought from the App Store are the leaves.
 The class is adapted from Troy's tutorial "In App Purchases: A Full Walk Through" found in http://troybrant.net/blog/2010/01/in-app-purchases-a-full-walkthrough/ 
*/

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>
#import "MicrolendingAppDelegate.h"
#import "ResourceViewController.h"
#import "ResoCurrencyViewController.h"

//Notifications
#define kInAppPurchaseManagerProductsFetchedNotification @"kInAppPurchaseManagerProductsFetchedNotification"
#define kInAppPurchaseManagerTransactionFailedNotification @"kInAppPurchaseManagerTransactionFailedNotification"
#define kInAppPurchaseManagerTransactionSucceededNotification @"kInAppPurchaseManagerTransactionSucceededNotification"


@interface InAppPurchaseManager : NSObject <SKProductsRequestDelegate, SKPaymentTransactionObserver>
{
    SKProduct *leafProduct;
    SKProductsRequest *productsRequest;
    MicrolendingAppDelegate *appDelegate;
}


//public methods
-(void)requestleafProductData;
- (void)loadStore;
- (BOOL)canMakePurchases;
- (void)purchaseLeaf;

@end