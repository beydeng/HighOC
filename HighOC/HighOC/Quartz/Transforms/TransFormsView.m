//
//  TransFormsView.m
//  HighOC
//
//  Created by DengPan on 2018/7/25.
//  Copyright © 2018年 DengPan. All rights reserved.
//

#import "TransFormsView.h"

@implementation TransFormsView

void drawCorner(CGContextRef context,CGRect rect,UIColor *color){
    
    CGMutablePathRef path = CGPathCreateMutable(); //创建一个路径
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, 0, 50);
    CGPathAddLineToPoint(path, NULL, CGRectGetMidX(rect), CGRectGetMidY(rect));
    CGPathAddLineToPoint(path, NULL, CGRectGetMidX(rect), 0);
    CGPathCloseSubpath(path);
    
    CGContextAddPath(context, path);
    CGContextSetLineWidth(context, 1.0f);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextDrawPath(context, kCGPathFillStroke);
    CGPathRelease(path);
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
        
    CGContextSaveGState(context);
    
    drawCorner(context, rect,[UIColor blueColor]);
    
    //将上下文平移
    CGContextTranslateCTM(context, CGRectGetWidth(rect), 0);
    //将x方向缩放-1
    CGContextScaleCTM(context, -1, 1);
    drawCorner(context, rect, [UIColor redColor]);
    
    CGContextTranslateCTM(context,0, CGRectGetHeight(rect));
    
    
}


@end
