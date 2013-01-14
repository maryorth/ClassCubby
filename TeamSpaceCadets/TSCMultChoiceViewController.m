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
@synthesize correctNumber, answerLabelA, answerLabelB, answerLabelC, answerLabelD, chosenNumber, answer1Txt, answer2Txt, answer3Txt, answer4Txt, questionText, questionNumberingtoSet, questionTexttoSet, questionCounter, answerArray, aButtonActive, bButtonActive, cButtonActive, dButtonActive, buttonA, buttonB, buttonC, buttonD;

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
        questionNumberingtoSet =[NSString stringWithFormat:@"Question %d of %d", currentQuestNum, totalQuestNum];
        questionTexttoSet = questionTextStr;
        
        answer1Txt = answer1;
        answer2Txt = answer2;
        answer3Txt = answer3;
        answer4Txt = correctAnswer;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [questionCounter setText:questionNumberingtoSet];
    [questionText setText:questionTexttoSet];
    [questionText sizeToFit];
    
    answerArray = [[NSMutableArray alloc]init];
    
    [answerArray addObject:answer1Txt];
    [answerArray addObject:answer2Txt];
    [answerArray addObject:answer3Txt];
    [answerArray addObject:answer4Txt];
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)choiceSelected:(id)sender {
    chosenNumber = [sender tag];
    NSLog(@"you chose number: %d", chosenNumber);
    if (chosenNumber == 1) {
        [buttonA setImage:[UIImage imageNamed:@"aActive.png"] forState:UIControlStateNormal];
        [buttonB setImage:[UIImage imageNamed:@"bButton.png"] forState:UIControlStateNormal];
        [buttonC setImage:[UIImage imageNamed:@"cButton.png"] forState:UIControlStateNormal];
        [buttonD setImage:[UIImage imageNamed:@"dButton.png"] forState:UIControlStateNormal];
    }
    if (chosenNumber == 2){
        [buttonB setImage:[UIImage imageNamed:@"bActive.png"] forState:UIControlStateNormal];
        [buttonA setImage:[UIImage imageNamed:@"aButton.png"] forState:UIControlStateNormal];
        [buttonC setImage:[UIImage imageNamed:@"cButton.png"] forState:UIControlStateNormal];
        [buttonD setImage:[UIImage imageNamed:@"dButton.png"] forState:UIControlStateNormal];
    }
    if (chosenNumber == 3){
        [buttonC setImage:[UIImage imageNamed:@"cActive.png"] forState:UIControlStateNormal];
        [buttonA setImage:[UIImage imageNamed:@"aButton.png"] forState:UIControlStateNormal];
        [buttonB setImage:[UIImage imageNamed:@"bButton.png"] forState:UIControlStateNormal];
        [buttonD setImage:[UIImage imageNamed:@"dButton.png"] forState:UIControlStateNormal];
    }
    if (chosenNumber == 4){
        [buttonD setImage:[UIImage imageNamed:@"dActive.png"] forState:UIControlStateNormal];
        [buttonA setImage:[UIImage imageNamed:@"aButton.png"] forState:UIControlStateNormal];
        [buttonB setImage:[UIImage imageNamed:@"bButton.png"] forState:UIControlStateNormal];
        [buttonC setImage:[UIImage imageNamed:@"cButton.png"] forState:UIControlStateNormal];
    }
}

@end