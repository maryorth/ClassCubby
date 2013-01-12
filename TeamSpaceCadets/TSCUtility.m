//
//  TSCUtility.m
//  TeamSpaceCadets
//
//  Created by Mary Orth on 12/7/12.
//  Copyright (c) 2012 RIT Space Cadets. All rights reserved.
//

#import "TSCUtility.h"

@implementation TSCUtility

+ (NSMutableArray *)getProfile:(int)studentID {
    //NSString *urlPrefix = @"http://spacecadets.cias.rit.edu/Application/";
    
    NSString *surl = @"http://spacecadets.cias.rit.edu/Application/mid.php?method=getProfile&a=profile&data=";
    NSString *sID = [NSString stringWithFormat:@"%d",studentID];
    NSString *appendedURL = [surl stringByAppendingString:sID];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:appendedURL]];
    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSMutableArray *results = [json JSONValue];
    
    NSString *sfirstName = [results valueForKey:@"firstName"];
    NSString *slastName = [results valueForKey:@"lastName"];
    NSURL *avatarURL = [results valueForKey:@"avatarURL"];
    NSString *statement = [results valueForKey:@"statement"];
    
    NSMutableArray *returnProfile = [[NSMutableArray alloc]init];
    [returnProfile addObject:(NSString *)sfirstName];
    [returnProfile addObject:(NSString *)slastName];
    [returnProfile addObject:(NSString *)sID];
    [returnProfile addObject:(NSString *)avatarURL];
    [returnProfile addObject:(NSString *)statement];
    
    return returnProfile;
}

+ (NSMutableArray *)getDrawings:(int)studentID {
    //NSString *urlPrefix = @"http://spacecadets.cias.rit.edu/Application/";
    
    NSString *surl = @"http://spacecadets.cias.rit.edu/Application/mid.php?method=getDrawings&a=profile&data=";
    NSString *sID = [NSString stringWithFormat:@"%d",studentID];
    NSString *appendedURL = [surl stringByAppendingString:sID];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:appendedURL]];
    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSMutableArray *results = [json JSONValue];
    
    int numDrawings = [results count];
    
    NSMutableArray *returnDrawings = [[NSMutableArray alloc]init];
    
    //loop through each drawing student has (objectAtIndex)
    for (int i=0; i < numDrawings; i++) {
        NSMutableArray *tempArray = [[NSMutableArray alloc]init];
        
        NSString *bookID = [[results objectAtIndex:i] valueForKey:@"bookID"];
        NSString *bookTitle = [[results objectAtIndex:i] valueForKey:@"bookTitle"];
        NSURL *drawingURL = [[results objectAtIndex:i] valueForKey:@"drawingURL"];
        NSString *pageNum = [[results objectAtIndex:i] valueForKey:@"pageNumber"];
        
        [tempArray addObject:(NSString *)bookID];
        [tempArray addObject:(NSString *)bookTitle];
        [tempArray addObject:(NSURL *)drawingURL];
        [tempArray addObject:(NSString *)pageNum];
        
        [returnDrawings addObject:(NSMutableArray *)tempArray];
    }
    
    return returnDrawings;
}

+ (NSMutableArray *)getTest:(int)bookID
{
    int thisBookID = bookID;
    NSString *surl = @"http://spacecadets.cias.rit.edu/Application/mid.php?method=getQuestions&a=test&data=";
    NSString *stringBookID = [NSString stringWithFormat:@"%d",thisBookID];
    NSString *appendedURL = [surl stringByAppendingString:stringBookID];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:appendedURL]];
    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSMutableArray *results = [json JSONValue];
    NSLog(@"results= %@", results);
    
   int allQuestionsCount = [results count];
    
    NSLog(@"%@",results);
    
    NSMutableArray *returnTest = [[NSMutableArray alloc]init];
    
    //loop through each question in test
    for (int i=0; i < allQuestionsCount; i++) {
        NSMutableArray *tempArray = [[NSMutableArray alloc]init];
        
        NSString *questionType = [[results objectAtIndex:i] valueForKey:@"questionType"];
        NSString *questionText = [[results objectAtIndex:i] valueForKey:@"questionText"];
        NSString *answer = [[results objectAtIndex:i] valueForKey:@"answer"];
        
        NSLog(@"questionType = %@",questionType);
        NSLog(@"questionText = %@",questionText);
        NSLog(@"answer = %@",answer);
        
        if ([questionType isEqualToString:@"mc"]) {
            NSMutableArray *options = [[results objectAtIndex:i] valueForKey:@"options"];
            [tempArray addObject:(NSMutableArray *)options];
            NSLog(@"options = %@",options);
        }
        
        [tempArray addObject:(NSString *)questionType];
        [tempArray addObject:(NSString *)questionText];
        [tempArray addObject:(NSString *)answer];
        
        [returnTest addObject:(NSMutableArray *)tempArray];
    }
    
    return results;
    
}

+ (NSMutableArray *)getBook:(int)bookID
{
    int thisBookID = bookID;
    NSString *surl = @"http://spacecadets.cias.rit.edu/Application/mid.php?method=getBook&a=book&data=";
    NSString *stringBookID = [NSString stringWithFormat:@"%d",thisBookID];
    NSString *appendedURL = [surl stringByAppendingString:stringBookID];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:appendedURL]];
    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSMutableArray *results = [json JSONValue];
    NSLog(@"results= %@", results);
    
    return results;
}

+ (void)editStickerBook:(int)studentID
             forSticker:(int)stickerID
              wasPlaced:(bool)didPlace
                  withX:(int)xPos
                  withY:(int)yPos
           stickerScale:(int)scale
     stickerOrientation:(int)orientation {
    
    NSString *sstudentID = [NSString stringWithFormat:@"%d", studentID];
    NSString *sstickerID = [NSString stringWithFormat:@"%d", stickerID];
    NSString *sdidPlace = [NSString stringWithFormat:@"%@", didPlace ? @"true" : @"false"];
    NSString *sxPos = [NSString stringWithFormat:@"%d", xPos];
    NSString *syPos = [NSString stringWithFormat:@"%d", yPos];
    NSString *sscale = [NSString stringWithFormat:@"%d", scale];
    NSString *sorientation = [NSString stringWithFormat:@"%d", orientation];
    
    // spacecadets.cias.rit.edu/Application/mid.php?method=getStickerBook&a=profile&d=studentID|stickerID|placed|xPos|yPos|scale|orientation"
    NSString *surl = @"http://spacecadets.cias.rit.edu/Application/mid.php?method=getStickerBook&a=profile&data=";
    NSString *appendedURL = [NSString stringWithFormat:@"%@%@|%@|%@|%@|%@|%@|%@",surl,sstudentID,sstickerID,sdidPlace,sxPos,syPos,sscale,sorientation];
    NSLog(@"%@", appendedURL);
}

@end
