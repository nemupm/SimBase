//
//  SimBaseBatterTableViewController.h
//  SimBase
//
//  Created by Kiko on 2014/08/13.
//  Copyright (c) 2014年 Kiko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BatterModel.h"

@interface SimBaseBatterTableViewController : UITableViewController
{
    NSMutableArray *mBatters;
    BatterModel* batterModel;
    Batter *selectedBatter;
}

@end
