//
//  TSCFillinBlanksViewController.h
//  TeamSpaceCadets
//
//  Created by Mary Orth on 1/10/13.
//  Copyright (c) 2013 RIT Space Cadets. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSCFillinBlanksViewController : UIViewController

- (IBAction)deletePressed:(id)sender;
- (IBAction)letterPressed:(id)sender;
- (UIView *)setupFillInBlanks:(int)blanksNum;

@property int currentBlank;
@property int totalBlanks;
@property NSMutableArray *blanksArray;
@property NSMutableArray *chosenLetters;
@property (strong, nonatomic) IBOutlet UILabel *questionCounter;
@property (strong, nonatomic) IBOutlet UILabel *questionText;

@end
