//
//  ResourceViewController.m
//  Microlending
//
//  Created by guest user on 11/4/12.
//
//

#import "ResourceViewController.h"


@implementation ResourceViewController

@synthesize furnitureImage, furnImage, num, number, furnitureName, furnName, description, furnDesc;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil resourceName:(NSString *) name
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        furnitureName = name;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if ([furnitureName isEqualToString:@"xp"]) {
        furnImage = [UIImage imageNamed:@"xp"];
        furnitureName = [[NSString alloc] initWithFormat:@"XP"];
        furnName.text = furnitureName;
        description = [[NSString alloc]initWithFormat:@"XP is a way of marking a player’s progress towards the next level. XP can be accumulated, but never spent. Players earn XP as a reward for many actions in the game."];
        furnDesc.text = description;
    }
    if ([furnitureName isEqualToString:@"coin"]) {
        furnImage = [UIImage imageNamed:@"coin"];
        furnitureName = [[NSString alloc] initWithFormat:@"coins"];
        furnName.text = furnitureName;
        description = [[NSString alloc]initWithFormat:@"Coins are a currency that is often earned by many actions in the game. They can be used to buy many things in the game."];
        furnDesc.text = description;

    }
    if ([furnitureName isEqualToString:@"leaf"]) {
        furnImage = [UIImage imageNamed:@"leaf"];
        furnitureName = [[NSString alloc] initWithFormat:@"leaves"];
        furnName.text = furnitureName;
        description = [[NSString alloc]initWithFormat:@"Leaves are a currency that can only be purchased. Some rare and special items in the game can only be bought using leaves."];
        furnDesc.text = description;
        
        //purchase button
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        [button addTarget:self action:@selector(buy:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"purchase" forState:UIControlStateNormal];
        
        button.frame = CGRectMake(230.0, 10.0, 90.0, 30.0);
        [self.view addSubview:button];
    }
    //what happens in this case?
    else if ([furnitureName isEqualToString:@"crystal"]) {
        furnImage = [UIImage imageNamed:@"crystal"];
    }
    
    self.title = furnitureName;
    
    [furnitureImage setImage:furnImage];
  
}

-(void)buy:(id)sender
{
    //storekit kicks in...
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
