//
//  TSCTestViewController.m
//  TeamSpaceCadets
//
//  Created by Mary Orth on 12/18/12.
//  Copyright (c) 2012 RIT Space Cadets. All rights reserved.
//

//  TO DO:
//  - center blanks better?
//  - title needs to change type design for universal, dynamic font
//  - indicate which type of question and call coresponding methods
//  - add images for rest of letters when clicked
//  - how to check answers?

// [questionAndAnswers setObject:chosenLetters forKey:currentQuestion];
// do i need to concatenate letters in chosenLetters into one whole word?

#import "TSCTestViewController.h"

@interface TSCTestViewController ()

@end

@implementation TSCTestViewController
@synthesize whatQuestionAmI, questionText, currentBlank, currentQuestion, totalBlanks, totalQuestions, blanksArray, chosenLetters, questionAndAnswers;

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
    
    //type 1 = fill in the blank
    //type 2 = multiple choice
    int typeQuestion = 1;
    chosenLetters = [[NSMutableArray alloc]init];
    
    currentQuestion = 1; //need to increment when moving onto next question
    
    // ****** for fill-in-the-blanks questions: ****** //
    if (typeQuestion == 1) {
        [self setupFillInBlanks];
    }
    
    // ****** for multiple choice questions: ****** //
    else if (typeQuestion == 2) {
        //[self setupMultChoice];
    }
    
}

- (void)setupFillInBlanks {
    currentBlank = 0;
    totalBlanks = 4; //set dynamically when reading in data
    totalQuestions = 25; //set dynamically
    
    whatQuestionAmI.text = [NSString stringWithFormat:@"Question %d of %d", currentQuestion, totalQuestions];
    questionText.text = @"The cow jumped over the _ _ _ _ .";
    
    blanksArray = [[NSMutableArray alloc]init];
    [self answerBlanks];
}

//- (void)setupMultChoice {
//    TSCMultipleChoiceViewController *multChoiceView = [[TSCMultipleChoiceViewController alloc] initWithNibName:@"TSCMultipleChoiceViewController" bundle: nil];
//    CGRect blankRect = CGRectMake(162, 261, 698, 368);
//    multChoiceView.view.frame = blankRect;
//    [self.view addSubview:multChoiceView.view];
//}

- (void)answerBlanks {
    //calculate total space needed for blanks
    int totalSpace = totalBlanks * 85;
    
    // Get the starting x point of the blanks
    // Find halfway point of page minus half of totalSpace to center it
    int startingXPoint = (self.view.bounds.size.width / 2) - (totalSpace / 2);
    
    // Find Y point where blanks should be
    int blankYPoint = 285;
    
    // Width of blank view
    int blankWidth = 85;
    
    // Height of blank view
    int blankHeight = 80;
    
    //set number of blanks
    for (int i=1; i<(totalBlanks+1); i++) {
        //add a BlankLetter view for each blank in the answer
        TSCBlankLetterViewController *newBlank = [[TSCBlankLetterViewController alloc]initWithNibName:@"TSCBlankLetterViewController" bundle:nil];
        [blanksArray addObject:newBlank];
        newBlank.whichBlank = i;
        CGRect blankRect = CGRectMake((startingXPoint + (i * blankWidth)), blankYPoint, blankWidth, blankHeight);
        newBlank.view.frame = blankRect;
        [self.view addSubview:newBlank.view];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)letterPressed:(id)sender{
    if (currentBlank < totalBlanks) {
        currentBlank ++;
    } else currentBlank = totalBlanks;
    NSLog(@"current blank space = %d",currentBlank);
    
    TSCBlankLetterViewController *thisBlank = [blanksArray objectAtIndex:(currentBlank-1)];
    
    //depending on which letter is pressed, add a letter to the blank
    switch ([sender tag])
    {
        case 1:
        {
            //insert A image
            NSLog(@"A was pressed");
        }
            break;
        case 2:
        {
            //insert B image
            NSLog(@"B was pressed");
        }
            break;
        case 3:
        {
            //insert C image
            NSLog(@"C was pressed");
        }
            break;
        case 4:
        {
            //insert D image
            NSLog(@"D was pressed");
        }
            break;
        case 5:
        {
            //insert E image
            NSLog(@"E was pressed");
        }
            break;
        case 6:
        {
            //insert F image
            NSLog(@"F was pressed");
        }
            break;
        case 7:
        {
            //insert G image
            NSLog(@"G was pressed");
        }
            break;
        case 8:
        {
            //insert H image
            NSLog(@"H was pressed");
        }
            break;
        case 9:
        {
            //insert I image
            NSLog(@"I was pressed");
        }
            break;
        case 10:
        {
            //insert J image
            NSLog(@"J was pressed");
        }
            break;
        case 11:
        {
            //insert K image
            NSLog(@"K was pressed");
        }
            break;
        case 12:
        {
            //insert L image
            NSLog(@"L was pressed");
        }
            break;
        case 13:
        {
            //insert M image
            NSLog(@"M was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"M.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"m";
            [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 14:
        {
            //insert N image
            NSLog(@"N was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"N.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"n";
            [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 15:
        {
            //insert O image
            NSLog(@"O was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"O.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"o";
            [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 16:
        {
            //insert P image
            NSLog(@"P was pressed");
        }
            break;
        case 17:
        {
            //insert Q image
            NSLog(@"Q was pressed");
        }
            break;
        case 18:
        {
            //insert R image
            NSLog(@"R was pressed");
        }
            break;
        case 19:
        {
            //insert S image
            NSLog(@"S was pressed");
        }
            break;
        case 20:
        {
            //insert T image
            NSLog(@"T was pressed");
        }
            break;
        case 21:
        {
            //insert U image
            NSLog(@"U was pressed");
        }
            break;
        case 22:
        {
            //insert V image
            NSLog(@"V was pressed");
        }
            break;
        case 23:
        {
            //insert W image
            NSLog(@"W was pressed");
        }
            break;
        case 24:
        {
            //insert X image
            NSLog(@"X was pressed");
        }
            break;
        case 25:
        {
            //insert Y image
            NSLog(@"Y was pressed");
        }
            break;
        case 26:
        {
            //insert Z image
            NSLog(@"Z was pressed");
        }
            break;
    }
    
    NSLog(@"Letters in answer: %@", chosenLetters);
}

- (IBAction)deletePressed:(id)sender {
    //remove letter on current blank
    NSLog(@"Delete was pressed");
    if (currentBlank == 0) {
        TSCBlankLetterViewController *thisBlank = [blanksArray objectAtIndex:currentBlank];
        thisBlank.letterImage.hidden = YES;
    } else {
        TSCBlankLetterViewController *thisBlank = [blanksArray objectAtIndex:currentBlank-1];
        thisBlank.letterImage.hidden = YES;
    }
    
    if (currentBlank > 1) {
        currentBlank --;
    } else currentBlank = 0;
    
    [chosenLetters removeLastObject];
    NSLog(@"Letters in answer: %@", chosenLetters);
    NSLog(@"current blank space = %d",currentBlank);
}

@end
