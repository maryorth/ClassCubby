//
//  TSCViewController.h
//  TeamSpaceCadets
//
//  Created by Mary Orth on 12/3/12.
//  Copyright (c) 2012 RIT Space Cadets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBJson.h"
#import "TSCBookContentViewController.h"
#import "TSCProgressViewController.h"

@interface TSCViewController : UIViewController<UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) NSMutableArray *modelArray;

@property TSCProgressViewController *progressBar;
@property NSMutableArray *bookObject;
@property int pageCount;

@end
