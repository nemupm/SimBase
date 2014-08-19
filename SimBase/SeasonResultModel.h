//
//  SeasonResultModel.h
//  SimBase
//
//  Created by Kiko on 2014/08/19.
//  Copyright (c) 2014年 Kiko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "SeasonResult.h"
#import "SeasonResultAverage.h"

@interface SeasonResultModel : NSObject{
    FMDatabase* db;
}
@property(nonatomic)FMDatabase* db;
+(SeasonResultModel*)seasonResultModel;
-(SeasonResult*)getSeasonResult;
-(SeasonResultAverage*)getSeasonResultAverage;
@end
