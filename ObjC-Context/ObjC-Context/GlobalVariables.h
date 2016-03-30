//  GlobalVariables.h
//  ObjC-Context
//
//  Created by Frederick C. Lee on 3/29/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
// -----------------------------------------------------------------------------------------------------------------

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern CGFloat const kGridLine;
extern CGFloat const kInnerBorder;
extern CGFloat const kMark;
extern CGFloat const kMarkMargin;
extern CGFloat const kOuterBorder;
extern CGFloat const kPlatformMargin;
extern CGFloat const kWinningLine;
extern CGFloat const kWinningLineInset;

// ...probably don't need this struct:
extern struct Thickness {
    CGFloat gridLine;
    CGFloat innerBorder;
    CGFloat mark;
    CGFloat markMargin;
    CGFloat outerBorder;
    CGFloat platformMargin;
    CGFloat winningLine;
    CGFloat winningLineInset;
} thickness;

// ===========================================================================================================

@interface UIColor (ColorCategory)
+ (UIColor *)colorWithHexString:(NSString *)colorString;
+ (UIColor *)gridLineColor;
+ (UIColor *)innerBorderColor;
+ (UIColor *)markOColor;
+ (UIColor *)markXColor;
+ (UIColor *)outerBorderColor;
+ (UIColor *)platformColor;
+ (UIColor *)winningLineColor;
@end

// ===========================================================================================================

@interface GlobalVariables : NSObject

@end
