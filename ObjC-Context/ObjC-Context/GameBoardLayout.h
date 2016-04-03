//  GameBoardLayout.h
//  ObjC-Context
//
//  Created by Frederick C. Lee on 3/30/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
// -----------------------------------------------------------------------------------------------------------------

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GameBoardLayout : NSObject
- (instancetype)initWithFrame: (CGRect)frame andMarksPerAxis:(NSUInteger)marksPerAxis;
- (CGRect)outerBorderRect;
- (CGRect)innerBorderRect;
- (CGRect)platformRect;
- (NSArray *)gridLines;

+ (CGPoint)bottomCenterOfRect:(CGRect)myRect;
+ (CGPoint)bottomLeftOfRect:(CGRect)myRect;
+ (CGPoint)bottomRightOfRect:(CGRect)myRect;
+ (CGPoint)centerRectOfRect:(CGRect)myRect;
+ (CGPoint)centerLeftOfRect:(CGRect)myRect;
+ (CGPoint)centerRightLeftOfRect:(CGRect)myRect;
+ (CGPoint)topCenterOfRect:(CGRect)myRect;
+ (CGPoint)topLeftOfRect:(CGRect)myRect;
+ (CGPoint)topRightOfRect:(CGRect)myRect;
+ (CGRect)insetRect:(CGRect)myRect byAmount:(CGFloat)amount;
@end
