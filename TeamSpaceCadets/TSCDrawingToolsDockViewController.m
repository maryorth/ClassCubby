//
//  TSCDrawingToolsDockViewController.m
//  TeamSpaceCadets
//
//  Created by MATTHEW ZASO (RIT Student) on 1/13/13.
//  Copyright (c) 2013 RIT Space Cadets. All rights reserved.
//

#import "TSCDrawingToolsDockViewController.h"

@interface TSCDrawingToolsDockViewController ()

@end

@implementation TSCDrawingToolsDockViewController

@synthesize isOpened;

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
    
    //Set isOpened to false;
    isOpened = false;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleTap];
}

- (void)handleSingleTap:(UIGestureRecognizer *)recognizer {
    if (!isOpened){
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.4];
        float xPos = self.view.frame.origin.x;
        float yPos = self.view.frame.origin.y - 180.0;
        float width = self.view.frame.size.width;
        float height = self.view.frame.size.height;
        
        self.view.frame = CGRectMake(xPos,yPos,width,height);
        [UIView commitAnimations];
        
        isOpened = true;
    } else {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.4];
        float xPos = self.view.frame.origin.x;
        float yPos = self.view.frame.origin.y + 180.0;
        float width = self.view.frame.size.width;
        float height = self.view.frame.size.height;
        
        self.view.frame = CGRectMake(xPos,yPos,width,height);
        [UIView commitAnimations];
        
        isOpened = false;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
