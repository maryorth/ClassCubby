//
//  TSCUtility.h
//  TeamSpaceCadets
//
//  Created by Mary Orth on 12/7/12.
//  Copyright (c) 2012 RIT Space Cadets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBJson.h"

@interface TSCUtility : NSObject
+ (NSMutableArray *)getProfile:(int)studentID;
+ (NSMutableArray *)getDrawings:(int)studentID;
//+ (NSMutableArray *)getStickerBook:(int)studentID;
+ (void)editStickerBook:(int)studentID
             forSticker:(int)stickerID
              wasPlaced:(bool)didPlace
                  withX:(int)xPos
                  withY:(int)yPos
           stickerScale:(int)scale
     stickerOrientation:(int)orientation;
+ (NSMutableArray *)getTest:(int)bookID;
@end
