//
//  MazeView.m
//  BlindMaze
//
//  Created by Shane Rosse on 1/23/15.
//  Copyright (c) 2015 Shane Rosse. All rights reserved.
//

#import "MazeView.h"
#import "Player1.h"
#import <AudioToolbox/AudioToolbox.h>

@interface MazeView () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIPanGestureRecognizer *moveRecognizer;
@property (nonatomic, strong) NSMutableDictionary *linesInProgress;

@property (nonatomic, weak) Player1 *player1;

@end

@implementation MazeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (instancetype)initWithFrame:(CGRect)r
{
    self = [super initWithFrame:r];
    
    if (self) {
        self.linesInProgress = [[NSMutableDictionary alloc] init];
        self.backgroundColor = [UIColor grayColor];
        self.multipleTouchEnabled = YES;
        
        UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                              action:@selector(doubleTap:)];
        doubleTapRecognizer.numberOfTapsRequired = 2;
        doubleTapRecognizer.delaysTouchesBegan = YES;
        
        [self addGestureRecognizer:doubleTapRecognizer];
        
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                        action:@selector(tap:)];
        tapRecognizer.delaysTouchesBegan = YES;
        [tapRecognizer requireGestureRecognizerToFail:doubleTapRecognizer];
        [self addGestureRecognizer:tapRecognizer];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    // Let's put in a log statement to see the order of events
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for (UITouch *t in touches) {
        CGPoint location = [t locationInView:self];
        
        Player1 *player1 = [[Player1 alloc] init];
        player1.location = location;
        
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        self.linesInProgress[key] = player1;
    }
    
    [self setNeedsDisplay];
}


- (void)touchesMoved:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    // Let's put in a log statement to see the order of events
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        Player1 *player1 = self.linesInProgress[key];
        
        player1.location = [t locationInView:self];
        
        CGPoint point = [t locationInView:t.view];
        CGPoint pointOnScreen = [t.view convertPoint:point fromView:nil];
        NSLog(@"Point - %f, %f", pointOnScreen.x, pointOnScreen.y);
        NSLog(@"Touch");
        self.backgroundColor = [self randomColor];
        if ((pointOnScreen.x < 100 || pointOnScreen.x > 300)) {
            //self.backgroundColor = [UIColor blackColor];
        }
    }
    
    
    // Set and if statement related to the range of our path
    if([[UIDevice currentDevice].model isEqualToString:@"iPhone"])
    {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
       
    }
    else
    {
        // Not an iPhone: so doesn't have vibrate
    }
    

    
    [self setNeedsDisplay];
}

/*Implement a better color selection method, taking y position as a parameter
 */
-(UIColor *)randomColor
{
    double red = arc4random() % 255 / 255.0;
    double green = arc4random() % 255 / 255.0;
    double blue = arc4random() % 255 / 255.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    NSLog(@"%@", color);
    return color;
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)other
{
    if (gestureRecognizer == self.moveRecognizer) {
        return YES;
    }
    
    return NO;
}


- (void)tap:(UIGestureRecognizer *)gr
{
    NSLog(@"Recognized tap");
    
    CGPoint point = [gr locationInView:self]; //This point is the location of our single tap
        
    [self setNeedsDisplay];
}

- (void)doubleTap:(UIGestureRecognizer *)gr
{
    NSLog(@"Recognized Double Tap");
    
    [self.linesInProgress removeAllObjects];
    [self setNeedsDisplay];
}


@end
