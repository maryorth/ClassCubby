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
@synthesize currentBlank, totalBlanks, blanksArray, chosenLetters, questionText, questionCounter, questionNumberingtoSet, questionTexttoSet, rightAnswer;

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
                answer:(NSString *)theAnswer
{
    self = [super initWithNibName:@"TSCFillinBlanksViewController" bundle:nil];
    if (self) {
        chosenLetters = [[NSMutableArray alloc]init];
        currentBlank = 0;
        totalBlanks = totalBlanksNum;
        rightAnswer = theAnswer;
        
        questionNumberingtoSet = [NSString stringWithFormat:@"Question %d of %d", currentQuestNum, totalQuestNum];
        questionTexttoSet = whatQuestionStr;
        
        blanksArray = [[NSMutableArray alloc]init];
        [self answerBlanks];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [questionCounter setText:questionNumberingtoSet];
    
    NSString *blankStr = @"";
    NSString *underscore = @"__";
    
    for (int i = 0; i < [rightAnswer length]; i++) {
        blankStr = [blankStr stringByAppendingString:underscore];
    }
    questionTexttoSet = [questionTexttoSet stringByReplacingOccurrencesOfString:@"*" withString:blankStr];
    [questionText setText:questionTexttoSet];
    
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
    int startingXPoint = (self.view.bounds.size.width / 2) - (totalSpace / 2) - 100;
    
    // Find Y point where blanks should be
    int blankYPoint = 185;
    
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
    }
    else currentBlank = totalBlanks;
   
    NSLog(@"current blank space = %d",currentBlank);
    
    TSCBlankLetterViewController *thisBlank = [blanksArray objectAtIndex:(currentBlank-1)];
    
    //depending on which letter is pressed, add a letter to the blank
    switch ([sender tag])
    {
        case 1:
        {
            //insert A image
            NSLog(@"A was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"a.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"a";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:([chosenLetters count]-1) withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 2:
        {
            //insert B image
            NSLog(@"B was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"b.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"b";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 3:
        {
            //insert C image
            NSLog(@"C was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"c.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"c";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 4:
        {
            //insert D image
            NSLog(@"D was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"d.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"d";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 5:
        {
            //insert E image
            NSLog(@"E was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"e.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"e";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 6:
        {
            //insert F image
            NSLog(@"F was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"f.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"f";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 7:
        {
            //insert G image
            NSLog(@"G was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"g.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"g";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 8:
        {
            //insert H image
            NSLog(@"H was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"h.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"h";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 9:
        {
            //insert I image
            NSLog(@"I was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"i.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"i";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 10:
        {
            //insert J image
            NSLog(@"J was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"j.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"j";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 11:
        {
            //insert K image
            NSLog(@"K was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"k.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"k";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 12:
        {
            //insert L image
            NSLog(@"L was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"l.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"l";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 13:
        {
            //insert M image
            NSLog(@"M was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"m.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"m";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 14:
        {
            //insert N image
            NSLog(@"N was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"n.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"n";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 15:
        {
            //insert O image
            NSLog(@"O was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"o.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"o";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 16:
        {
            //insert P image
            NSLog(@"P was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"p.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"p";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 17:
        {
            //insert Q image
            NSLog(@"Q was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"q.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"q";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 18:
        {
            //insert R image
            NSLog(@"R was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"r.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"r";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 19:
        {
            //insert S image
            NSLog(@"S was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"s.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"s";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 20:
        {
            //insert T image
            NSLog(@"T was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"t.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"t";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 21:
        {
            //insert U image
            NSLog(@"U was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"u.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"u";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 22:
        {
            //insert V image
            NSLog(@"V was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"v.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"v";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 23:
        {
            //insert W image
            NSLog(@"W was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"w.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"w";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 24:
        {
            //insert X image
            NSLog(@"X was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"x.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"x";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 25:
        {
            //insert Y image
            NSLog(@"Y was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"y.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"y";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
        }
            break;
        case 26:
        {
            //insert Z image
            NSLog(@"Z was pressed");
            thisBlank.letterImage.hidden = NO;
            thisBlank.letterImage.image = [UIImage imageNamed:@"z.png"];
            NSString *letter = [[NSString alloc]init];
            letter = @"z";
            if ([chosenLetters count] == totalBlanks) {
                [chosenLetters replaceObjectAtIndex:currentBlank-1 withObject:letter];
            }
            else [chosenLetters insertObject:letter atIndex:currentBlank-1];
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
