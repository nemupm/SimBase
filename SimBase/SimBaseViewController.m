//
//  SimBaseViewController.m
//  SimBase
//
//  Created by Kiko on 2014/08/12.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "SimBaseViewController.h"

@implementation SimBaseViewController
static float const NUMBER_OF_GAMES_A_SEASON = 130;

@synthesize seasonResultModel;
@synthesize seasonResult;
@synthesize seasonResultAverage;
@synthesize winLoss;
@synthesize winRate;
@synthesize pointAverage;
@synthesize lostPointAverage;
@synthesize winLossAllSeasons;
@synthesize winRateAllSeasons;
@synthesize pointAverageAllSeasons;
@synthesize lostPointAverageAllSeasons;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    seasonResultModel = [SeasonResultModel seasonResultModel];
}
- (void)viewWillAppear:(BOOL)animated
{
    seasonResult = [seasonResultModel getSeasonResult];
    seasonResultAverage = [seasonResultModel getSeasonResultAverage];
    
    winLoss.text = [NSString stringWithFormat:@"%d勝 %d敗",[seasonResult.totalWin intValue],[seasonResult.totalLoss intValue]];
    winRate.text = [NSString stringWithFormat:@"%.1f",[seasonResult.totalWin floatValue]/NUMBER_OF_GAMES_A_SEASON];
    pointAverage.text = [NSString stringWithFormat:@"%.1f",[seasonResult.totalPoint floatValue]/NUMBER_OF_GAMES_A_SEASON];
    lostPointAverage.text = [NSString stringWithFormat:@"%.1f",[seasonResult.totalLostPoint floatValue]/NUMBER_OF_GAMES_A_SEASON];
    
    winLossAllSeasons.text = [NSString stringWithFormat:@"%d勝 %d敗",[seasonResultAverage.totalWin intValue],[seasonResultAverage.totalLoss intValue]];
    winRateAllSeasons.text = [NSString stringWithFormat:@"%.1f",[seasonResultAverage.winAverage floatValue]/NUMBER_OF_GAMES_A_SEASON];
    pointAverageAllSeasons.text = [NSString stringWithFormat:@"%.1f",[seasonResultAverage.pointAverage floatValue]/NUMBER_OF_GAMES_A_SEASON];
    lostPointAverageAllSeasons.text = [NSString stringWithFormat:@"%.1f",[seasonResultAverage.lostPointAverage floatValue]/NUMBER_OF_GAMES_A_SEASON];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
