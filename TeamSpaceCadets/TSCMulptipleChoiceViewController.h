//
//  TSCMulptipleChoiceViewController.h
//  TeamSpaceCadets
//
//  Created by Mary Orth on 12/27/12.
//  Copyright (c) 2012 RIT Space Cadets. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSCMulptipleChoiceViewController : UIViewController
- (IBAction)choiceSelected:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *answerLabelA;
@property (strong, nonatomic) IBOutlet UILabel *answerLabelB;
@property (strong, nonatomic) IBOutlet UILabel *answerLabelC;
@property (strong, nonatomic) IBOutlet UILabel *answerLabelD;

@property int chosenNumber;
@property int correctNumber;

@end
