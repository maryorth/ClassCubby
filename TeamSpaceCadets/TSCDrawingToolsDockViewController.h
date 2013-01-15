//
//  TSCDrawingToolsDockViewController.h
//  TeamSpaceCadets
//
//  Created by MATTHEW ZASO (RIT Student) on 1/13/13.
//  Copyright (c) 2013 RIT Space Cadets. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSCDrawingToolsDockViewController : UIViewController{
    

    

    
    NSMutableData *receivedData;
}

@property (weak, nonatomic) IBOutlet UIImageView *toolsArrow;

@property bool isOpened;


@property CGFloat red;
@property CGFloat blue;
@property CGFloat green;
@property CGFloat brush;
@property CGFloat opacity;
@property UIImage *texture;
@property NSString *textureName;

@property (weak, nonatomic) IBOutlet UIButton *redButton;
@property (weak, nonatomic) IBOutlet UIButton *yellowButton;
@property (weak, nonatomic) IBOutlet UIButton *tealButton;
@property (weak, nonatomic) IBOutlet UIButton *lightblueButton;
@property (weak, nonatomic) IBOutlet UIButton *pinkButton;
@property (weak, nonatomic) IBOutlet UIButton *brownButton;
@property (weak, nonatomic) IBOutlet UIButton *greyButton;
@property (weak, nonatomic) IBOutlet UIButton *orangeButton;
@property (weak, nonatomic) IBOutlet UIButton *greenButton;
@property (weak, nonatomic) IBOutlet UIButton *blueButton;
@property (weak, nonatomic) IBOutlet UIButton *purpleButton;
@property (weak, nonatomic) IBOutlet UIButton *tanButton;
@property (weak, nonatomic) IBOutlet UIButton *whiteButton;
@property (weak, nonatomic) IBOutlet UIButton *blackButton;
@property (weak, nonatomic) IBOutlet UIButton *brushButton;
@property (weak, nonatomic) IBOutlet UIButton *pencilButton;
@property (weak, nonatomic) IBOutlet UIButton *penButton;


-(IBAction)colorSelected:(id)sender;
- (IBAction)brushSelected:(id)sender;
- (IBAction)pencilSelected:(id)sender;
- (IBAction)penSelected:(id)sender;

@end
