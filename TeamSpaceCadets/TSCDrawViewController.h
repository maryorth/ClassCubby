//
//  TSCDrawViewController.h
//  TeamSpaceCadets
//
//  Created by Mary Orth on 12/18/12.
//  Copyright (c) 2012 RIT Space Cadets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSCDrawingToolsDockViewController.h"

@interface TSCDrawViewController : UIViewController{
    
    CGPoint lastPoint;
    BOOL mouseSwiped;
}
@property (weak, nonatomic) IBOutlet UIImageView *tempDrawImage;
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;

@property TSCDrawingToolsDockViewController *toolsDock;


@end
