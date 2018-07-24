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
    
    CGContextSetLineWidth(context, 2);
    CGContextSetStrokeColorWithColor(context, [UIColor purpleColor].CGColor);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, gridSize*2, gridSize*6);
    CGContextAddLineToPoint(context, gridSize*5, gridSize*6);
    CGContextAddLineToPoint(context, gridSize*6, gridSize*10);
    CGContextAddLineToPoint(context, gridSize*3, gridSize*10);
    CGContextClosePath(context);
    CGContextStrokePath(context);
    
    //将画布下移100
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextSetLineWidth(context, 15.0f);
    
    //LineCap和LineJoin的理解
    /*
     typedef CF_ENUM(int32_t, CGLineCap) {
     kCGLineCapButt,//该属性值指定不绘制端点， 线条结尾处直接结束。这是默认值。
     kCGLineCapRound,//该属性值指定绘制圆形端点， 线条结尾处绘制一个直径为线条宽度的半圆
     kCGLineCapSquare//该属性值指定绘制方形端点。线条结尾处绘制半个边长为线条宽度的正方形。需要说明的是，这种形状的端点与“butt”形状的端点十分相似，只是采用这种形式的端点的线条略长一点而已
     };
     */
    
    CGContextSetLineCap(context, kCGLineCapRound);
    //这里是不是应该想到在上一节里面画扇形的时候，为什么画笔出现缺角的
    //如何处理呢？？？
    //我只需要将端点绘制成方块形
    //CGContextSetLineCap(context, kCGLineCapSquare);
    //去上一节里面的扇形绘制去试试吧
    
    /*
     typedef CF_ENUM(int32_t, CGLineJoin) {
     kCGLineJoinMiter,//接合点为尖角
     kCGLineJoinRound,//接合点为圆角
     kCGLineJoinBevel//接合点为斜角
     };
     */
    
//    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    
    CGContextTranslateCTM(context, 0, 100.0f);
    CGPoint yellowLines[] = {
        
        CGPointMake(0, gridSize*14),
        CGPointMake(gridSize*2, gridSize*11),
        CGPointMake(gridSize*4, gridSize*14),
        CGPointMake(gridSize*6, gridSize*12),
        CGPointMake(gridSize*8, gridSize*14),
        CGPointMake(gridSize*10, gridSize*13),
        CGPointMake(gridSize*12, gridSize*14),
        
    };
    
    CGContextAddLines(context, yellowLines, sizeof(yellowLines)/sizeof(yellowLines[0]));
//    CGContextClosePath(context); //自己体验close 和 stroke
    CGContextStrokePath(context);
    
}


@end
