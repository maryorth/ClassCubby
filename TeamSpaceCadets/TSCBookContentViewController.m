//
//  TSCBookContentViewController.m
//  TeamSpaceCadets
//
//  Created by Student on 12/15/12.
//  Copyright (c) 2012 RIT Space Cadets. All rights reserved.
//

#import "TSCBookContentViewController.h"

@interface TSCBookContentViewController ()

@end

@implementation TSCBookContentViewController
@synthesize labelContents, counterContents;

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
    self.pageLabel.text = self.labelContents;
    self.pageCounter.text = self.counterContents;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
