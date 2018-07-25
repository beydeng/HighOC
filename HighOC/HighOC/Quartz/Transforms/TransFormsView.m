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

void drawInner(CGContextRef context,CGRect rect,UIColor *color){
    
    CGContextBeginPath(context);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(context, 1.0f);
    CGContextMoveToPoint(context, 0, 50);
    CGContextAddLineToPoint(context, 0, CGRectGetHeight(rect)-50);
    CGContextAddLineToPoint(context, CGRectGetMidX(rect), CGRectGetMidY(rect));
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);

}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //储存上下文
    CGContextSaveGState(context);
    
    drawCorner(context, rect,[UIColor blueColor]);
    
    //将上下文平移
    CGContextTranslateCTM(context, CGRectGetWidth(rect), 0);
    //将x方向缩放-1。也就是相当于绕Z轴旋转转了180度，变成了对称的形状
    CGContextScaleCTM(context, -1, 1);
    drawCorner(context, rect, [UIColor redColor]);
    
    CGContextTranslateCTM(context,0, CGRectGetHeight(rect));
    CGContextScaleCTM(context, 1, -1);
    drawCorner(context, rect, [UIColor yellowColor]);

    CGContextTranslateCTM(context,CGRectGetWidth(rect),0);
    CGContextScaleCTM(context, -1,1);
    drawCorner(context, rect, [UIColor purpleColor]);
    
    //取出上下文，因为存储的上下文是最开始的，所以也就是说现在的上下文是最初的上下文
    CGContextRestoreGState(context);
    
    drawInner(context, rect, [UIColor greenColor]);
    
    CGContextTranslateCTM(context, CGRectGetWidth(rect), 0);
    CGContextScaleCTM(context, -1, 1);
    drawInner(context, rect, [UIColor cyanColor]);
    
}


@end
