//
//  TSCMulptipleChoiceViewController.m
//  TeamSpaceCadets
//
//  Created by Mary Orth on 12/27/12.
//  Copyright (c) 2012 RIT Space Cadets. All rights reserved.
//

#import "TSCMulptipleChoiceViewController.h"

@interface TSCMulptipleChoiceViewController ()

@end

@implementation TSCMulptipleChoiceViewController
@synthesize chosenNumber, correctNumber, answerLabelA, answerLabelB, answerLabelC, answerLabelD;

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

- (IBAction)choiceSelected:(id)sender {
    chosenNumber = [sender tag];
    NSLog(@"you chose number: %d", chosenNumber);
}
@end
