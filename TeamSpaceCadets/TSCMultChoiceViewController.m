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
@synthesize correctNumber, answerLabelA, answerLabelB, answerLabelC, answerLabelD, chosenNumber, answer1Txt, answer2Txt, answer3Txt, answer4Txt, questionText, questionCounter;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithQuestion:(NSString *)questionTextStr
          currentQuest:(int)currentQuestNum
            totalQuest:(int)totalQuestNum
           answer1Text:(NSString *)answer1
           answer2Text:(NSString *)answer2
           answer3Text:(NSString *)answer3
           correctAnswerText:(NSString *)correctAnswer
{
    self = [super initWithNibName:@"TSCMultChoiceViewController" bundle:nil];
    if (self) {
        [questionCounter setText:[NSString stringWithFormat:@"Question %d of %d", currentQuestNum, totalQuestNum]];
        [questionText setText:questionTextStr];
        NSMutableArray *answerArray;
        
        [answerArray addObject:answer1];
        [answerArray addObject:answer2];
        [answerArray addObject:answer3];
        [answerArray addObject:correctAnswer];
        
        NSUInteger count = [answerArray count];
        for (NSUInteger i = 0; i < count; ++i) {
            // Select a random element between i and end of array to swap with.
            NSInteger nElements = count - i;
            NSInteger n = (arc4random() % nElements) + i;
            [answerArray exchangeObjectAtIndex:i withObjectAtIndex:n];
        }
        
        [answerLabelA setText:[answerArray objectAtIndex:0]];
        [answerLabelB setText:[answerArray objectAtIndex:1]];
        [answerLabelC setText:[answerArray objectAtIndex:2]];
        [answerLabelD setText:[answerArray objectAtIndex:3]];
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