//
//  InAppPurchaseManager.m
//  Microlending
//
//  Created by Leonard Ng'eno on 11/8/12.
//
//

#import "InAppPurchaseManager.h"

@class MicrolendingAppDelegate;
@class ResourceViewController;

@implementation InAppPurchaseManager

//"SEEDSLEAFV1" is the Product ID. The Product is created in and resides in iTunes Connect where the Provisioning Profile and the App ID used by the Microlending Application was created.
- (void)requestleafProductData
{
    //Checks if some previous purchase didn't show up because purchase was interrupted & finishes it
  //  [self loadStore];
    
    appDelegate = [[UIApplication sharedApplication]delegate];

    NSSet *productIdentifiers = [NSSet setWithObject:@"SEEDSLEAFV1"];
    productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:productIdentifiers]; //will be released in the call back
    productsRequest.delegate = self;
    [productsRequest start];
}

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    NSArray *products = response.products;
    leafProduct = [products count] == 1 ? [[products firstObject] retain] : nil;
    
    if (leafProduct)
    {
        NSLog(@"Product title: %@" , leafProduct.localizedTitle);
        NSLog(@"Product description: %@" , leafProduct.localizedDescription);
        NSLog(@"Product price: %@" , leafProduct.price);
        NSLog(@"Product id: %@" , leafProduct.productIdentifier);
        //Proceed to make purchase
        [self purchaseLeaf];
    }
    
    for (NSString *invalidProductId in response.invalidProductIdentifiers)
    {
        NSLog(@"Invalid product id: %@" , invalidProductId);
    }
    
    // finally release the reqest we alloc/init’ed in requestleafProductData
    [productsRequest release];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kInAppPurchaseManagerProductsFetchedNotification object:self userInfo:nil];
}

#define kInAppPurchaseLeafProductId @"SEEDSLEAFV1"

// call this method once on startup
- (void)loadStore
{
    // restarts any purchases if they were interrupted last time the app was open
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    
    // get the product description (defined in early sections)
    [self requestleafProductData];
}


// call this before making a purchase
- (BOOL)canMakePurchases
{
    return [SKPaymentQueue canMakePayments];
}


// kick off the purchase transaction
- (void)purchaseLeaf
{
    SKPayment *payment = [SKPayment paymentWithProduct:leafProduct];
    NSLog(@"Number of leaves bought: %d", payment.quantity);
    [[SKPaymentQueue defaultQueue] addPayment:payment];
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];

}


// saves a record of the transaction by storing the receipt to disk
- (void)recordTransaction:(SKPaymentTransaction *)transaction
{
    if ([transaction.payment.productIdentifier isEqualToString:kInAppPurchaseLeafProductId])
    {
        // save the transaction receipt to disk
        [[NSUserDefaults standardUserDefaults] setValue:transaction.transactionReceipt forKey:@"leafTransactionReceipt"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}


// add bought leaves to the NSUserDefaults
- (void)addLeaves:(NSInteger) numLeaves
{
    NSLog(@"Add leaves");
    NSInteger oldLeaves = [appDelegate.citadelData integerForKey:@"leaves"];
    NSInteger batch = (10 * numLeaves);
    numLeaves = batch + oldLeaves;
    NSLog(@"numLeaves: %d", numLeaves);
 
    [appDelegate.citadelData setInteger:numLeaves forKey:@"leaves"];
   
    [appDelegate.citadelData synchronize];
    ResourceViewController *refresh = [[ResourceViewController alloc]init];
    [refresh viewDidLoad];
}

// removes the transaction from the queue and posts a notification with the transaction result
- (void)finishTransaction:(SKPaymentTransaction *)transaction wasSuccessful:(BOOL)wasSuccessful
{
    // remove the transaction from the payment queue.
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:transaction, @"transaction" , nil];
    if (wasSuccessful)
    {
        // send out a notification that we’ve finished the transaction
        [[NSNotificationCenter defaultCenter] postNotificationName:kInAppPurchaseManagerTransactionSucceededNotification object:self userInfo:userInfo];
    }
    else
    {
        // send out a notification for the failed transaction
        [[NSNotificationCenter defaultCenter] postNotificationName:kInAppPurchaseManagerTransactionFailedNotification object:self userInfo:userInfo];
    }
}

// called when the transaction was successful
- (void)completeTransaction:(SKPaymentTransaction *)transaction
{
    NSLog(@"Purchase successful!");
    [self addLeaves:transaction.payment.quantity];
    [self recordTransaction:transaction];
    [self finishTransaction:transaction wasSuccessful:YES];
}


// called when a transaction has been restored and and successfully completed
- (void)restoreTransaction:(SKPaymentTransaction *)transaction
{
    [self recordTransaction:transaction.originalTransaction];
    [self addLeaves:transaction.originalTransaction.payment.quantity];
    [self finishTransaction:transaction wasSuccessful:YES];
}


// called when a transaction has failed
- (void)failedTransaction:(SKPaymentTransaction *)transaction
{
    if (transaction.error.code != SKErrorPaymentCancelled)
    {
        // error!
        [self finishTransaction:transaction wasSuccessful:NO];
    }
    else
    {
        // this is fine, the user just cancelled, so don’t notify
        [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
    }
}

// called when the transaction status is updated
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
    NSLog(@"Status updated!");
    for (SKPaymentTransaction *transaction in transactions)
    {
        switch (transaction.transactionState)
        {
            case SKPaymentTransactionStatePurchased:
                [self completeTransaction:transaction];
                break;
            case SKPaymentTransactionStateFailed:
                [self failedTransaction:transaction];
                break;
            case SKPaymentTransactionStateRestored:
                [self restoreTransaction:transaction];
                break;
            default:
                break;
        }
    }
}

@end
