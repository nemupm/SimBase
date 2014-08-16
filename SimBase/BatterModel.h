//
//  BatterModel.h
//  SimBase
//
//  Created by Kiko on 2014/08/14.
//  Copyright (c) 2014年 Kiko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "Batter.h"

@interface BatterModel : NSObject{
    FMDatabase* db;
}
@property(nonatomic)FMDatabase* db;
+(BatterModel*)batterModel;
-(NSMutableArray*)getBatters;
-(void)updateBatterStatus:(Batter*)batter;
@end
