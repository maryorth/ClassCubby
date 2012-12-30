//
//  TSCBlankLetterViewController.m
//  TeamSpaceCadets
//
//  Created by Mary Orth on 12/22/12.
//  Copyright (c) 2012 RIT Space Cadets. All rights reserved.
//

#import "TSCBlankLetterViewController.h"

@interface TSCBlankLetterViewController ()

@end

@implementation TSCBlankLetterViewController
@synthesize letterImage, whichBlank;

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

@end
