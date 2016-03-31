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

// ===========================================================================================================

@interface UIColor (ColorCategory)
+ (UIColor *)colorWithHexString:(NSString *)colorString;
+ (UIColor *)gridLineColor;
+ (UIColor *)innerBorderColor;
+ (UIColor *)outerBorderColor;
+ (UIColor *)markOColor;
+ (UIColor *)markXColor;
+ (UIColor *)platformColor;
+ (UIColor *)winningLineColor;
@end

// ===========================================================================================================

@interface GameContext:NSObject
+ (void)fillRect:(CGRect)rect withColor:(UIColor *)color;
@end

// ===========================================================================================================

@interface GlobalVariables : NSObject

@end
