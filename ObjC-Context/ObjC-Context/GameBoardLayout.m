//  GameBoardLayout.m
//  ObjC-Context
//
//  Created by Frederick C. Lee on 3/30/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
// -----------------------------------------------------------------------------------------------------------------

#import "GameBoardLayout.h"

@interface GameBoardLayout()
@property(assign) CGRect frame;
@property(assign) NSUInteger marksPerAxis;
@end

@implementation GameBoardLayout
- (instancetype)initWithFrame: (CGRect)frame andMarksPerAxis:(NSUInteger)marksPerAxis {
    if (self = [super init]) {
        self.frame = frame;
        self.marksPerAxis = marksPerAxis;
    }
    return self;
}

// -----------------------------------------------------------------------------------------------------------------

- (CGRect)outerBorderRect {
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGFloat length = MIN(width, height);
    CGFloat x = (width/2-length/2); CGFloat y = (height/2 - length/2);
    return self.frame;
}

- (CGRect)innerBorderRect {
    return [self insetRect:[self outerBorderRect] byAmount:kOuterBorder];
}

- (CGRect)platformRect {
    return [self insetRect:[self outerBorderRect] byAmount:kInnerBorder];
}

// -----------------------------------------------------------------------------------------------------------------

- (CGPoint)bottomCenterOfRect:(CGRect)myRect{
    return CGPointMake(CGRectGetMidX(myRect), CGRectGetMaxY(myRect));
}

- (CGPoint)bottomLeftOfRect:(CGRect)myRect {
    return CGPointMake(CGRectGetMinX(myRect), CGRectGetMaxY(myRect));
}

- (CGPoint)bottomRightOfRect:(CGRect)myRect {
    return CGPointMake(CGRectGetMaxX(myRect), CGRectGetMaxY(myRect));
}

- (CGPoint)centerRectOfRect:(CGRect)myRect {
    return CGPointMake(CGRectGetMidX(myRect), CGRectGetMidY(myRect));
}

- (CGPoint)centerLeftOfRect:(CGRect)myRect {
    return CGPointMake(CGRectGetMinX(myRect), CGRectGetMidY(myRect));
}

- (CGPoint)centerRightLeftOfRect:(CGRect)myRect {
    return CGPointMake(CGRectGetMaxX(myRect), CGRectGetMidY(myRect));
}

- (CGPoint)topCenterOfRect:(CGRect)myRect {
    return CGPointMake(CGRectGetMidX(myRect), CGRectGetMinY(myRect));
}

- (CGPoint)topLeftOfRect:(CGRect)myRect {
    return CGPointMake(CGRectGetMinX(myRect), CGRectGetMinY(myRect));
}

- (CGPoint)topRightOfRect:(CGRect)myRect {
    return CGPointMake(CGRectGetMaxX(myRect), CGRectGetMinY(myRect));
}

// --------------------------------------------------------------------

- (CGRect)insetRect:(CGRect)myRect byAmount:(CGFloat)amount {
    return CGRectInset (myRect, amount, amount);
}


@end


