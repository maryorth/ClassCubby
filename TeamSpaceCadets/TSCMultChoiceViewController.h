//
//  TSCMultChoiceViewController
//  TeamSpaceCadets
//
//  Created by Mary Orth on 12/27/12.
//  Copyright (c) 2012 RIT Space Cadets. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSCMultChoiceViewController : UIViewController
- (IBAction)choiceSelected:(id)sender;

- (id)initWithQuestion:(NSString *)questionTextStr
          currentQuest:(int)currentQuestNum
            totalQuest:(int)totalQuestNum
           answer1Text:(NSString *)answer1
           answer2Text:(NSString *)answer2
           answer3Text:(NSString *)answer3
     correctAnswerText:(NSString *)correctAnswer;

@property NSString *answer1Txt;
@property NSString *answer2Txt;
@property NSString *answer3Txt;
@property NSString *answer4Txt;

@property (strong, nonatomic) IBOutlet UILabel *answerLabelA;
@property (strong, nonatomic) IBOutlet UILabel *answerLabelB;
@property (strong, nonatomic) IBOutlet UILabel *answerLabelC;
@property (strong, nonatomic) IBOutlet UILabel *answerLabelD;

@property int chosenNumber;
@property int correctNumber;
@property (strong, nonatomic) IBOutlet UILabel *questionCounter;
@property (strong, nonatomic) IBOutlet UILabel *questionText;

@end