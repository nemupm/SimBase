//
//  SeasonResultAverage.h
//  SimBase
//
//  Created by Kiko on 2014/08/19.
//  Copyright (c) 2014年 Kiko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SeasonResultAverage : NSObject
{
    NSNumber *teamId;
    NSNumber *totalWin;
    NSNumber *totalLoss;
    NSNumber *winAverage;
    NSNumber *lossAverage;
    NSNumber *drawAverage;
    NSNumber *pointAverage;
    NSNumber *lostPointAverage;
}
@property(nonatomic,retain)NSNumber *teamId;
@property(nonatomic,retain)NSNumber *totalWin;
@property(nonatomic,retain)NSNumber *totalLoss;
@property(nonatomic,retain)NSNumber *winAverage;
@property(nonatomic,retain)NSNumber *lossAverage;
@property(nonatomic,retain)NSNumber *drawAverage;
@property(nonatomic,retain)NSNumber *pointAverage;
@property(nonatomic,retain)NSNumber *lostPointAverage;
@end
