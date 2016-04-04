//  GameBoardView.m
//  ObjC-Context
//
//  Created by Frederick C. Lee on 3/29/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
// -----------------------------------------------------------------------------------------------------------------

#import "GameBoardView.h"
#import "Global.h"
#import "GameBoardLayout.h"

@interface GameBoardView() {
    CGRect row1Rect1;
    CGRect row1Rect2;
    CGRect row1Rect3;
    
    CGRect row2Rect1;
    CGRect row2Rect2;
    CGRect row2Rect3;
    
    CGRect row3Rect1;
    CGRect row3Rect2;
    CGRect row3Rect3;
}

@property(nonatomic, retain) NSArray *rectArray;

@end

@implementation GameBoardView

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        row1Rect1 = CGRectMake(24.0, 28.0, 70, 70);
        row1Rect2 = CGRectMake(136.0, 28.0, 70, 70);
        row1Rect3 = CGRectMake(246.0, 28.0, 70, 70);
        
        row2Rect1 = CGRectMake(24.0, 134.0, 70, 70);
        row2Rect2 = CGRectMake(136.0, 134.0, 70, 70);
        row2Rect3 = CGRectMake(246.0, 134.0, 70, 70);
        
        row3Rect1 = CGRectMake(24.0, 244.0, 70, 70);
        row3Rect2 = CGRectMake(136.0, 244.0, 70, 70);
        row3Rect3 = CGRectMake(246.0, 244.0, 70, 70);
        
        self.rectArray = @[
                           [NSValue valueWithCGRect:row1Rect1],
                           [NSValue valueWithCGRect:row1Rect2],
                           [NSValue valueWithCGRect:row1Rect3],
                           
                           [NSValue valueWithCGRect:row2Rect1],
                           [NSValue valueWithCGRect:row2Rect2],
                           [NSValue valueWithCGRect:row2Rect3],
                           
                           [NSValue valueWithCGRect:row3Rect1],
                           [NSValue valueWithCGRect:row3Rect2],
                           [NSValue valueWithCGRect:row3Rect3]
                           ];
    }
    return self;
}
// -----------------------------------------------------------------------------------------------------------------

- (void)renderBoarder {
    [GameContext strokeRect:[self.layout outerBorderRect] withColor:[UIColor redColor] havingWidth:kOuterBorder];
    [GameContext strokeRect:[self.layout innerBorderRect] withColor:[UIColor redColor] havingWidth:kInnerBorder];
}

- (void)renderPlatform {
    [GameContext fillRect:[self.layout innerBorderRect] withColor:[UIColor greenColor]];
}

// -----------------------------------------------------------------------------------------------------------------

- (void)renderGridLines {
    CGPoint startPoint; CGPoint endPoint;
    NSArray *gridLines = [self.layout gridLines];
    LineStruct lineStruct;
    for (NSValue *line in gridLines) {
        [line getValue:&lineStruct];
        startPoint = lineStruct.startPoint;
        endPoint = lineStruct.endPoint;
        [GameContext strokeLineFrom:startPoint to:endPoint withColor:[UIColor gridLineColor] havingWidth:kGridLine andLineCap:kCGLineCapButt];
    }
}

// -----------------------------------------------------------------------------------------------------------------

- (void)renderLineThroughWinningPositions {
    CGPoint startPoint1 = CGPointMake(14, 64);
    CGPoint endPoint1 = CGPointMake(328,64);
    
    CGPoint startPoint2 = CGPointMake(14, 170);
    CGPoint endPoint2 = CGPointMake(328,170);
    
    CGPoint startPoint3 = CGPointMake(14, 280);
    CGPoint endPoint3 = CGPointMake(328,280);
    
    CGPoint startXPoint1 = CGPointMake(20, 20);
    CGPoint endXPoint1 = CGPointMake(326,326);
    
    CGPoint startXPoint2 = CGPointMake(326, 20);
    CGPoint endXPoint2 = CGPointMake(20,326);

    [GameContext strokeLineFrom:startXPoint2 to:endXPoint2 withColor:[UIColor winningLineColor] havingWidth:kWinningLine andLineCap:kCGLineCapRound];
    
}


// -----------------------------------------------------------------------------------------------------------------

- (void)renderXinRect:(CGRect)rect {
    
    
    [GameContext strokeLineFrom:[GameBoardLayout topLeftOfRect:rect] to:[GameBoardLayout bottomRightOfRect:rect]
                      withColor: [UIColor markXColor] havingWidth:kMark andLineCap:kCGLineCapRound];
    
    [GameContext strokeLineFrom:[GameBoardLayout bottomLeftOfRect:rect] to:[GameBoardLayout topRightOfRect:rect]
                      withColor: [UIColor markXColor] havingWidth:kMark andLineCap:kCGLineCapRound];
}

// -----------------------------------------------------------------------------------------------------------------

- (void)renderOinRect:(CGRect)rect {
    [GameContext strokeEllipseInRect:rect withColor:[UIColor markOColor] havingWidth:kMark];
}

// -----------------------------------------------------------------------------------------------------------------

- (void)renderMarks {
    [self renderXinRect:row3Rect3];
    [self renderOinRect:row2Rect2];
}

// -----------------------------------------------------------------------------------------------------------------

- (void)drawRect:(CGRect)rect {
    if (nil != self.layout) {
        
        [super drawRect:rect];
        [self renderBoarder];
        [self renderPlatform];
        [self renderGridLines];
        [self renderMarks];
        [self renderLineThroughWinningPositions];
    }
    
}


@end
