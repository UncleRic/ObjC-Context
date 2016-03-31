//
//  GameBoardView.m
//  ObjC-Context
//
//  Created by Frederick C. Lee on 3/29/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
//

#import "GameBoardView.h"


@interface GameBoardView()
@end

@implementation GameBoardView


// -----------------------------------------------------------------------------------------------------------------

- (void)strokeRect:(CGRect)rect theColor:(UIColor*)color theWidth:(CGFloat) width {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth (context, kOuterBorder);
    CGContextSetStrokeColorWithColor(context,color.CGColor);
    CGContextAddRect(context, rect);
    CGContextStrokePath(context);
}

// -----------------------------------------------------------------------------------------------------------------

- (void)renderBoarder {
    [self strokeRect:[self.layout outerBorderRect] theColor:[UIColor redColor] theWidth:kOuterBorder];
    [self strokeRect:[self.layout innerBorderRect] theColor:[UIColor blueColor] theWidth:kInnerBorder];
    
}

- (void)renderPlatform {
    [GameContext fillRect:[self.layout innerBorderRect] withColor:[UIColor greenColor]];
}



// -----------------------------------------------------------------------------------------------------------------


- (void)drawRect:(CGRect)rect {
    if (nil != self.layout) {
        
        [super drawRect:rect];
        [self renderBoarder];
        [self renderPlatform];
        //    renderBorder()
        //    renderPlatform()
        //    renderGridLines()
    }
    
}


@end
