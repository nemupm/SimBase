//
//  BatterModel.m
//  SimBase
//
//  Created by Kiko on 2014/08/14.
//  Copyright (c) 2014年 Kiko. All rights reserved.
//

#import "BatterModel.h"

@implementation BatterModel
// database name
static NSString* const DB_FILE = @"teamdata.db";
@synthesize db;

// convenience constructor
+(BatterModel*)batterModel{
    BatterModel* obj = [[self alloc] init];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:DB_FILE];
    BOOL success = [fileManager fileExistsAtPath:writableDBPath];
    if(!success){
        //NSAssert1(0, @"failed to create writable db file with message '%@'.", [error localizedDescription]);
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *orgPath = [bundle bundlePath];
        orgPath = [orgPath stringByAppendingPathComponent:DB_FILE];
        if(![fileManager copyItemAtPath:orgPath toPath:writableDBPath error:nil]){
            NSAssert1(0,@"db file copy error:%@",orgPath);
        }
    }
    
    obj->db = [FMDatabase databaseWithPath:writableDBPath];
    if(![obj->db open])
    {
        NSLog(@"Err %d: %@",[obj->db lastErrorCode],[obj->db lastErrorMessage]);
    }
    [obj->db setShouldCacheStatements:YES];
    
    NSString* sql = @"CREATE TABLE IF NOT EXISTS batter(batter_id INTEGER PRIMARY KEY NOT NULL, name TEXT, team_id INTEGER, order_number INTEGER, batting_average REAL, long_batting_average REAL);";
    [obj->db executeUpdate:sql];
    sql = @"DELETE FROM batter";
    [obj->db executeUpdate:sql];
    sql = @"INSERT INTO batter(name, team_id, order_number, batting_average, long_batting_average)";
    NSArray *playersArray = @[@"VALUES('ココ・ヘクマティアル', 1, 1, 0.3, 0.5)"
                              ,@",('レーム', 1, 2, 0.4, 0.8)"
                              ,@",('ルツ', 1, 3, 0.18, 0.4)"
                              ,@",('ウゴ', 1, 4, 0.5, 0.5)"
                              ,@",('トージョ', 1, 5, 0.35, 0.72)"
                              ,@",('マオ', 1, 6, 0.33, 0.33)"
                              ,@",('バルメ', 1, 7, 0.38, 0.1)"
                              ,@",('アール', 1, 8, 0.23, 0.11)"
                              ,@",('ヨナ', 1, 9, 0.45, 0.3);"];
    
    for (NSUInteger ui = 0 ; ui < playersArray.count; ui++) {
        sql = [sql stringByAppendingString:[playersArray objectAtIndex:ui]];
    }
    [obj->db executeUpdate:sql];
    return obj;
}
-(NSMutableArray*)getBatters{
    NSString* sql = @"SELECT * FROM batter;";
    NSMutableArray* mBatters;
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
    return mBatters;
}
-(void)updateBatterStatus:(Batter*)batter{
    NSString* sql = [NSString stringWithFormat:@"UPDATE batter SET name='%@', batting_average=%f, long_batting_average=%f WHERE batter_id=%d",batter.name,[batter.battingAverage floatValue],[batter.longBattingAverage floatValue],[batter.batterId intValue]];
    [db executeUpdate:sql];
}
@end
