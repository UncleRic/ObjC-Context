//
//  GameBoardView.m
//  ObjC-Context
//
//  Created by Frederick C. Lee on 3/29/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
//

#import "GameBoardView.h"
#import "GameBoardLayout.h"

@interface GameBoardView()
@property (nonatomic,retain)GameBoardLayout *layout;
@end

@implementation GameBoardView

- (void)awakeFromNib {
    _layout = [[GameBoardLayout alloc] initWithFrame:self.frame andMarksPerAxis:3];
    return;
}

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
    [self strokeRect:[self.layout outerBorderRect] theColor:[UIColor blueColor] theWidth:kInnerBorder];
}

// -----------------------------------------------------------------------------------------------------------------


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self renderBoarder];
//    renderBorder()
//    renderPlatform()
//    renderGridLines()
}


@end
