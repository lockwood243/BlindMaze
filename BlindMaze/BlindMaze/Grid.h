//
//  Grid.h
//  BlindMaze
//
//  Created by Faraz Abidi on 1/23/15.
//  Copyright (c) 2015 Shane Rosse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface Grid : NSObject

@property (nonatomic) BOOL isLeft;
@property (nonatomic) BOOL hasCollided;

- (int)playersTouchX:(int)x TouchY:(int)y wasATap:(bool)tap;
- (int)checkCollisionTouchX: (int)x TouchY: (int)y;

@end