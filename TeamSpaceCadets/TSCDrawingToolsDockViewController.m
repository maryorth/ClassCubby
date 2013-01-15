//
//  TSCDrawingToolsDockViewController.m
//  TeamSpaceCadets
//
//  Created by MATTHEW ZASO (RIT Student) on 1/13/13.
//  Copyright (c) 2013 RIT Space Cadets. All rights reserved.
//

#import "TSCDrawingToolsDockViewController.h"

@interface TSCDrawingToolsDockViewController ()

@end

@implementation TSCDrawingToolsDockViewController

@synthesize isOpened,toolsArrow, redButton, yellowButton, tealButton, lightblueButton, pinkButton, brownButton, greyButton, orangeButton, greenButton, blueButton, purpleButton, tanButton, whiteButton, blackButton, brushButton, penButton, pencilButton, red, green, blue, brush, opacity, texture;

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
    
    //drawing part:
    
    red = 0.0/255.0;
    green = 0.0/255.0;
    blue = 0.0/255.0;
    brush =  10.0;
    opacity = 1.0;
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Set isOpened to false;
    isOpened = false;
    
    //Set tools arrow orientation
    toolsArrow.transform = CGAffineTransformMakeRotation(M_PI);
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleTap];
    
    texture = [UIImage imageNamed:@"pattern.png"];
}
- (IBAction)brushSelected:(id)sender{
    
    //set to brush
    
    texture = [UIImage imageNamed:@"pattern.png"];
}
- (IBAction)pencilSelected:(id)sender{
    texture = [UIImage imageNamed:@"pattern2.png"];
}
- (IBAction)penSelected:(id)sender{
    texture = [UIImage imageNamed:@"pattern3.png"];
}
- (void)handleSingleTap:(UIGestureRecognizer *)recognizer {
    if (!isOpened){
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.4];
        float xPos = self.view.frame.origin.x;
        float yPos = self.view.frame.origin.y - 180.0;
        float width = self.view.frame.size.width;
        float height = self.view.frame.size.height;
        
        self.view.frame = CGRectMake(xPos,yPos,width,height);
        [UIView commitAnimations];
        
        isOpened = true;
        
        //Set tools arrow orientation
        toolsArrow.transform = CGAffineTransformMakeRotation(0);
    } else {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.4];
        float xPos = self.view.frame.origin.x;
        float yPos = self.view.frame.origin.y + 180.0;
        float width = self.view.frame.size.width;
        float height = self.view.frame.size.height;
        
        self.view.frame = CGRectMake(xPos,yPos,width,height);
        [UIView commitAnimations];
        
        isOpened = false;
        //Set tools arrow orientation
        toolsArrow.transform = CGAffineTransformMakeRotation(M_PI);
    }
}

- (void)updateTextureWithColor{
    
    // load the image
    //NSString *name = @"badge.png";
    UIImage *img = texture;
    //uiimage texture property brought in
    
    
    // begin a new image context, to draw our colored image onto
    UIGraphicsBeginImageContext(img.size);
    
    // get a reference to that context we created
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // set the fill color
    [[UIColor colorWithRed:red green:green blue:blue alpha:1.0] setFill];
    
    // translate/flip the graphics context (for transforming from CG* coords to UI* coords
    CGContextTranslateCTM(context, 0, img.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // set the blend mode to color burn, and the original image
    CGContextSetBlendMode(context, kCGBlendModeColor);
    CGRect rect = CGRectMake(0, 0, img.size.width, img.size.height);
    CGContextDrawImage(context, rect, img.CGImage);
    
    // set a mask that matches the shape of the image, then draw (color burn) a colored rectangle
    CGContextClipToMask(context, rect, img.CGImage);
    CGContextAddRect(context, rect);
    CGContextDrawPath(context,kCGPathFill);
    
    // generate a new UIImage from the graphics context we drew onto
    UIImage *coloredImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //set texture to colored image
    //return coloredImg;
    texture = coloredImg;
}

//changing color
- (IBAction)colorSelected:(id)sender {
    
    UIButton * PressedButton = (UIButton*)sender;
    
    switch(PressedButton.tag)
    {
            //red
        case 0:
            red = 220.0/255.0;
            green = 40.0/255.0;
            blue = 58.0/255.0;
            break;
            //yelow
        case 1:
            red = 244.0/255.0;
            green = 200.0/255.0;
            blue = 26.0/255.0;
            break;
            //teal
        case 2:
            red = 0.0/255.0;
            green = 216.0/255.0;
            blue = 182.0/255.0;
            break;
            //lightblue
        case 3:
            red = 45.0/255.0;
            green = 189.0/255.0;
            blue = 231.0/255.0;
            break;
            //pink
        case 4:
            red = 229.0/255.0;
            green = 87.0/255.0;
            blue = 171.0/255.0;
            break;
            //brown
        case 5:
            red = 166.0/255.0;
            green = 109.0/255.0;
            blue = 77.0/255.0;
            break;
            //grey
        case 6:
            red = 122.0/255.0;
            green = 122.0/255.0;
            blue = 122.0/255.0;
            break;
            //orange
        case 7:
            red = 255.0/255.0;
            green = 109.0/255.0;
            blue = 39.0/255.0;
            break;
            //green
        case 8:
            red = 24.0/255.0;
            green = 155.0/255.0;
            blue = 42.0/255.0;
            break;
            //darkblue
        case 9:
            red = 0.0/255.0;
            green = 79.0/255.0;
            blue = 156.0/255.0;
            break;
            //purple
        case 10:
            red = 149.0/255.0;
            green = 66.0/255.0;
            blue = 211.0/255.0;
            break;
            //tan
        case 11:
            red = 238.0/255.0;
            green = 196.0/255.0;
            blue = 161.0/255.0;
            break;
            //white
        case 12:
            red = 255.0/255.0;
            green = 255.0/255.0;
            blue = 255.0/255.0;
            break;
            //black
        case 13:
            red = 0.0/255.0;
            green = 0.0/255.0;
            blue = 0.0/255.0;
            break;
    }
    [self updateTextureWithColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
