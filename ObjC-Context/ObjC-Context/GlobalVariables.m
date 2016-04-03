//  GlobalVariables.m
//  ObjC-Context
//
//  Created by Frederick C. Lee on 3/29/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
// -----------------------------------------------------------------------------------------------------------------

#import "GlobalVariables.h"

CGFloat const kGridLine = 4.0;
CGFloat const kOuterBorder = 4.0;
CGFloat const kInnerBorder = 4.0;
CGFloat const kMark = 16.0;
CGFloat const kMarkMargin = 20.0;
CGFloat const kPlatformMargin = 16.0;
CGFloat const kWinningLine = 8.0;
CGFloat const kWinningLineInset = 8.0;

@implementation NSArray(Map)
- (NSArray *)mapObjectsUsingBlock:(arrayObject)block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count]];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [result addObject:block(obj, idx)];
    }];
    return result;
}
@end

// ===========================================================================================================

@implementation UIColor (ColorCategory)

+ (UIColor *)colorWithHexString:(NSString *)colorString {
    colorString = [colorString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    
    if (colorString.length == 3)
        colorString = [NSString stringWithFormat:@"%c%c%c%c%c%c",
                       [colorString characterAtIndex:0], [colorString characterAtIndex:0],
                       [colorString characterAtIndex:1], [colorString characterAtIndex:1],
                       [colorString characterAtIndex:2], [colorString characterAtIndex:2]];
    
    if (colorString.length == 6) {
        int r, g, b;
        sscanf([colorString UTF8String], "%2x%2x%2x", &r, &g, &b);
        return [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0];
    } else if (colorString.length == 8) {
        int r, g, b, a;
        sscanf([colorString UTF8String], "%2x%2x%2x%2x", &r, &g, &b, &a);
        return [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:(a/255.0)];
    }
    return nil;
}

+ (UIColor *)gridLineColor {
    return [UIColor darkGrayColor];
}

+ (UIColor *)innerBorderColor {
    return [UIColor darkGrayColor];
}

+ (UIColor *)markOColor {
    return [UIColor blueColor];
}

+ (UIColor *)markXColor {
    return [UIColor greenColor];
}

+ (UIColor *)outerBorderColor {
    return [UIColor whiteColor];
}

+ (UIColor *)platformColor {
    return [UIColor whiteColor];
}

+ (UIColor *)winningLineColor {
    return [UIColor redColor];
}
@end

// ===========================================================================================================

@implementation GameContext

+ (void)strokeLineFrom:(CGPoint)from to:(CGPoint)to withColor:(UIColor *)color havingWidth:(CGFloat)width andLineCap:(CGLineCap)lineCap {
   CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, width);
    CGContextSetLineCap(context, lineCap);
    CGContextMoveToPoint(context, from.x, from.y);
    CGContextAddLineToPoint(context, to.x, to.y);
    CGContextStrokePath(context);
}

+ (void)fillRect:(CGRect)rect withColor:(UIColor *)color {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
}

+ (void)strokeRect:(CGRect)rect withColor:(UIColor *)color havingWidth:(CGFloat)width {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, width);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextAddRect(context, rect);
    CGContextStrokePath(context);
}

+ (void)strokeEllipseInRect:(CGRect)rect withColor:(UIColor *)color havingWidth:(CGFloat)width {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, width);
    CGContextStrokePath(context);
}


@end

// ===========================================================================================================

@implementation GlobalVariables

@end


