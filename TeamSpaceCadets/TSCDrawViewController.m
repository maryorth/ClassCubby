//
//  TSCDrawViewController.m
//  TeamSpaceCadets
//
//  Created by Mary Orth on 12/18/12.
//  Copyright (c) 2012 RIT Space Cadets. All rights reserved.
//

#import "TSCDrawViewController.h"
#import "TSCDrawingToolsDockViewController.h"

@interface TSCDrawViewController ()

@end

@implementation TSCDrawViewController;
@synthesize toolsDock;
@synthesize tempDrawImage;



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
    
    
    

    
    
    //standard
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Add tools dock
    self.toolsDock = [[TSCDrawingToolsDockViewController alloc] initWithNibName:@"TSCDrawingToolsDockViewController" bundle:nil];
    [self.view addSubview:toolsDock.view];
    
    // Position tools dock
    CGRect dockViewRect = CGRectMake(0.0, 705.0, 750.0, 500.0);
    toolsDock.view.frame = dockViewRect;
    
    
    
    
    
}




// Brush hits paper
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    lastPoint = [touch locationInView:self.tempDrawImage];
    
    
}

// Get the current touch point and then draw a line from lastPoint to currentPoint
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.tempDrawImage];
    
    
    
    UIGraphicsBeginImageContext(self.tempDrawImage.frame.size);
    [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.tempDrawImage.frame.size.width, self.tempDrawImage.frame.size.height)];
    
    
    //Adding an Image to brush-----!!!
    UIImage *texture = toolsDock.texture;
    CGPoint vector = CGPointMake(currentPoint.x - lastPoint.x, currentPoint.y - lastPoint.y);
    CGFloat distance = hypotf(vector.x, vector.y);
    vector.x /= distance;
    vector.y /= distance;
    for (CGFloat i = 0; i < distance; i += 1.0f) {
        CGPoint p = CGPointMake(lastPoint.x + i * vector.x, lastPoint.y + i * vector.y);
        [texture drawAtPoint:p blendMode:kCGBlendModeNormal alpha:1.0f];
    }
    
    //comment block below to enable texture brush.
    
    
    //start standard brush
    /*CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), toolsDock.brush);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), toolsDock.red, toolsDock.green, toolsDock.blue, 1.0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);
    */
    //CGContextSetRGBFillColor(UIGraphicsGetCurrentContext(), red, green, blue, 1.0);
    //end standard brush
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    
    self.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.tempDrawImage setAlpha:toolsDock.opacity];
    UIGraphicsEndImageContext();
    
    lastPoint = currentPoint;
}

// Check if mouse was swiped
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(!mouseSwiped) {
        UIGraphicsBeginImageContext(self.tempDrawImage.frame.size);
        [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.tempDrawImage.frame.size.width, self.tempDrawImage.frame.size.height)];
        
        //attempting to add a texture ----
        //UIColor *pattern = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pattern.png"]];
        //CGColorRef fillColor = [pattern CGColor];
        //CGColorRef strokeColor = [pattern CGColor];
        
        
        
        //attempting to add a texture --
        //CGContextSetStrokeColorWithColor(UIGraphicsGetCurrentContext(), strokeColor);
        //CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(), fillColor);
        UIImage *textureStandAlone = toolsDock.texture;
        //CGPoint vector = CGPointMake(lastPoint.x,lastPoint.y);
        //CGFloat distance = hypotf(vector.x, vector.y);
        //vector.x /= distance;
        //vector.y /= distance;
       
           CGPoint p = CGPointMake(lastPoint.x, lastPoint.y);
            [textureStandAlone drawAtPoint:p blendMode:kCGBlendModeNormal alpha:1.0f];

        //CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        //CGContextSetLineWidth(UIGraphicsGetCurrentContext(), toolsDock.brush);
        //CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), toolsDock.red, toolsDock.green, toolsDock.blue, toolsDock.opacity);
        //CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        //CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        self.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    UIGraphicsBeginImageContext(self.mainImage.frame.size);
    [self.mainImage.image drawInRect:CGRectMake(0, 0, self.mainImage.frame.size.width, self.mainImage.frame.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
    [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.tempDrawImage.frame.size.width, self.tempDrawImage.frame.size.height) blendMode:kCGBlendModeNormal alpha:toolsDock.opacity];
    self.mainImage.image = UIGraphicsGetImageFromCurrentImageContext();
    self.tempDrawImage.image = nil;
    UIGraphicsEndImageContext();
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
