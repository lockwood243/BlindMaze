//
//  Grid.m
//  BlindMaze
//
//  Created by Faraz Abidi on 1/23/15.
//  Copyright (c) 2015 Shane Rosse. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "Grid.h"

@implementation Grid

-(id)init{
    self = [super init];
    if(self){
        self.hasCollided = false;
        self.isLeft = true;
    }
    return self;
}

-(NSMutableArray *) pixelPointsArray{
    if(!_pixelPointsArray)_pixelPointsArray = [[NSMutableArray alloc]init ];
    return _pixelPointsArray;
}

-(int)playersTouchX:(int)x TouchY:(int)y wasATap:(bool)tap{
    bool start = (x < 100 && x > 75 && y < 10 && y > 0); //change according to values of box
    if (start) self.hasCollided = false;
    if((tap && !start) || self.hasCollided){
        return 1; //invalid move; phone should produce sound
    }
    else{
        return [self checkCollisionTouchX:x TouchY:y];
    }
    

}


/* Significantly overhaul this if we want to implement randomization.
 But it will work... for now
 
 Using a "valid tiles" system would make this much better.
 We'll decide if we want to implement that on Saturday
 
 If we super have time, add a way to "draw" the path that your opponent has to race
 Probably wouldn't actually be that hard; store each touch value in an array
    +only store a new value if it is not within a 5 pixel radius of an old value
 -check if each move is in a 5 pixel radius of a point in the array
 -if your finger is within a 10 pixel square radius of any pixel in the stored array,
 you're okay. Otherwise, it is a collision
 */
-(int)checkCollisionTouchX:(int)x TouchY:(int)y{
    if(self.isLeft){
        if(y<100){
            if(x> 175 && x<225){
                return 0;
            }
            else{
                return 1;
            }
        }
        else if (y<200 && y>=100){
            if(x> 190 && x< 250) return 0;
            else return 1;
        }
        /* Repeat these else if's up to boundary
         */
        //
        else if (y>470) return 2;//assuming victory condition is at 500
    }
    else{
        /* fill this in for Right Grid's boundaries
         */
        return 3;
        
    }
    return 3; //3 indicates returning with error
}

@end

