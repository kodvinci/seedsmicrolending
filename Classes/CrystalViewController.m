//
//  CrystalViewController.m
//  Microlending
//
//  Created by guest user on 12/11/12.
//
//

#import "CrystalViewController.h"

@class MicrolendingAppDelegate;

@implementation CrystalViewController

@synthesize crystals;
@synthesize appDelegate;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Crystals";
    crystals = [[NSMutableArray alloc] initWithObjects:@"Blue crystal", @"Red crystal", @"Green crystal", @"Yellow crystal", @"Loving heart", nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [crystals count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        cell.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
        cell.detailTextLabel.numberOfLines = 0;
    }
    //Configure the cell
  
    if ([[crystals objectAtIndex:indexPath.row]isEqualToString:@"Blue crystal"]) {
        [cell.textLabel setText:[crystals objectAtIndex:indexPath.row]];
        [cell.detailTextLabel setText :@"Earned from handmade loans"];
        [cell.imageView setImage:[UIImage imageNamed:@"bluecrystal.png"]];
    }
    if ([[crystals objectAtIndex:indexPath.row]isEqualToString:@"Red crystal"]) {
        [cell.textLabel setText:[crystals objectAtIndex:indexPath.row]];
        [cell.detailTextLabel setText:@"Earned from health loans"];
        [cell.imageView setImage:[UIImage imageNamed:@"redcrystal.png"]];
    }
    if ([[crystals objectAtIndex:indexPath.row]isEqualToString:@"Green crystal"]) {
        [cell.textLabel setText:[crystals objectAtIndex:indexPath.row]];
        [cell.detailTextLabel setText:@"Earned from agricultural loans"];
        [cell.imageView setImage:[UIImage imageNamed:@"greencrystal.png"]];
    }
    if ([[crystals objectAtIndex:indexPath.row]isEqualToString:@"Yellow crystal"]) {
        [cell.textLabel setText:[crystals objectAtIndex:indexPath.row]];
        [cell.detailTextLabel setText:@"Earned from service loans"];
        [cell.imageView setImage:[UIImage imageNamed:@"yellowcrystal.png"]];
    }
    if ([[crystals objectAtIndex:indexPath.row]isEqualToString:@"Loving heart"]) {
        [cell.textLabel setText:[crystals objectAtIndex:indexPath.row]];
        [cell.detailTextLabel setText:@"Required to buy a baby crib and bring a new seedling into the world"];
        [cell.imageView setImage:[UIImage imageNamed:@"lovingheart.png"]];
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

-(void)dealloc
{
    [super dealloc];
    [crystals release];
    [appDelegate release];
}

@end
