//  MainViewController.m
//  ObjC-Context
//
//  Created by Frederick C. Lee on 3/29/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
// -----------------------------------------------------------------------------------------------------------------

#import "MainViewController.h"
#import "GlobalVariables.h"


@interface MainViewController () {
    struct Thickness  thickness;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    thickness.gridLine = 4.0;
    thickness.innerBorder = 1.0;
    thickness.outerBorder = 1.0;
    thickness.mark = 16.0;
    thickness.markMargin = 20.0;
    thickness.platformMargin = 16.0;
    thickness.winningLine = 8;
    thickness.winningLineInset = 8;
}


// -----------------------------------------------------------------------------------------------------------------
- (IBAction)exitAction:(UIBarButtonItem *)sender {
    exit(0);
}

@end
