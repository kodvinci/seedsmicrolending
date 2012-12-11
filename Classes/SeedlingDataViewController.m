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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Seedling Data";
    appDelegate = [[UIApplication sharedApplication]delegate];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
