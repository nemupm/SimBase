//
//  Batter.h
//  SimBase
//
//  Created by Kiko on 2014/08/13.
//  Copyright (c) 2014年 Kiko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Batter : NSObject
{
    NSNumber *batterId;
    NSString *name;
    NSNumber *teamId;
    NSNumber *orderNumber;
    NSNumber *battingAverage;
    NSNumber *longBattingAverage;
}

@property(nonatomic,retain)NSNumber *batterId;
@property(nonatomic,retain)NSString *name;
@property(nonatomic,retain)NSNumber *teamId;
@property(nonatomic,retain)NSNumber *orderNumber;
@property(nonatomic,retain)NSNumber *battingAverage;
@property(nonatomic,retain)NSNumber *longBattingAverage;

@end
