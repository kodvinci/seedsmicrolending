//
//  CollageViewController.m
//  Microlending
//
//  Created by Leonard ngeno on 06/11/2012.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//
/*
#import "CollageViewController.h"
#import "BadgeViewController.h"
#import "BorrowerSingleViewController.h"

@class BadgeViewController;
@class BorrowerSingleViewController;

@implementation CollageViewController

@synthesize wrapper_view;
@synthesize current_lender;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void)viewDidAppear:(BOOL)animated {
	
    [super viewDidAppear:YES];
    
	//get the current lender active 
    appDelegate = [[UIApplication sharedApplication] delegate];
    current_lender = appDelegate.currentLender; 
    
    int columns_of_pictures;
    int rows_of_pictures;
    if ([appDelegate.currentLender.userclass isEqualToString:@"Noobie"]) {
        columns_of_pictures = 2;
        rows_of_pictures = 1;
    }
    else if ([appDelegate.currentLender.userclass isEqualToString:@"Novice"]) {
        columns_of_pictures = 2;
        rows_of_pictures = 2;
    }
    else if ([appDelegate.currentLender.userclass isEqualToString:@"Power User"]) {
        columns_of_pictures = 3;
        rows_of_pictures = 2;
    }
    else if ([appDelegate.currentLender.userclass isEqualToString:@"Pro"]) {
        columns_of_pictures = 3;
        rows_of_pictures = 3;
    }
    else {
        columns_of_pictures = 3;
        rows_of_pictures = 4;
    }
	
    //variable initialization
    int height_of_picture = 200;
    int width_of_picture = 200;
    
    int pic_position_x = 0;
    int pic_position_y = 0;
    int column_position = 0;
    
    int number_of_pictures = columns_of_pictures * rows_of_pictures;
    
    //NSMutableArray* list_of_pictures = [[NSMutableArray alloc] init];
    NSMutableArray* current_lender_badges = [[NSMutableArray alloc] initWithArray:appDelegate.currentLender.badges];
	NSMutableArray* current_lender_transactions = [[NSMutableArray alloc] initWithArray:appDelegate.currentLender.transactions];
	NSMutableArray* current_lender_borrowers = [[NSMutableArray alloc] initWithArray:appDelegate.currentLender.borrowers];
    
    //wrapper is total size of zoomable area
    //scroll is size of screen
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    wrapper_view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width_of_picture*columns_of_pictures, rows_of_pictures*height_of_picture)];
    
    int type_of_patch_chooser; 
    int patch_types_available = 2;
    
    //loop through and create collage
    for (int i = 1; i <= number_of_pictures; i++) {
        
        UIImage* tempImage = [[UIImage alloc] init];
        type_of_patch_chooser = arc4random() % (patch_types_available);
        
        UIButton* tempButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //[tempButton setTitle:@"Button Title" forState:UIControlStateNormal];
        
        //make sure the lender pic is always added
        if (i == number_of_pictures / 2 + 1) {
            //add the profile pic of current lender
            if ([appDelegate.currentLender.uid intValue] == 1) {
                tempImage = [UIImage imageNamed:@"CodyKo.jpg"]; 
            }
            else {
                 tempImage = [UIImage imageNamed:@"KevinWang.jpg"]; 
            }
			[tempButton addTarget:self action:@selector(sendToProfile:) forControlEvents:UIControlEventTouchUpInside];
        }
        else {
			
            if (type_of_patch_chooser == 0) {
                if ([current_lender_badges count] != 0) {
                    //remove random one
                    [current_lender_badges removeObjectAtIndex:arc4random() % [current_lender_badges count]];
                    tempImage = [UIImage imageNamed:@"badge.png"]; 
                    [tempButton addTarget:self action:@selector(sendToBadge:) forControlEvents:UIControlEventTouchUpInside];
                }
                else if ([current_lender_transactions count] != 0) {
                    //remove random one
                    [current_lender_transactions removeObjectAtIndex:arc4random() % [current_lender_transactions count]];
                    tempImage = [UIImage imageNamed:@"borrower.png"]; 
                    [tempButton addTarget:self action:@selector(sendToTransaction:) forControlEvents:UIControlEventTouchUpInside];
                }
                else {
                    //add blank
                    tempImage = [UIImage imageNamed:@"SamBaek.jpg"];                 }
                
            }
            else if (type_of_patch_chooser == 1) {
                if ([current_lender_transactions count] != 0) {
                    //remove random one
                    [current_lender_transactions removeObjectAtIndex:arc4random() % [current_lender_transactions count]];

                     tempImage = [UIImage imageNamed:@"borrower.png"];
                    [tempButton addTarget:self action:@selector(sendToTransaction:) forControlEvents:UIControlEventTouchUpInside];
                }
                else if ([current_lender_badges count] != 0) {
                    
                    //remove random one
                    [current_lender_badges removeObjectAtIndex:arc4random() % [current_lender_badges count]];

                     tempImage = [UIImage imageNamed:@"badge.png"];
                    [tempButton addTarget:self action:@selector(sendToBadge:) forControlEvents:UIControlEventTouchUpInside];
                }
                else {
                    //add blank
                     tempImage = [UIImage imageNamed:@"SamBaek.jpg"]; 
                }
            }
        }
        
        
        
        UIImageView* tempImageView = [[UIImageView alloc] initWithFrame:CGRectMake(pic_position_x, pic_position_y, tempImage.size.width, tempImage.size.height)];
        [tempImageView setImage:tempImage];
        
        //add button to subview
        //[tempButton setFrame:CGRectMake(0, 0, tempImage.size.width, tempImage.size.height)];
		[tempButton setFrame:CGRectMake(pic_position_x, pic_position_y, tempImage.size.width, tempImage.size.height)];
		

        //[tempImageView addSubview: tempButton];
		//[tempImageView bringSubviewToFront:tempButton];
        
		
		
        //determine random amount to rotate
        double rad_rotate = ((double)rand()) / ((double)RAND_MAX) / 10 * 4 - 0.2;
        tempImageView.transform = CGAffineTransformMakeRotation(rad_rotate);
        
        [wrapper_view addSubview:tempImageView];
        [wrapper_view addSubview:tempButton];
		[tempImageView release];
        
        //update positions
        column_position = ( column_position + 1 ) % columns_of_pictures;
        if (column_position == 0) {
            pic_position_x = 0;
            pic_position_y += height_of_picture;
        }
        else {
            pic_position_x += width_of_picture;
        }
        
		//[tempButton release];
        [tempImage release];
    }
*/
    
    
    //for each image in list of pictures, determine position and add to wrapper view
    
    
    /*
    UIButton* testButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [testButton setFrame:CGRectMake(20, 20, 200, 200)];
    [testButton setTitle:@"Button Title" forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    testButton.transform = CGAffineTransformMakeRotation(.2);
    [wrapper_view addSubview:testButton];
    */
    
