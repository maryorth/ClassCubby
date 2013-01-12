//
//  TSCTestViewController.h
//  TeamSpaceCadets
//
//  Created by Mary Orth on 12/18/12.
//  Copyright (c) 2012 RIT Space Cadets. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSCTestViewController : UIViewController <UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@property NSMutableArray *viewsArray;
@property (nonatomic, strong) UIPageViewController *pageViewController;
@property int currentQuestion;
@property int totalQuestions;

@end
