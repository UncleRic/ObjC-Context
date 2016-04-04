//  MainViewController.m
//  ObjC-Context
//
//  Created by Frederick C. Lee on 3/29/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
// -----------------------------------------------------------------------------------------------------------------

#import "MainViewController.h"
#import "GameboardView.h"
#import "GameboardLayout.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet GameBoardView *gameBoardView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    return;
}

// -----------------------------------------------------------------------------------------------------------------

- (void)viewDidLayoutSubviews {
    _gameBoardView.layout = [[GameBoardLayout alloc] initWithFrame:_gameBoardView.bounds andMarksPerAxis:3];
}


// -----------------------------------------------------------------------------------------------------------------
#pragma mark - Action methods

- (IBAction)randomPlayAction:(UIBarButtonItem *)sender {
    self.gameBoardView.isPlaying = true;
    [_gameBoardView setNeedsDisplay];
}

// -----------------------------------------------------------------------------------------------------------------
- (IBAction)exitAction:(UIBarButtonItem *)sender {
    exit(0);
}

@end

