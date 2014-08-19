//
//  SeasonResult.h
//  SimBase
//
//  Created by Kiko on 2014/08/19.
//  Copyright (c) 2014年 Kiko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SeasonResult : NSObject
{
    NSNumber *seasonIndex;
    NSNumber *teamId;
    NSNumber *totalWin;
    NSNumber *totalLoss;
    NSNumber *totalDraw;
    NSNumber *totalPoint;
    NSNumber *totalLostPoint;
}
@property(nonatomic,retain)NSNumber *seasonIndex;
@property(nonatomic,retain)NSNumber *teamId;
@property(nonatomic,retain)NSNumber *totalWin;
@property(nonatomic,retain)NSNumber *totalLoss;
@property(nonatomic,retain)NSNumber *totalDraw;
@property(nonatomic,retain)NSNumber *totalPoint;
@property(nonatomic,retain)NSNumber *totalLostPoint;
@end
