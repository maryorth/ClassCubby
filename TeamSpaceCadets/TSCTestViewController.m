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
//  - when to set property/synthesize variables vs. in viewDidLoad
//  - pass in properties from array into method when called (ex. number of blanks, correct answer, possible choices...)


//  maybe when moving onto next question, check whether mult choice or fill in, then check for correct answer
// [questionAndAnswers setObject:chosenLetters forKey:currentQuestion];
// do i need to concatenate letters in chosenLetters into one whole word first?

#import "TSCTestViewController.h"
#import "TSCFillinBlanksViewController.h"
#import "TSCMultChoiceViewController.h"
#import "TSCUtility.h"

@interface TSCTestViewController ()

@end

@implementation TSCTestViewController
@synthesize currentQuestion, totalQuestions, viewsArray;

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

    // need to dynamically get the bookID here
    int bookID = 1;
    
    NSMutableArray *thisTest = [TSCUtility getTest:bookID];
    NSLog(@"getTest json results: %@", thisTest);
    
    NSString *typeQuestion = @"fib";
    
    totalQuestions = [thisTest count];
    currentQuestion = 1; //need to increment when moving onto next question
    NSString *questionsString = [thisTest objectAtIndex:1];
    int howManyBlanks = [[thisTest objectAtIndex:3] length];
    
    //for loop goes thru each question
    for (int i=0; i<totalQuestions; i++) {
        // ****** for fill-in-the-blanks questions: ****** //
        if (typeQuestion == @"fib") {
            /*
            TSCFillinBlanksViewController *fillinBlanksView = [[TSCFillinBlanksViewController alloc] initWithQuestion:questionsString currentQuest:currentQuestion totalQuest:totalQuestions totalBlanks:howManyBlanks];
            [viewsArray addObject:fillinBlanksView];
             */
        }
        
        // ****** for multiple choice questions: ****** //
        else if (typeQuestion == @"mc") {
            /*
            [viewsArray addObject:[TSCMultChoiceViewController setupMultChoice]];
             */
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
