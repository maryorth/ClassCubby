//
//  TSCFillinBlanksViewController.m
//  TeamSpaceCadets
//
//  Created by Mary Orth on 1/10/13.
//  Copyright (c) 2013 RIT Space Cadets. All rights reserved.
//

#import "TSCFillinBlanksViewController.h"
#import "TSCBookContentViewController.h"
#import "TSCTestViewController.h"
#import "TSCBlankLetterViewController.h"

@interface TSCFillinBlanksViewController()

@end

@implementation TSCFillinBlanksViewController
@synthesize currentBlank, totalBlanks, blanksArray, chosenLetters, questionText, questionCounter;

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (id)initWithQuestion:(NSString *)whatQuestionStr
           currentQuest:(int)currentQuestNum
            totalQuest:(int)totalQuestNum
           totalBlanks:(int)totalBlanksNum
{
    self = [super initWithNibName:@"TSCFillinBlanksViewController" bundle:nil];
    if (self) {
        chosenLetters = [[NSMutableArray alloc]init];
        currentBlank = 0;
        totalBlanks = totalBlanksNum; //set dynamically when reading in data    
        
        [questionCounter setText:[NSString stringWithFormat:@"Question %d of %d", currentQuestNum, totalQuestNum]];
        [questionText setText:whatQuestionStr];
        
        blanksArray = [[NSMutableArray alloc]init];
        [self answerBlanks];
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
