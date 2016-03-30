//  GlobalVariables.h
//  ObjC-Context
//
//  Created by Frederick C. Lee on 3/29/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
// -----------------------------------------------------------------------------------------------------------------

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern CGFloat const gridLine;
extern CGFloat const innerBorder;
extern CGFloat const mark;
extern CGFloat const markMargin;
extern CGFloat const outerBorder;
extern CGFloat const platformMargin;
extern CGFloat const winningLine;
extern CGFloat const winningLineInset;

@interface GlobalVariables : NSObject
typedef struct Thickness {
    CGFloat gridLine;
    CGFloat innerBorder;
    CGFloat mark;
    CGFloat markMargin;
    CGFloat outerBorder;
    CGFloat platformMargin;
    CGFloat winningLine;
    CGFloat winningLineInset;
} date;

@end
