//
//  PixelPoint.h
//  BlindMaze
//
//  Created by Faraz Abidi on 1/24/15.
//  Copyright (c) 2015 Shane Rosse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PixelPoint : NSObject

@property int xCord, yCord;
-(bool)pointNearOtherPoint:(PixelPoint*) otherPoint inRadius:(int)radius;

@end
