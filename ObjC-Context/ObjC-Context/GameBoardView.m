//  GameBoardView.m
//  ObjC-Context
//
//  Created by Frederick C. Lee on 3/29/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
// -----------------------------------------------------------------------------------------------------------------

#import "GameBoardView.h"


@interface GameBoardView()
@end

@implementation GameBoardView


// -----------------------------------------------------------------------------------------------------------------

- (void)renderBoarder {
    [GameContext strokeRect:[self.layout outerBorderRect] withColor:[UIColor redColor] havingWidth:kOuterBorder];
    [GameContext strokeRect:[self.layout innerBorderRect] withColor:[UIColor redColor] havingWidth:kInnerBorder];
}

- (void)renderPlatform {
    [GameContext fillRect:[self.layout innerBorderRect] withColor:[UIColor greenColor]];
}

- (void)renderGridLines {
    CGPoint from; CGPoint to;
    [GameContext strokeLineFrom:from to:to withColor:[UIColor gridLineColor] havingWidth:kGridLine andLineCap:kCGLineCapButt];
}

//func renderGridLines() {
//    let context = UIGraphicsGetCurrentContext()!
//    layout.gridLines.forEach {
//        context.strokeLineFrom($0.startPoint, to: $0.endPoint, color: UIColor.gridLine, width: Thickness.gridLine, lineCap: .Butt)
//    }
//}


// -----------------------------------------------------------------------------------------------------------------


- (void)drawRect:(CGRect)rect {
    if (nil != self.layout) {
        
        [super drawRect:rect];
        [self renderBoarder];
        [self renderPlatform];
        
        //    renderGridLines()
    }
    
}


@end
