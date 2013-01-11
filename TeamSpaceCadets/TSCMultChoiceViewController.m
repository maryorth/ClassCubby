//
//  TSCMultChoiceViewController
//  TeamSpaceCadets
//
//  Created by Mary Orth on 12/27/12.
//  Copyright (c) 2012 RIT Space Cadets. All rights reserved.
//

#import "TSCMultChoiceViewController.h"

@interface TSCMultChoiceViewController ()

@end

@implementation TSCMultChoiceViewController
@synthesize correctNumber, answerLabelA, answerLabelB, answerLabelC, answerLabelD, chosenNumber, questionAndAnswers, answer1Txt, answer2Txt, answer3Txt, answer4Txt;

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

- (UIView *)setupMultChoice{
    TSCMultChoiceViewController *multChoiceView = [[TSCMultChoiceViewController alloc] initWithNibName:@"TSCMultChoiceViewController" bundle: nil];
    CGRect blankRect = CGRectMake(162, 261, 698, 368);
    multChoiceView.view.frame = blankRect;
    [self.view addSubview:multChoiceView.view];
    
    answer1Txt = @"Blue";
    answer2Txt = @"Purple";
    answer3Txt = @"Red";
    answer4Txt = @"Green";
    
    whatQuestionAmI.text = [NSString stringWithFormat:@"Question %d of %d", currentQuestion, totalQuestions];
    questionText.text = @"What color is the cape?";
    [multChoiceView.answerLabelA setText:answer1Txt];
    [multChoiceView.answerLabelB setText:answer2Txt];
    [multChoiceView.answerLabelC setText:answer3Txt];
    [multChoiceView.answerLabelD setText:answer4Txt];
    
    return multChoiceView.view;
}

@end