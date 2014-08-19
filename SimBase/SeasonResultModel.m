//
//  SeasonResultModel.m
//  SimBase
//
//  Created by Kiko on 2014/08/19.
//  Copyright (c) 2014年 Kiko. All rights reserved.
//

#import "SeasonResultModel.h"

@implementation SeasonResultModel

// database name
static NSString* const DB_FILE = @"teamdata.db";
@synthesize db;

// convenience constructor
+(SeasonResultModel*)seasonResultModel{
    SeasonResultModel* obj = [[self alloc] init];
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
    
    NSString* sql = @"CREATE TABLE IF NOT EXISTS season_result(season_index INTEGER PRIMARY KEY NOT NULL, team_id INTEGER, total_win INTEGER, total_loss INTEGER, total_draw INTEGER, total_point INTEGER, total_lost_point INTEGER);";
    [obj->db executeUpdate:sql];
    sql = @"DELETE FROM season_result";
    [obj->db executeUpdate:sql];
    sql = @"INSERT INTO season_result(season_index, team_id, total_win, total_loss, total_draw, total_point, total_lost_point)";
    NSArray *seasonResultArray = @[@"VALUES(1,1,100,20,10,400,320)"
                              ,@",(2,1,62,48,20,421,378)"
                              ,@",(3,1,55,65,10,354,418);"];
    
    for (NSUInteger ui = 0 ; ui < seasonResultArray.count; ui++) {
        sql = [sql stringByAppendingString:[seasonResultArray objectAtIndex:ui]];
    }
    [obj->db executeUpdate:sql];
    return obj;
}
-(SeasonResult*)getSeasonResult{
    NSString* sql = @"SELECT * FROM season_result order by season_index desc;";
    SeasonResult* seasonResult = [[SeasonResult alloc] init];
    FMResultSet* rs = [db executeQuery:sql];
    [rs next];
    
    seasonResult.seasonIndex = [[NSNumber alloc] initWithInt:[rs intForColumn:@"season_index"]];
    seasonResult.teamId = [[NSNumber alloc] initWithInt:[rs intForColumn:@"team_id"]];
    seasonResult.totalWin = [[NSNumber alloc] initWithInt:[rs intForColumn:@"total_win"]];
    seasonResult.totalLoss = [[NSNumber alloc] initWithInt:[rs intForColumn:@"total_loss"]];
    seasonResult.totalDraw = [[NSNumber alloc] initWithInt:[rs intForColumn:@"total_draw"]];
    seasonResult.totalPoint = [[NSNumber alloc] initWithInt:[rs intForColumn:@"total_point"]];
    seasonResult.totalLostPoint = [[NSNumber alloc] initWithInt:[rs intForColumn:@"total_lost_point"]];
    
    [rs close];
    return seasonResult;
}
-(SeasonResultAverage*)getSeasonResultAverage{
    NSString* sql = @"SELECT team_id, sum(total_win), sum(total_loss), avg(total_win), avg(total_loss), avg(total_draw), avg(total_point), avg(total_lost_point) FROM season_result;";
    SeasonResultAverage* seasonResultAverage = [[SeasonResultAverage alloc] init];
    FMResultSet* rs = [db executeQuery:sql];
    [rs next];
    
    seasonResultAverage.teamId = [[NSNumber alloc] initWithInt:[rs intForColumn:@"team_id"]];
    seasonResultAverage.totalWin = [[NSNumber alloc] initWithInt:[rs doubleForColumn:@"sum(total_win)"]];
    seasonResultAverage.totalLoss = [[NSNumber alloc] initWithInt:[rs doubleForColumn:@"sum(total_loss)"]];
    seasonResultAverage.winAverage = [[NSNumber alloc] initWithInt:[rs doubleForColumn:@"avg(total_win)"]];
    seasonResultAverage.lossAverage = [[NSNumber alloc] initWithInt:[rs doubleForColumn:@"avg(total_loss)"]];
    seasonResultAverage.drawAverage = [[NSNumber alloc] initWithInt:[rs doubleForColumn:@"avg(total_draw)"]];
    seasonResultAverage.pointAverage = [[NSNumber alloc] initWithInt:[rs doubleForColumn:@"avg(total_point)"]];
    seasonResultAverage.lostPointAverage = [[NSNumber alloc] initWithInt:[rs doubleForColumn:@"avg(total_lost_point)"]];
    
    [rs close];
    return seasonResultAverage;
}
/*
-(void)updateBatterStatus:(Batter*)batter{
    NSString* sql = [NSString stringWithFormat:@"UPDATE batter SET name='%@', batting_average=%f, long_batting_average=%f WHERE batter_id=%d",batter.name,[batter.battingAverage floatValue],[batter.longBattingAverage floatValue],[batter.batterId intValue]];
    [db executeUpdate:sql];
}*/
@end
