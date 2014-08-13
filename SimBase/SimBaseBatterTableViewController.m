//
//  SimBaseBatterTableViewController.m
//  SimBase
//
//  Created by Kiko on 2014/08/13.
//  Copyright (c) 2014年 Kiko. All rights reserved.
//

#import "SimBaseBatterTableViewController.h"
#import "Batter.h"

@interface SimBaseBatterTableViewController ()

@end

@implementation SimBaseBatterTableViewController

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
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"teamdata.db"];
    BOOL success = [fileManager fileExistsAtPath:writableDBPath];
    if(!success){
        NSAssert1(0, @"failed to create writable db file with message '%@'.", [error localizedDescription]);
    }
    NSLog(@"testest");
    
    FMDatabase* db = [FMDatabase databaseWithPath:writableDBPath];
    if(![db open])
    {
        NSLog(@"Err %d: %@",[db lastErrorCode],[db lastErrorMessage]);
    }
    [db setShouldCacheStatements:YES];
    
    NSString* sql = @"SELECT * FROM batter;";
    FMResultSet* rs = [db executeQuery:sql];
    mBatters = [[NSMutableArray alloc] init];
    while([rs next])
    {
        Batter * batter = [[Batter alloc] init];
        batter.batterId = [[NSNumber alloc] initWithInt:[rs intForColumn:@"batter_id"]];
        batter.name = [rs stringForColumn:@"name"];
        batter.teamId = [[NSNumber alloc] initWithInt:[rs intForColumn:@"team_id"]];
        batter.orderNumber = [[NSNumber alloc] initWithInt:[rs intForColumn:@"order_number"]];
        batter.battingAverage = [[NSNumber alloc] initWithFloat:[rs doubleForColumn:@"batting_average"]];
        batter.longBattingAverage = [[NSNumber alloc] initWithFloat:[rs doubleForColumn:@"long_batting_average"]];
        [mBatters addObject:batter];
    }
    [rs close];
    [db close];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [mBatters count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    Batter *batter = [mBatters objectAtIndex:indexPath.row];
    cell.textLabel.text = batter.name;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // Configure the cell...
    
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

@end
