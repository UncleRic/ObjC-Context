//  GameBoardView.m
//  ObjC-Context
//
//  Created by Frederick C. Lee on 3/29/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
// -----------------------------------------------------------------------------------------------------------------

#import "GameBoardView.h"
#import "GlobalVariables.h"
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
    CGPoint from; CGPoint to;
    NSArray *gridLines = [self.layout gridLines];
    LineStruct lineStruct;
    for (NSValue *line in gridLines) {
        [line getValue:&lineStruct];
        from = lineStruct.startPoint;
        to = lineStruct.endPoint;
        [GameContext strokeLineFrom:from to:to withColor:[UIColor gridLineColor] havingWidth:kGridLine andLineCap:kCGLineCapButt];
    }
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
    }
    
}


@end
