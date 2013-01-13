//
//  TSCViewController.m
//  TeamSpaceCadets
//
//  Created by Mary Orth on 12/3/12.
//  Copyright (c) 2012 RIT Space Cadets. All rights reserved.
//

#import "TSCViewController.h"
#import "TSCUtility.h"
#import "TSCDrawViewController.h"

@interface TSCViewController ()

@end

@implementation TSCViewController
@synthesize modelArray, pageViewController, progressBar, bookObject, pageCount;


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
	// Do any additional setup after loading the view, typically from a nib.
    
    [self loadBookData:1];
    
    //Instantiate a model array to keep page data in as well as the actual page view controller
    self.modelArray = [[NSMutableArray alloc] init];
//    for (int i=1;i<=10;i++){
//        [self.modelArray addObject:[NSString stringWithFormat:@"Page Number %d",i]];
//    }
    self.modelArray = [bookObject valueForKey:@"pages"];
    pageCount = [modelArray count];
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource = self;
    
    //Set up initial view controller
    TSCBookContentViewController *contentViewController = [[TSCBookContentViewController alloc] initWithNibName:@"TSCBookContentViewController" bundle:nil];
    contentViewController.labelContents = [self.bookObject valueForKey:@"title"];
    contentViewController.counterContents = [NSString stringWithFormat:@"0/%u",pageCount];
    NSArray *viewControllers = [NSArray arrayWithObject:contentViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    //Put the PageViewController on the screen
    [self addChildViewController:pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    //Set PageViewController frame
    CGRect pageViewRect = self.view.bounds;
    pageViewRect = CGRectInset(pageViewRect, 60.0, 100.0);
    pageViewRect = CGRectMake(40.0, 100.0, 640.0, 830.0);
    self.pageViewController.view.frame = pageViewRect;
    
    self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
    
    
//    //Set Progress bar
//    progressBar = [[TSCProgressViewController alloc] init];
//    [self.view addSubview:progressBar.view];
//    progressBar.currentPage = 1;
//    progressBar.numPages = 10;
//    [progressBar setNewProgress];
//    CGRect pbrect = CGRectMake(260.0, 680.0, 200.0, 53.0);
//    progressBar.view.frame = pbrect;
}

-(void)loadBookData:(int)bookID{
    bookObject = [TSCUtility getBook:bookID];
}

#pragma mark - Delegate Methods for UIPageViewController

-(UIViewController*)pageViewController:(UIPageViewController*)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger currentIndex = [[(TSCBookContentViewController *)viewController counterContents] intValue];
    if(currentIndex < 1){
        return nil;
    }
    if(currentIndex == 1){
        //Cover Here
        TSCBookContentViewController *contentViewController = [[TSCBookContentViewController alloc] initWithNibName:@"TSCBookContentViewController" bundle:nil];
        contentViewController.labelContents = [self.bookObject valueForKey:@"title"];
        contentViewController.counterContents = [NSString stringWithFormat:@"0/%u",pageCount];;
        return contentViewController;
    }
    TSCBookContentViewController *contentViewController = [[TSCBookContentViewController alloc] init];
    contentViewController.counterContents = [NSString stringWithFormat:@"%@/%u",[[self.modelArray objectAtIndex:currentIndex -2] valueForKey:@"pageNumber"],pageCount];
    contentViewController.labelContents = [NSString stringWithFormat:@"%@",[[self.modelArray objectAtIndex:currentIndex -2] valueForKey:@"text"]];
//    progressBar.currentPage = currentIndex;
//    [progressBar setNewProgress];
    return contentViewController;
}

-(UIViewController*)pageViewController:(UIPageViewController*)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger currentIndex = [[(TSCBookContentViewController *)viewController counterContents] intValue];
    if(currentIndex > [self.modelArray count] - 1){
        [self.view removeFromSuperview];
        TSCDrawViewController *drawView = [[TSCDrawViewController alloc] init];
        [self.view addSubview:drawView.view];
        return nil;
    }
    TSCBookContentViewController *contentViewController = [[TSCBookContentViewController alloc] init];
    contentViewController.counterContents = [NSString stringWithFormat:@"%@/%u",[[self.modelArray objectAtIndex:currentIndex] valueForKey:@"pageNumber"],pageCount];
    contentViewController.labelContents = [NSString stringWithFormat:@"%@",[[self.modelArray objectAtIndex:currentIndex] valueForKey:@"text"]];
//    progressBar.currentPage = currentIndex + 2;
//    [progressBar setNewProgress];
    return contentViewController;
}

#pragma mark - Delegate Methods for UIPageViewController

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
    
    
//    if(UIInterfaceOrientationIsLandscape(orientation))
//    {
//        // In landscape orientation: Set set the spine location to "mid" and the page view controller's view controllers array to contain two view controllers. If the current page is even, set it to contain the current and next view controllers; if it is odd, set the array to contain the previous and current view controllers.
//        NSArray *viewControllers = nil;
//        TSCBookContentViewController *currentViewController = [self.pageViewController.viewControllers objectAtIndex:0];
//        
//        NSUInteger currentIndex = [self.modelArray indexOfObject:[(TSCBookContentViewController *)currentViewController labelContents]];
//        if(currentIndex == 0 || currentIndex %2 == 0)
//        {
//            UIViewController *nextViewController = [self pageViewController:self.pageViewController viewControllerAfterViewController:currentViewController];
//            viewControllers = [NSArray arrayWithObjects:currentViewController, nextViewController, nil];
//        }
//        else
//        {
//            UIViewController *previousViewController = [self pageViewController:self.pageViewController viewControllerBeforeViewController:currentViewController];
//            viewControllers = [NSArray arrayWithObjects:previousViewController, currentViewController, nil];
//        }
//        //Now, set the viewControllers property of UIPageViewController
//        [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
//        
//        return UIPageViewControllerSpineLocationMid;
//    } else {
//        return UIPageViewControllerSpineLocationMid;
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
