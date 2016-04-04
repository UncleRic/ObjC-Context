//  GameBoardView.m
//  ObjC-Context
//
//  Created by Frederick C. Lee on 3/29/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
// -----------------------------------------------------------------------------------------------------------------

#import "GameBoardView.h"
#import "Global.h"
#import "GameBoardLayout.h"


typedef NS_ENUM(NSUInteger, WinningStreakEnum) {
    oneAcross = 0,
    twoAcross,
    threeAcross,
    diagnalOne,
    diagnalTwo
};

typedef NS_ENUM(NSUInteger, GameBoardSquare) {
    one = 0,
    two,
    three,
    four,
    five,
    six,
    seven,
    eight,
    nine
};


@interface GameBoardView()
@property(nonatomic, retain) NSArray *rectArray;
@property(nonatomic, retain) NSArray *winningStreakArray;

@end

@implementation GameBoardView

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        self.isPlaying = false;
        [self constructWinningStreakCoordinates];
        [self constructGameBoardRects];
    }
    return self;
}

// -----------------------------------------------------------------------------------------------------------------

- (void)constructGameBoardRects {
    CGRect row1Rect1 = CGRectMake(24.0, 28.0, 70, 70);
    CGRect row1Rect2 = CGRectMake(136.0, 28.0, 70, 70);
    CGRect row1Rect3 = CGRectMake(246.0, 28.0, 70, 70);
    
    CGRect row2Rect1 = CGRectMake(24.0, 134.0, 70, 70);
    CGRect row2Rect2 = CGRectMake(136.0, 134.0, 70, 70);
    CGRect row2Rect3 = CGRectMake(246.0, 134.0, 70, 70);
    
    CGRect row3Rect1 = CGRectMake(24.0, 244.0, 70, 70);
    CGRect row3Rect2 = CGRectMake(136.0, 244.0, 70, 70);
    CGRect row3Rect3 = CGRectMake(246.0, 244.0, 70, 70);
    
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

// -----------------------------------------------------------------------------------------------------------------

- (void)constructWinningStreakCoordinates {
    LineStruct lineStruct1, lineStruct2, lineStruct3, lineStructX4, lineStructX5;
    lineStruct1.startPoint = CGPointMake(14, 64);
    lineStruct1.endPoint = CGPointMake(328,64);
    NSValue *structValue1 = [NSValue value:&lineStruct1 withObjCType:@encode(LineStruct)];
    
    lineStruct2.startPoint = CGPointMake(14, 170);
    lineStruct2.endPoint = CGPointMake(328,170);
    NSValue *structValue2 = [NSValue value:&lineStruct2 withObjCType:@encode(LineStruct)];
    
    lineStruct3.startPoint = CGPointMake(14, 280);
    lineStruct3.endPoint = CGPointMake(328,280);
    NSValue *structValue3 = [NSValue value:&lineStruct3 withObjCType:@encode(LineStruct)];
    
    lineStructX4.startPoint = CGPointMake(20, 20);
    lineStructX4.endPoint = CGPointMake(326,326);
    NSValue *structValueX4 = [NSValue value:&lineStructX4 withObjCType:@encode(LineStruct)];
    
    lineStructX5.startPoint = CGPointMake(326, 20);
    lineStructX5.endPoint = CGPointMake(20,326);
    NSValue *structValueX5 = [NSValue value:&lineStructX5 withObjCType:@encode(LineStruct)];
    
    self.winningStreakArray = @[structValue1, structValue2, structValue3, structValueX4, structValueX5];
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

- (void)renderLineThroughWinningPositions:(WinningStreakEnum)myEnum {
    
    LineStruct lineStruct;
    
    NSValue *myValue = _winningStreakArray[myEnum];
    [myValue getValue:&lineStruct];
    
    [GameContext strokeLineFrom:lineStruct.startPoint
                             to:lineStruct.endPoint
                      withColor:[UIColor winningLineColor]
                    havingWidth:kWinningLine andLineCap:kCGLineCapRound];
    
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
    GameBoardSquare rectItem = one;
    [self renderXinRect:[_rectArray[rectItem] CGRectValue]];
    
    rectItem = two;
    [self renderOinRect:[_rectArray[rectItem] CGRectValue]];
    
    rectItem = five;
    [self renderXinRect:[_rectArray[rectItem] CGRectValue]];
    
    rectItem = four;
    [self renderOinRect:[_rectArray[rectItem] CGRectValue]];
    
    rectItem = nine;
    [self renderXinRect:[_rectArray[rectItem] CGRectValue]];
}

// -----------------------------------------------------------------------------------------------------------------

- (void)drawRect:(CGRect)rect {
    if (nil != self.layout) {
        
        [super drawRect:rect];
        [self renderBoarder];
        [self renderPlatform];
        [self renderGridLines];
        if (_isPlaying) {
            [self renderMarks];
            [self renderLineThroughWinningPositions:diagnalOne];
        }
    }
}


@end
