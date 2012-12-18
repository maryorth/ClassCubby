//
//  TSCProgressViewController.h
//  TeamSpaceCadets
//
//  Created by Student on 12/17/12.
//  Copyright (c) 2012 RIT Space Cadets. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSCProgressViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;
@property (weak, nonatomic) IBOutlet UILabel *countCurrent;
@property (weak, nonatomic) IBOutlet UILabel *countTotal;


@property float numPages;
@property float currentPage;

- (void)setNewProgress;

@end
