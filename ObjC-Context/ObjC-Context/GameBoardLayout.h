//  GameBoardLayout.h
//  ObjC-Context
//
//  Created by Frederick C. Lee on 3/30/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
// -----------------------------------------------------------------------------------------------------------------

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GameBoardLayout : NSObject
- (instancetype)initWithFrame: (CGRect)frame andMarksPerAxis:(NSUInteger)marksPerAxis;
- (CGRect)outerBorderRect;
- (CGRect)innerBorderRect;
- (CGRect)platformRect;



@end
