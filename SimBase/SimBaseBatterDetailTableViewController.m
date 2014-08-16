//
//  SimBaseBatterDetailTableViewController.m
//  SimBase
//
//  Created by Kiko on 2014/08/13.
//  Copyright (c) 2014年 Kiko. All rights reserved.
//

#import "SimBaseBatterDetailTableViewController.h"

@implementation SimBaseBatterDetailTableViewController
@synthesize batterModel;
@synthesize batter;
@synthesize batterId;
@synthesize name;
@synthesize teamId;
@synthesize orderNumber;
@synthesize battingAverage;
@synthesize longBattingAverage;
@synthesize battingAverageSlider;
@synthesize longBattingAverageSlider;

float floatBattingAverage;
float floatLongBattingAverage;

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    batterId.text = [batter.batterId stringValue];
    name.text = batter.name;
    teamId.text = [batter.teamId stringValue];
    orderNumber.text = [batter.orderNumber stringValue];
    battingAverage.text = [NSString stringWithFormat:@"%.3f",[batter.battingAverage floatValue]];
    longBattingAverage.text = [NSString stringWithFormat:@"%.3f",[batter.longBattingAverage floatValue]];
    floatBattingAverage = [batter.battingAverage floatValue];
    battingAverageSlider.value = floatBattingAverage;
    floatLongBattingAverage = [batter.longBattingAverage floatValue];
    longBattingAverageSlider.value = floatLongBattingAverage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 6;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)battingAverageSliderChanged:(id)sender {
    floatBattingAverage = round(battingAverageSlider.value*100)/100;
    battingAverage.text = [NSString stringWithFormat:@"%.3f",floatBattingAverage];
}

- (IBAction)longBattingAverageSliderChanged:(id)sender {
    floatLongBattingAverage = round(longBattingAverageSlider.value*100)/100;
    longBattingAverage.text = [NSString stringWithFormat:@"%.3f",floatLongBattingAverage];
}

- (BOOL)textFieldShouldReturn:(UITextField*)theTextField{
    if(theTextField == name){
        [theTextField resignFirstResponder];
    }
    return YES;
}

- (IBAction)updateBatterStatus:(id)sender {
    batter.battingAverage = [NSNumber numberWithFloat:floatBattingAverage];
    batter.longBattingAverage = [NSNumber numberWithFloat:floatLongBattingAverage];
    batter.name = name.text;
    [batterModel updateBatterStatus:batter];
}
@end
