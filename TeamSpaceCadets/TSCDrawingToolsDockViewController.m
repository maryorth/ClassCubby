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

@synthesize isOpened,toolsArrow, redButton, yellowButton, tealButton, lightblueButton, pinkButton, brownButton, greyButton, orangeButton, greenButton, blueButton, purpleButton, tanButton, whiteButton, blackButton, brushButton, penButton, pencilButton, red, green, blue, brush, opacity, texture, textureName;

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
    
    texture = [UIImage imageNamed:@"brushBlack.png"];
    textureName = @"brush";
    
}
- (IBAction)brushSelected:(id)sender{
    
    //set to brush
    
    texture = [UIImage imageNamed:@"brushBlack.png"];
    textureName = @"brush";
}
- (IBAction)pencilSelected:(id)sender{
    texture = [UIImage imageNamed:@"pencilBlack.png"];
     textureName = @"pencil";
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

/*- (void)updateTextureWithColor{
    
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
}*/

//changing color
- (IBAction)colorSelected:(id)sender {
    
    UIButton * PressedButton = (UIButton*)sender;
    
    switch(PressedButton.tag)
    {
            //red
        case 0:
            if (textureName == @"brush") {
                texture = [UIImage imageNamed:@"brushRed.png"];
            }
            if (textureName == @"pencil") {
                texture = [UIImage imageNamed:@"pencilRed.png"];
            }
            break;
            //yelow
        case 1:
            if (textureName == @"brush") {
                texture = [UIImage imageNamed:@"brushYellow.png"];
            }
            if (textureName == @"pencil") {
                texture = [UIImage imageNamed:@"pencilYellow.png"];
            }
            break;
            //teal
        case 2:
            if (textureName == @"brush") {
                texture = [UIImage imageNamed:@"brushTeal.png"];
            }
            if (textureName == @"pencil") {
                texture = [UIImage imageNamed:@"pencilTeal.png"];
            }
            break;
            //lightblue
        case 3:
            if (textureName == @"brush") {
                texture = [UIImage imageNamed:@"brushLightBlue.png"];
            }
            if (textureName == @"pencil") {
                texture = [UIImage imageNamed:@"pencilLightBlue.png"];
            }
            break;
            //pink
        case 4:
            if (textureName == @"brush") {
                texture = [UIImage imageNamed:@"brushPink.png"];
            }
            if (textureName == @"pencil") {
                texture = [UIImage imageNamed:@"pencilPink.png"];
            }
            break;
            //brown
        case 5:
            if (textureName == @"brush") {
                texture = [UIImage imageNamed:@"brushBrown.png"];
            }
            if (textureName == @"pencil") {
                texture = [UIImage imageNamed:@"pencilBrown.png"];
            }
            break;
            //grey
        case 6:
            if (textureName == @"brush") {
                texture = [UIImage imageNamed:@"brushGrey.png"];
            }
            if (textureName == @"pencil") {
                texture = [UIImage imageNamed:@"pencilGrey.png"];
            }
            break;
            //orange
        case 7:
            if (textureName == @"brush") {
                texture = [UIImage imageNamed:@"brushOrange.png"];
            }
            if (textureName == @"pencil") {
                texture = [UIImage imageNamed:@"pencilOrange.png"];
            }
            break;
            //green
        case 8:
            if (textureName == @"brush") {
                texture = [UIImage imageNamed:@"brushGreen.png"];
            }
            if (textureName == @"pencil") {
                texture = [UIImage imageNamed:@"pencilGreen.png"];
            }
            break;
            //darkblue
        case 9:
            if (textureName == @"brush") {
                texture = [UIImage imageNamed:@"brushDarkBlue.png"];
            }
            if (textureName == @"pencil") {
                texture = [UIImage imageNamed:@"pencilDarkBlue.png"];
            }
            break;
            //purple
        case 10:
            if (textureName == @"brush") {
                texture = [UIImage imageNamed:@"brushPurple.png"];
            }
            if (textureName == @"pencil") {
                texture = [UIImage imageNamed:@"pencilPurple.png"];
            }
            break;
            //tan
        case 11:
            if (textureName == @"brush") {
                texture = [UIImage imageNamed:@"brushTan.png"];
            }
            if (textureName == @"pencil") {
                texture = [UIImage imageNamed:@"pencilTan.png"];
            }
            break;
            //white
        case 12:
            if (textureName == @"brush") {
                texture = [UIImage imageNamed:@"brushWhite.png"];
            }
            if (textureName == @"pencil") {
                texture = [UIImage imageNamed:@"pencilWhite.png"];
            }
            break;
            //black
        case 13:
            if (textureName == @"brush") {
                texture = [UIImage imageNamed:@"brushBlack.png"];
            }
            if (textureName == @"pencil") {
                texture = [UIImage imageNamed:@"pencilBlack.png"];
            }
            break;
    }
    //[self updateTextureWithColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
