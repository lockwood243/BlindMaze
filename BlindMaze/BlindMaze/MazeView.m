//
//  MazeView.m
//  BlindMaze
//
//  Created by Shane Rosse on 1/23/15.
//  Copyright (c) 2015 Shane Rosse. All rights reserved.
//

#import "MazeView.h"
#import "Player1.h"

@interface MazeView () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIPanGestureRecognizer *moveRecognizer;
@property (nonatomic, strong) NSMutableDictionary *linesInProgress;
@property (nonatomic, strong) NSMutableArray *finishedLines;

@property (nonatomic, weak) Player1 *selectedLine;

@end

@implementation MazeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
