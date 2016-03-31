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

- (instancetype)init {
    self = [super init];
    if (self) {
        _layout = [[GameBoardLayout alloc] initWithFrame:self.frame andMarksPerAxis:3];
    }
    return self;
}

//private var layout: GameBoardLayout {
//    return GameBoardLayout(frame: frame, marksPerAxis: 3)
//}

- (void)strokeRect:(CGRect)rect theColor:(UIColor*)color theWidth:(CGFloat) width {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth (context, kOuterBorder);
    CGContextSetStrokeColorWithColor(context,color.CGColor);
    CGContextAddRect(context, rect);
    CGContextStrokePath(context);
}


- (void)renderBoarder {
    [self strokeRect:[self.layout outerBorderRect] theColor:[UIColor outerBorderColor] theWidth:kOuterBorder];
    [self strokeRect:[self.layout outerBorderRect] theColor:[UIColor outerBorderColor] theWidth:kInnerBorder];
}

//
//func renderBorder() {
//    let context = UIGraphicsGetCurrentContext()!
//    context.strokeRect(layout.outerBorderRect, color: UIColor.outerBorder, width: Thickness.outerBorder)
//    context.strokeRect(layout.innerBorderRect, color: UIColor.innerBorder, width: Thickness.innerBorder)
//}

//func strokeRect(rect: CGRect, color: UIColor, width: CGFloat) {
//    CGContextSetLineWidth(self, width)
//    CGContextSetStrokeColorWithColor(self, color.CGColor)
//    CGContextAddRect(self, rect)
//    CGContextStrokePath(self)
//}


//func renderBorder() {
//    let context = UIGraphicsGetCurrentContext()!
//    context.strokeRect(layout.outerBorderRect, color: UIColor.outerBorder, width: Thickness.outerBorder)
//    context.strokeRect(layout.innerBorderRect, color: UIColor.innerBorder, width: Thickness.innerBorder)
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
