//
//  SeedlingDataViewController.m
//  Microlending
//
//  Created by Leonard Ng'eno on 11/21/12.
//
//

#import "SeedlingDataViewController.h"


@implementation SeedlingDataViewController

@synthesize myseedlings, seedlingImage, myDesire1, myDesire2, myDesire3, seedImage, desire1, desire2, desire3, happiness, seedlingName, hairType, hairColor, bodyType, bodyColor, faceType, happinessL, seedlingNameL, hairTypeL, hairColorL, bodyTypeL, bodyColorL, faceTypeL;
@synthesize editbody, editface, edithair, editname;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//This method assigns values to the various UILabel User Interface objects attached to the view controllers' nib file.

-(void)displayCharacteristics
{
    NSData *mySeedling = [appDelegate.citadelData objectForKey:@"seedlings"];
    NSArray *myarray = [NSKeyedUnarchiver unarchiveObjectWithData:mySeedling];
    myseedlings = [[NSMutableArray alloc]initWithArray:myarray];
    
    for (int k=0; k < myseedlings.count; k++) {
        seedlingImage = [UIImage imageNamed:@"seedlingcolored.png"];  //[[myseedlings objectAtIndex:k] myImage];
        [seedImage setImage:seedlingImage];
        seedlingName = [[NSString alloc]initWithString:[[myseedlings objectAtIndex:k] myName]];
        seedlingNameL.text = seedlingName;
        hairType = [[[myseedlings objectAtIndex:k] myCharacteristics] objectForKey:@"Hair Type"];
        hairTypeL.text = hairType;
        hairColor = [[[myseedlings objectAtIndex:k] myCharacteristics] objectForKey:@"Hair Color"];
        hairColorL.text = hairColor;
        bodyType = [[[myseedlings objectAtIndex:k] myCharacteristics] objectForKey:@"Body Type"];
        bodyTypeL.text = bodyType;
        bodyColor = [[[myseedlings objectAtIndex:k] myCharacteristics] objectForKey:@"Body Color"];
        bodyColorL.text = bodyColor;
        faceType = [[[myseedlings objectAtIndex:k] myCharacteristics] objectForKey:@"Face Type"];
        faceTypeL.text = faceType;
        happiness = [[myseedlings objectAtIndex:k] myHappiness];
        happinessL.text = [[NSString alloc] initWithFormat:@"%d",happiness];
        myDesire1 = [[[myseedlings objectAtIndex:k] myDesires] objectForKey:@"First Desire"];
        myDesire2 = [[[myseedlings objectAtIndex:k] myDesires] objectForKey:@"Second Desire"];
        myDesire3 = [[[myseedlings objectAtIndex:k] myDesires] objectForKey:@"Third Desire"];
        desire1.text = myDesire1;
        desire2.text = myDesire2;
        desire3.text = myDesire3;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Seedling Data";
    appDelegate = [[UIApplication sharedApplication]delegate];
    
    [self displayCharacteristics];
}

//Implement this method in order to allow the changing of seedling characteristics by the player
-(IBAction)editName
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"NOTIFICATION" message:@"Not yet implemented!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    alert.tag=1;
    [alert show];
    [alert release];
}

-(IBAction)editBody
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"NOTIFICATION" message:@"Not yet implemented!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    alert.tag=2;
    [alert show];
    [alert release];
}
-(IBAction)editHair
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"NOTIFICATION" message:@"Not yet implemented!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    alert.tag=3;
    [alert show];
    [alert release];
}
-(IBAction)editFace
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"NOTIFICATION" message:@"Not yet implemented!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    alert.tag=4;
    [alert show];
    [alert release];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (alertView.tag==1) {
        // NO = 0, YES = 1
        if(buttonIndex == 0){
            // DO whatever "NO" is
        }
        else {
            // Do whatever "YES" is

        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