/*
    scroll.contentSize = CGSizeMake(width_of_picture*columns_of_pictures, rows_of_pictures*height_of_picture);
    scroll.scrollEnabled = YES;
    scroll.backgroundColor = [UIColor darkGrayColor];
    scroll.maximumZoomScale = 1;
    scroll.minimumZoomScale = .37;
    scroll.delegate = self;
    [scroll setZoomScale:scroll.minimumZoomScale];
    self.view = scroll;
    
    [scroll addSubview:wrapper_view];
    [scroll release];    */
    
    /*
	 UIImage* testImage = [UIImage imageNamed:@"CodyKo.jpg"] ;
	 testImage_view = [[UIImageView alloc] 
	 initWithFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, testImage.size.width, testImage.size.height)];
	 
	 [testImage_view setImage:testImage];
	 testImage_view.transform = CGAffineTransformMakeRotation(.2);
	 [scroll addSubview:testImage_view];
	 
	 [testImage_view release];
	 */
    
    
    /*NSMutableArray* list_of_names = [[NSMutableArray alloc] init];
	 for (int i = 0; i < 10; i++) {
	 NSString* myNewString = [NSString stringWithFormat:@"%i", i];
	 [list_of_names addObject:myNewString];
	 }
	 
	 int temp_position_y = 15;
	 int temp_position_x = 10;
	 for (NSString *a in list_of_names) {
	 UILabel *temp = [[UILabel alloc] initWithFrame:CGRectMake(temp_position_x, temp_position_y, 40, 20)];
	 temp.text = a;
	 [self.view addSubview:temp];
	 [temp release];
	 temp_position_y += 22;
	 temp_position_x += 2;
	 }*/
	
//}
/*
- (IBAction)sendToBadge:(id)sender{
	BadgeViewController* newBadgeView = [[BadgeViewController alloc] init];
	[self.navigationController pushViewController:newBadgeView animated:YES];
	[newBadgeView release];
}

- (IBAction)sendToTransaction:(id)sender{
    //BorrowerSingleViewController *new = [[BorrowerSingleViewController alloc] init];
//	[new.investButton setHidden:YES];
//	[self.navigationController pushViewController:new animated:YES];
//	[new release];
}

- (IBAction)sendToProfile:(id)sender{
    NSLog(@"buttonpressedtransaction");
}

- (void)viewDidLoad
{ 
    [super viewDidLoad];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return wrapper_view;
}

- (CGRect)centeredFrameForScrollView:(UIScrollView *)scroll andUIView:(UIView *)rView {
    CGSize boundsSize = scroll.bounds.size;
    CGRect frameToCenter = rView.frame;
    // center horizontally
    if (frameToCenter.size.width < boundsSize.width) {
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2;
    }
    else {
        frameToCenter.origin.x = 0;
    }
    // center vertically
    if (frameToCenter.size.height < boundsSize.height) {
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2;
    }
    else {
        frameToCenter.origin.y = 0;
    }
    return frameToCenter;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    wrapper_view.frame = [self centeredFrameForScrollView:scrollView andUIView:wrapper_view];;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
*/