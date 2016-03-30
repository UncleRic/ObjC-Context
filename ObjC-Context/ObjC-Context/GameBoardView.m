//
//  GameBoardView.m
//  ObjC-Context
//
//  Created by Frederick C. Lee on 3/29/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
//

#import "GameBoardView.h"

@implementation GameBoardView


- (void)renderBoarder {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth (context, kOuterBorder);
    
}



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
