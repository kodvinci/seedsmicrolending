
#import <UIKit/UIKit.h>
#import "PayPal.h"
#import "MicrolendingAppDelegate.h"
#import "Lender.h"
#import "Sender.h"
#import "ProfileViewController.h"

@protocol PayButtonDelegate <NSObject>

-(void)transactionsuccessful:(NSString *)payKey; 

@end

typedef enum PaymentStatuses {
	PAYMENTSTATUS_SUCCESS,
	PAYMENTSTATUS_FAILED,
	PAYMENTSTATUS_CANCELED,
} PaymentStatus;

@class MicrolendingAppDelegate;
@class Lender;
@class Sender;
@class ProfileViewController;

@interface PayButtonViewController : UIViewController <PayPalPaymentDelegate, UITextFieldDelegate> {
	@private
	CGFloat y;
	BOOL resetScrollView;
	PaymentStatus status;
    MicrolendingAppDelegate *appDelegate;
    NSDecimalNumber *credo;
    UITextField *preapprovalField;
    id payDelegate;
    UITextField *nameField;
//    NSDecimalNumber *thisAmount;
}

//@property (nonatomic, retain) NSDecimalNumber *thisAmount;
@property (nonatomic, retain) UITextField *nameField;
@property (nonatomic, retain) UITextField *preapprovalField;
@property (nonatomic, retain) NSDecimalNumber *credo;
@property (nonatomic, assign) id<PayButtonDelegate> payDelegate;

@end
