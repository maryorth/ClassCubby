//
//  TSCTestViewController.h
//  TeamSpaceCadets
//
//  Created by Mary Orth on 12/18/12.
//  Copyright (c) 2012 RIT Space Cadets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSCBlankLetterViewController.h"

@interface TSCTestViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *whatQuestionAmI;
@property (strong, nonatomic) IBOutlet UILabel *questionText;
@property (strong, nonatomic) NSMutableArray *blanksArray;
@property (strong, nonatomic) NSMutableArray *chosenLetters;
@property (strong, nonatomic) NSMutableDictionary *questionAndAnswers;
@property int currentQuestion;
@property int totalQuestions;
@property int currentBlank;
@property int totalBlanks;

- (IBAction)deletePressed:(id)sender;
- (IBAction)letterPressed:(id)sender;

@end
