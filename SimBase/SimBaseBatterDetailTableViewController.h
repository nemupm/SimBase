//
//  SimBaseBatterDetailTableViewController.h
//  SimBase
//
//  Created by Kiko on 2014/08/13.
//  Copyright (c) 2014年 Kiko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Batter.h"

@interface SimBaseBatterDetailTableViewController : UITableViewController
{
    Batter *batter;
    UITextField *name;
    UILabel *batterId;
    UILabel *teamId;
    UILabel *orderNumber;
    UILabel *battingAverage;
    UILabel *longBattingAverage;
    UIStepper *battingAverageStepper;
    UIStepper *longBattingAverageStepper;
}
@property(nonatomic,retain)Batter *batter;
@property(nonatomic,retain)IBOutlet UITextField *name;
@property(nonatomic,retain)IBOutlet UILabel *batterId;
@property(nonatomic,retain)IBOutlet UILabel *teamId;
@property(nonatomic,retain)IBOutlet UILabel *orderNumber;
@property(nonatomic,retain)IBOutlet UILabel *battingAverage;
@property(nonatomic,retain)IBOutlet UILabel *longBattingAverage;
@property(nonatomic,retain)IBOutlet UIStepper *battingAverageStepper;
@property(nonatomic,retain)IBOutlet UIStepper *longBattingAverageStepper;
@end
