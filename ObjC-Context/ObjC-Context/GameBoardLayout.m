//  GameBoardLayout.m
//  ObjC-Context
//
//  Created by Frederick C. Lee on 3/30/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
// -----------------------------------------------------------------------------------------------------------------

#import "GameBoardLayout.h"


typedef struct {
    CGPoint startPoint;
    CGPoint endPoint;
} LineStruct;


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

#pragma mark - Gridlines

- (void)gridLines {
    LineStruct line;
    
//    CGFloat cellLength = self.platformRect.size.width/self.marksPerAxis;
//    NSMutableArray *lineNumbers = [NSMutableArray arrayWithCapacity:_marksPerAxis];
//    
//    
//    line.startPoint = CGPointMake(2,3);
//    line.endPoint = CGPointMake(5,6);
//    
//
//    NSValue *structValue = [NSValue value:&line withObjCType:@encode(LineStruct)];
//    NSArray *lineArray = [NSArray arrayWithObject:structValue];
    
//    let x = self.platformRect.minX + CGFloat(lineNumber) * cellLength
//    CGFloat x = self.platformRect.minX + CGFloat(lineNumbers) * cellLength
    
    
}

//lazy var gridLines: [Line] = {
//    let
//    cellLength    = self.platformRect.width / CGFloat(self.marksPerAxis),
//    lineNumbers   = 1..<self.marksPerAxis,
//    verticalLines = lineNumbers.map { lineNumber -> Line in
//        let x = self.platformRect.minX + CGFloat(lineNumber) * cellLength
//        return Line(
//                    startPoint: CGPoint(x: x, y: self.platformRect.minY),
//                    endPoint:   CGPoint(x: x, y: self.platformRect.maxY))
//    },




//    horizontalLines = lineNumbers.map { lineNumber -> Line in
//        let y = self.platformRect.minY + CGFloat(lineNumber) * cellLength
//        return Line(
//                    startPoint: CGPoint(x: self.platformRect.minX, y: y),
//                    endPoint:   CGPoint(x: self.platformRect.maxX, y: y))
//    }
//    return verticalLines + horizontalLines
//}()

// -----------------------------------------------------------------------------------------------------------------
#pragma mark - Rect methods


- (CGRect) outerBorderRect {
    [self gridLines];
    return self.frame;
}

- (CGRect)innerBorderRect {
    return [self insetRect:[self outerBorderRect] byAmount:kOuterBorder];
}

- (CGRect)platformRect {
    return [self insetRect:[self innerBorderRect] byAmount:kInnerBorder];
}

// -----------------------------------------------------------------------------------------------------------------
#pragma mark -

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


