//
//  TSCDrawViewController.m
//  TeamSpaceCadets
//
//  Created by Mary Orth on 12/18/12.
//  Copyright (c) 2012 RIT Space Cadets. All rights reserved.
//

#import "TSCDrawViewController.h"
#import "TSCDrawingToolsDockViewController.h"

@interface TSCDrawViewController ()

@end

@implementation TSCDrawViewController
@synthesize toolsDock;

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
	// Do any additional setup after loading the view.
    
    // Add tools dock
    self.toolsDock = [[TSCDrawingToolsDockViewController alloc] initWithNibName:@"TSCDrawingToolsDockViewController" bundle:nil];
    [self.view addSubview:toolsDock.view];
    
    // Position tools dock
    CGRect dockViewRect = CGRectMake(0.0, 705.0, 800.0, 500.0);
    toolsDock.view.frame = dockViewRect;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
