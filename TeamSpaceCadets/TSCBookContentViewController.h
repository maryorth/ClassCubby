//
//  TSCBookContentViewController.h
//  TeamSpaceCadets
//
//  Created by Student on 12/15/12.
//  Copyright (c) 2012 RIT Space Cadets. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSCBookContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *pageLabel;
@property (weak, nonatomic) IBOutlet UILabel *pageCounter;
@property (strong, nonatomic) NSString *labelContents;
@property (strong, nonatomic) NSString *counterContents;
@end
