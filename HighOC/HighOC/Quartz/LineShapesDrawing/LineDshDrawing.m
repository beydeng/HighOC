//
//  LineDshDrawing.m
//  HighOC
//
//  Created by DengPan on 2018/7/24.
//  Copyright © 2018年 DengPan. All rights reserved.
//

#import "LineDshDrawing.h"

@implementation LineDshDrawing

void drawString(NSString * lable,NSString *des){
    
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:12]};
    [lable drawAtPoint:CGPointMake(30, -50) withAttributes:attrs];
    [des drawAtPoint:CGPointMake(90, -50) withAttributes:attrs];
    
}

void drawLine(CGContextRef context){
    
    CGContextMoveToPoint(context, 30, 0);
    CGContextAddLineToPoint(context, 300, 0);
    CGContextStrokePath(context);
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextFillRect(context, rect);
    
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor purpleColor].CGColor);
    CGContextSetLineWidth(context, 2.0f);
    
    //观察下面平移的作用
    CGContextTranslateCTM(context, 0, 180.0f);
    drawString(@"第一条线", @"没有虚线");
    drawLine(context);
    
    CGContextTranslateCTM(context, 0, 80.0f);
    drawString(@"第二条线",@"先绘制10个再跳过10个点，第一个虚线绘制的时候不跳过点");
    const CGFloat pattern[] = {10,10};
    /*
     LineDash 有四个参数
     lengths的值｛10,10｝表示先绘制10个点，再跳过10个点，如此反复，如图：
     如果把lengths值改为｛10, 20, 10｝，则表示先绘制10个点，跳过20个点，绘制10个点，跳过10个点，再绘制20个点，如此反复，如图：
     phase参数表示在第一个虚线绘制的时候跳过多少个点
     注意count的值等于lengths数组的长度
     */
    CGContextSetLineDash(context, 0, pattern, sizeof(pattern)/sizeof(pattern[0]));
    drawLine(context);
    
    CGContextTranslateCTM(context, 0, 80.0f);
    drawString(@"第三条线", @"先绘制10个再跳过10个点，第一个虚线绘制的时候不跳过点5个点");
    //那么就是说 第一个线绘制的时候是10-5和点
    CGContextSetLineDash(context, 5, pattern, sizeof(pattern)/sizeof(pattern[0]));
    drawLine(context);
    
    CGContextTranslateCTM(context, 0, 80.0f);
    drawString(@"第四条线", @"先绘制10，在跳过20，再绘制10，然后再跳过10，绘制20，循环往复");
    const CGFloat pattern1[] = {10,20,10};
    CGContextSetLineDash(context, 0, pattern1,3);
    drawLine(context);
    
}

@end
