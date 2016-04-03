//  GameBoardLayout.m
//  ObjC-Context
//
//  Created by Frederick C. Lee on 3/30/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
// -----------------------------------------------------------------------------------------------------------------

#import "GameBoardLayout.h"
#import "GlobalVariables.h"

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

- (NSArray *)gridLines {
    LineStruct verticalLine, horizontalLine;
    
    CGFloat cellLength = self.platformRect.size.width/self.marksPerAxis;
    
    NSMutableArray *verticalLines = [NSMutableArray arrayWithCapacity:_marksPerAxis];
    NSMutableArray *horizontalLines = [NSMutableArray arrayWithCapacity:_marksPerAxis];
    
    for (CGFloat lineNumber = 1; lineNumber < 3; lineNumber++) {
        CGFloat x = CGRectGetMinX(self.platformRect) + lineNumber * cellLength;
        verticalLine.startPoint = CGPointMake(x,CGRectGetMinY(self.platformRect));
        verticalLine.endPoint = CGPointMake(x,CGRectGetMaxY(self.platformRect));
        NSValue *structValue = [NSValue value:&verticalLine withObjCType:@encode(LineStruct)];
        [verticalLines addObject:structValue];
    }
    
    for (CGFloat lineNumber = 1; lineNumber < 3; lineNumber++) {
        CGFloat y = CGRectGetMinY(self.platformRect) + lineNumber * cellLength;
        horizontalLine.startPoint = CGPointMake(CGRectGetMinX(self.platformRect),y);
        horizontalLine.endPoint = CGPointMake(CGRectGetMaxX(self.platformRect),y);
        NSValue *structValue = [NSValue value:&horizontalLine withObjCType:@encode(LineStruct)];
        [horizontalLines addObject:structValue];
    }
    
    [verticalLines addObjectsFromArray:horizontalLines];
    
    return verticalLines;
 
}


// -----------------------------------------------------------------------------------------------------------------
#pragma mark - Rect methods


- (CGRect) outerBorderRect {
    return self.frame;
}

- (CGRect)innerBorderRect {
    return [self insetRect:self.outerBorderRect byAmount:kOuterBorder];
}

- (CGRect)platformRect {
    return [self insetRect:self.innerBorderRect byAmount:kInnerBorder];
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


