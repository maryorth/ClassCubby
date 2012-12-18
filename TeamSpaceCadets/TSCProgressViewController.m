//
//  TSCProgressViewController.m
//  TeamSpaceCadets
//
//  Created by Student on 12/17/12.
//  Copyright (c) 2012 RIT Space Cadets. All rights reserved.
//

#import "TSCProgressViewController.h"

@interface TSCProgressViewController ()

@end

@implementation TSCProgressViewController

@synthesize progressBar, numPages, currentPage, countTotal, countCurrent;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNewProgress
{
    float progress = currentPage / numPages;
    [progressBar setProgress:progress];
    countCurrent.text = [NSString stringWithFormat:@"%g", currentPage];
    countTotal.text = [NSString stringWithFormat:@"%g", numPages];
}

@end
