//
//  TSCViewController.m
//  TeamSpaceCadets
//
//  Created by Mary Orth on 12/3/12.
//  Copyright (c) 2012 RIT Space Cadets. All rights reserved.
//

// TO DO
// convert variables to ints (warnings?)
// send in array for editStickerBook and append data to url

#import "TSCViewController.h"
#import "TSCUtility.h"

@interface TSCViewController ()

@end

@implementation TSCViewController
@synthesize modelArray, pageViewController, progressBar;


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
    
//    int studentID = 1;
//    int stickerID = 1;
//    bool didPlace = true;
//    int xPos = 55;
//    int yPos = 43;
//    int scale = 2;
//    int orientation = -40;
    
    //NSLog(@"%@",[TSCUtility getProfile:studentID]);
    //NSLog(@"%@",[TSCUtility getDrawings:studentID]);
    //NSLog(@"%@",[TSCUtility getStickerBook:studentID]);
    //[TSCUtility editStickerBook:studentID forSticker:stickerID wasPlaced:didPlace withX:xPos withY:yPos stickerScale:scale stickerOrientation:orientation];
    
    
    
    //Instantiate a model array to keep page data in as well as the actual page view controller
    self.modelArray = [[NSMutableArray alloc] init];
    for (int i=1;i<=10;i++){
        [self.modelArray addObject:[NSString stringWithFormat:@"Page Number %d",i]];
    }
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource = self;
    
    //Set up initial view controller
    TSCBookContentViewController *contentViewController = [[TSCBookContentViewController alloc] initWithNibName:@"TSCBookContentViewController" bundle:nil];
    contentViewController.labelContents = [self.modelArray objectAtIndex:0];
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
    
    
    //Set Progress bar
    progressBar = [[TSCProgressViewController alloc] init];
    [self.view addSubview:progressBar.view];
    progressBar.currentPage = 1;
    progressBar.numPages = 10;
    [progressBar setNewProgress];
    CGRect pbrect = CGRectMake(260.0, 680.0, 200.0, 53.0);
    progressBar.view.frame = pbrect;
}

#pragma mark - Delegate Methods for UIPageViewController

-(UIViewController*)pageViewController:(UIPageViewController*)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger currentIndex = [self.modelArray indexOfObject:[(TSCBookContentViewController *)viewController labelContents]];
    if(currentIndex == 0){
        return nil;
    }
    TSCBookContentViewController *contentViewController = [[TSCBookContentViewController alloc] init];
    contentViewController.labelContents = [self.modelArray objectAtIndex:currentIndex - 1];
    progressBar.currentPage = currentIndex;
    [progressBar setNewProgress];
    return contentViewController;
}

-(UIViewController*)pageViewController:(UIPageViewController*)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger currentIndex = [self.modelArray indexOfObject:[(TSCBookContentViewController *)viewController labelContents]];
    if(currentIndex == [self.modelArray count] - 1){
        return nil;
    }
    TSCBookContentViewController *contentViewController = [[TSCBookContentViewController alloc] init];
    contentViewController.labelContents = [self.modelArray objectAtIndex:currentIndex + 1];
    progressBar.currentPage = currentIndex + 2;
    [progressBar setNewProgress];
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

