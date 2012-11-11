//
//  InAppPurchaseManager.m
//  Microlending
//
//  Created by guest user on 11/8/12.
//
//

#import "InAppPurchaseManager.h"

@implementation InAppPurchaseManager

- (void)requestleafProductData
{
    NSSet *productIdentifiers = [NSSet setWithObject:@".com.seed.Microlending.LEAF1537" ];
    productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:productIdentifiers];
    productsRequest.delegate = self;
    [productsRequest start];
    
    // we will release the request object in the delegate callback
}

#pragma mark -
#pragma mark SKProductsRequestDelegate methods

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
    }
    
    for (NSString *invalidProductId in response.invalidProductIdentifiers)
    {
        NSLog(@"Invalid product id: %@" , invalidProductId);
    }
    
    // finally release the reqest we alloc/init’ed in requestleafProductData
    [productsRequest release];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kInAppPurchaseManagerProductsFetchedNotification object:self userInfo:nil];
}

@end
