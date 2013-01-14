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
@synthesize currentQuestion, totalQuestions, viewsArray, pageViewController;

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
    viewsArray = [[NSMutableArray alloc] init];
    
    NSMutableArray *thisTest = [TSCUtility getTest:bookID];
//    NSLog(@"getTest json results: %@", thisTest);
//    
//    NSLog(@"option at index 0 = %@",[thisTest objectAtIndex:0]);
    
    totalQuestions = [thisTest count];
    currentQuestion = 1; //need to increment when moving onto next question
    
    //for loop goes thru each question
    for (int i=0; i<totalQuestions; i++) {
        NSString *questionsString = [[thisTest objectAtIndex:i] valueForKey:@"questionText"];
        NSString *correctAns = [[thisTest objectAtIndex:i] valueForKey:@"answer"];
        NSString *typeQuestion = [[thisTest objectAtIndex:i] valueForKey:@"questionType"];
        
        
        // ****** for fill-in-the-blanks questions: ****** //
        if ([typeQuestion isEqualToString:@"fib"]) {
            int howManyBlanks = [correctAns length];
            
            TSCFillinBlanksViewController *fillinBlanksView = [[TSCFillinBlanksViewController alloc] initWithQuestion:questionsString currentQuest:(i+1) totalQuest:totalQuestions totalBlanks:howManyBlanks answer:correctAns];
            [viewsArray addObject:fillinBlanksView];
        }
        
        // ****** for multiple choice questions: ****** //
        else if ([typeQuestion isEqualToString:@"mc"]) {
            NSString *ans1 = [[[thisTest objectAtIndex:i] valueForKey:@"options"] objectAtIndex:0];
            NSString *ans2 = [[[thisTest objectAtIndex:i] valueForKey:@"options"] objectAtIndex:1];
            NSString *ans3 = [[[thisTest objectAtIndex:i] valueForKey:@"options"] objectAtIndex:2];
            
            TSCMultChoiceViewController *multChoiceView = [[TSCMultChoiceViewController alloc] initWithQuestion:questionsString currentQuest:(i+1) totalQuest:totalQuestions answer1Text:ans1 answer2Text:ans2 answer3Text:ans3 correctAnswerText:correctAns];
            [viewsArray addObject:multChoiceView];
        }
    }
    
    // Set up view controller
    pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    pageViewController.delegate = self;
    pageViewController.dataSource = self;
    
    // Set up initial view controller
    NSArray *viewControllers = [NSArray arrayWithObject:[viewsArray objectAtIndex:0]];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];

    // Add the pageviewcontroller to the window
    [self addChildViewController:pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    // Set up pageviewcontroller frame
    CGRect pageViewRect = self.view.bounds;
    pageViewRect = CGRectInset(pageViewRect, 60.0, 100.0);
    pageViewRect = CGRectMake(145.0, 100.0, 520.0, 830.0);
    self.pageViewController.view.frame = pageViewRect;
    
    
}

#pragma mark - Delegate Methods
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    if(currentQuestion == 1){
        return nil;
    }
    currentQuestion--;
    return [viewsArray objectAtIndex:(currentQuestion - 1)]; //using the index value
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    if(currentQuestion > [viewsArray count] - 1){
        return nil;
    }
    currentQuestion++;
    return [viewsArray objectAtIndex:(currentQuestion - 1)]; //using the index value
}

#pragma mark - Delegate Methods

- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController
                   spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    //Set the array with only 1 view controller
    UIViewController *currentViewController = [self.pageViewController.viewControllers objectAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:currentViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
    
    //Important- Set the doubleSided property to NO.
    self.pageViewController.doubleSided = NO;
    //Return the spine location
    return UIPageViewControllerSpineLocationMin;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
