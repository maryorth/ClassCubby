//
//  TSCCustomFontVAGRoundedLight.m
//  TeamSpaceCadets
//
//  Created by MATTHEW ZASO (RIT Student) on 1/12/13.
//  Copyright (c) 2013 RIT Space Cadets. All rights reserved.
//

#import "TSCCustomFontVAGRoundedLight.h"

@implementation TSCCustomFontVAGRoundedLight

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.font = [UIFont fontWithName:@"VAGRoundedLightSSi" size:self.font.pointSize];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