//- (void)getProfile:(int)studentID {
//    //NSString *urlPrefix = @"http://spacecadets.cias.rit.edu/Application/";
//    
//    NSString *surl = @"http://spacecadets.cias.rit.edu/Application/mid.php?method=getProfile&a=profile&data=";
//    NSString *sID = [NSString stringWithFormat:@"%d",studentID];
//    int studID = [sID intValue];
//    NSString *appendedURL = [surl stringByAppendingString:sID];
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:appendedURL]];
//    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    NSMutableArray *results = [json JSONValue];
//    
//    NSLog(@"%@",results);
//    
//    NSString *sfirstName = [results valueForKey:@"firstName"];
//    NSString *slastName = [results valueForKey:@"lastName"];
//    NSURL *avatarURL = [results valueForKey:@"avatarURL"];
//    NSString *statement = [results valueForKey:@"statement"];
//    
//    NSLog(@"student first name = %@", sfirstName);
//    NSLog(@"student last name = %@", slastName);
//    NSLog(@"studentID = %d", studID);
//    NSLog(@"avatar's url = %@", avatarURL);
//    NSLog(@"student's statement = %@", statement);
//}
//
//- (void)getDrawings:(int)studentID {
//    //NSString *urlPrefix = @"http://spacecadets.cias.rit.edu/Application/";
//    
//    NSString *surl = @"http://spacecadets.cias.rit.edu/Application/mid.php?method=getDrawings&a=profile&data=";
//    NSString *sID = [NSString stringWithFormat:@"%d",studentID];
//    NSString *appendedURL = [surl stringByAppendingString:sID];
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:appendedURL]];
//    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    NSMutableArray *results = [json JSONValue];
//    
//    NSLog(@"%@",results);
//    
//    int numDrawings = [results count];
//    NSLog(@"student has %i drawings", numDrawings);
//    
//    //loop through each drawing student has (objectAtIndex)
//    for (int i=0; i < numDrawings; i++) {
//        NSString *sbookID = [[results objectAtIndex:i] valueForKey:@"bookID"];
//        int bookID = [sbookID intValue];
//        NSString *bookTitle = [[results objectAtIndex:i] valueForKey:@"bookTitle"];
//        NSURL *drawingURL = [[results objectAtIndex:i] valueForKey:@"drawingURL"];
//        NSString *spageNum = [[results objectAtIndex:i] valueForKey:@"pageNumber"];
//        int pageNum = [spageNum intValue];
//        
//        NSLog(@"drawing number %i", i+1);
//        NSLog(@"book ID = %d", bookID);
//        NSLog(@"book title = %@", bookTitle);
//        NSLog(@"drawing URL = %@", drawingURL);
//        NSLog(@"page number = %d", pageNum);
//    }
//}
//
//- (void)getStickerBook:(int)studentID {
//    //NSString *urlPrefix = @"http://spacecadets.cias.rit.edu/Application/";
//    
//    NSString *surl = @"http://spacecadets.cias.rit.edu/Application/mid.php?method=getStickerBook&a=profile&data=";
//    NSString *sID = [NSString stringWithFormat:@"%d",studentID];
//    NSString *appendedURL = [surl stringByAppendingString:sID];
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:appendedURL]];
//    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    NSMutableArray *results = [json JSONValue];
//    
//    NSLog(@"%@",results);
//    
//    int numStickers = [results count];
//    NSLog(@"student has %i stickers", numStickers);
//    
//    //loop through each drawing student has (objectAtIndex)
//    for (int i=0; i < numStickers; i++) {
//        NSString *sorientation = [[results objectAtIndex:i] valueForKey:@"orientation"];
//        int orientation = [sorientation intValue];
//        NSString *placed = [[results objectAtIndex:i] valueForKey:@"placed"];
//        NSString *sscale = [[results objectAtIndex:i] valueForKey:@"scale"];
//        int scale = [sscale intValue];
//        NSString *sstickerID = [[results objectAtIndex:i] valueForKey:@"stickerID"];
//        int stickerID = [sstickerID intValue];
//        NSString *stickerName = [[results objectAtIndex:i] valueForKey:@"stickerName"];
//        NSString *sxPos = [[results objectAtIndex:i] valueForKey:@"xPos"];
//        int xPos = [sxPos integerValue];
//        NSString *syPos = [[results objectAtIndex:i] valueForKey:@"yPos"];
//        int yPos = [syPos intValue];
//        
//        NSLog(@"sticker number %i", i+1);
//        NSLog(@"orientation = %d", orientation);
//        NSLog(@"scale = %d", scale);
//        NSLog(@"stickerID = %d", stickerID);
//        NSLog(@"sticker name = %@", stickerName);
//        NSLog(@"x position = %d", xPos);
//        NSLog(@"y position = %d", yPos);
//        NSLog(@"sticker was placed = %@", placed);
//    }
//}
//
//- (void)editStickerBook:(int)studentID
//             forSticker:(int)stickerID
//              wasPlaced:(bool)didPlace
//                  withX:(int)xPos
//                  withY:(int)yPos
//           stickerScale:(int)scale
//     stickerOrientation:(int)orientation {
//    
//    NSString *sstudentID = [NSString stringWithFormat:@"%d", studentID];
//    NSString *sstickerID = [NSString stringWithFormat:@"%d", stickerID];
//    NSString *sdidPlace = [NSString stringWithFormat:@"%@", didPlace ? @"true" : @"false"];
//    NSString *sxPos = [NSString stringWithFormat:@"%d", xPos];
//    NSString *syPos = [NSString stringWithFormat:@"%d", yPos];
//    NSString *sscale = [NSString stringWithFormat:@"%d", scale];
//    NSString *sorientation = [NSString stringWithFormat:@"%d", orientation];
//    
//    // spacecadets.cias.rit.edu/Application/mid.php?method=getStickerBook&a=profile&d=studentID|stickerID|placed|xPos|yPos|scale|orientation"
//    NSString *surl = @"http://spacecadets.cias.rit.edu/Application/mid.php?method=getStickerBook&a=profile&data=";
//    NSString *appendedURL = [NSString stringWithFormat:@"%@%@|%@|%@|%@|%@|%@|%@",surl,sstudentID,sstickerID,sdidPlace,sxPos,syPos,sscale,sorientation];
//    NSLog(@"%@", appendedURL);
//}

@end
