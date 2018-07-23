//
//  LineShapesDrawing.m
//  HighOC
//
//  Created by DengPan on 2018/7/23.
//  Copyright © 2018年 DengPan. All rights reserved.
//

#import "LineShapesDrawing.h"

@implementation LineShapesDrawing


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 10, 20, 30, 1);
    CGContextFillRect(context, rect);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextSetLineWidth(context, 1.0f);
    
    CGFloat gridSize = 20.0f;
    CGFloat linePosition = 0.0;
    while (linePosition<rect.size.height) {
        
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, 0, linePosition);
        CGContextAddLineToPoint(context, rect.size.width, linePosition);
        CGContextStrokePath(context);
        linePosition += gridSize;
        
    }

    linePosition = 0.0f;
    
    while (linePosition<rect.size.width) {
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, linePosition, 0);
        CGContextAddLineToPoint(context, linePosition, rect.size.height);
        CGContextStrokePath(context);
        linePosition += gridSize;
        
    }
    
    
    
}


@end
