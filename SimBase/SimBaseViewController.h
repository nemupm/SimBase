//
//  SimBaseViewController.h
//  SimBase
//
//  Created by Kiko on 2014/08/12.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeasonResultModel.h"

@interface SimBaseViewController : UIViewController
{
    SeasonResultModel *seasonResultModel;
    SeasonResult *seasonResult;
    SeasonResultAverage *seasonResultAverage;
}
@property (nonatomic,retain)SeasonResultModel *seasonResultModel;
@property (nonatomic,retain)SeasonResult *seasonResult;
@property (nonatomic,retain)SeasonResultAverage *seasonResultAverage;
@property (weak, nonatomic) IBOutlet UILabel *winLoss;
@property (weak, nonatomic) IBOutlet UILabel *winRate;
@property (weak, nonatomic) IBOutlet UILabel *pointAverage;
@property (weak, nonatomic) IBOutlet UILabel *lostPointAverage;
@property (weak, nonatomic) IBOutlet UILabel *winLossAllSeasons;
@property (weak, nonatomic) IBOutlet UILabel *winRateAllSeasons;
@property (weak, nonatomic) IBOutlet UILabel *pointAverageAllSeasons;
@property (weak, nonatomic) IBOutlet UILabel *lostPointAverageAllSeasons;
@end
