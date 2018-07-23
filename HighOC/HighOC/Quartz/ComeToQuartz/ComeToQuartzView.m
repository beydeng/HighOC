//
//  ComeToQuartzView.m
//  HighOC
//
//  Created by DengPan on 2018/7/23.
//  Copyright © 2018年 DengPan. All rights reserved.
//

#import "ComeToQuartzView.h"
#import "GraphicsFunctions.h"

@implementation ComeToQuartzView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGContextRef contex = UIGraphicsGetCurrentContext();//得到上下文
    CGContextSetFillColorWithColor(contex, DPRandomColor()); //给上下文填充颜色
    CGContextFillRect(contex, rect); //用上下文的颜色填充rect
    
    // Drawing code
}


@end
