//
//  SimpleShapesDrawing.m
//  HighOC
//
//  Created by DengPan on 2018/7/23.
//  Copyright © 2018年 DengPan. All rights reserved.
//

#import "SimpleShapesDrawing.h"
#import "GraphicsFunctions.h"

@interface SimpleShapesDrawing()

@end


@implementation SimpleShapesDrawing

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

-(void)setShapesType:(ShapesType)shapesType{
    
    if (self.shapesType !=shapesType) {
    
        _shapesType = shapesType;
        [self setNeedsDisplay];
    }

}

-(void)setStrokeWidth:(CGFloat)strokeWidth{
    
    if (self.strokeWidth != strokeWidth) {
        _strokeWidth = strokeWidth;
        [self setNeedsDisplay];
    }
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    DPDrawWhiteGradient(context, rect);
    
    CGContextSetLineWidth(context, self.strokeWidth); //画笔宽度
    
    CGContextSetRGBStrokeColor(context, 0.2f, 0.2f, 0.2f, 1.0f);//画笔的颜色

    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);//填充context颜色

    switch (self.shapesType) {
        case CFX:
        {
            CGRect rect0 =  CGRectMake(self.frame.size.width/2-50, 200, 100, 50);
            CGContextFillRect(context, rect0);//填充这个rect
            CGContextStrokeRect(context, rect0);//画笔画rect
        }
            break;
        case YX:{
            CGRect rect0 =  CGRectMake(self.frame.size.width/2-50, 200, 100, 100);
            /* Fill an ellipse (an oval) inside `rect'. */
            CGContextFillEllipseInRect(context,rect0);
            CGContextStrokeEllipseInRect(context, rect0);            
        }
            break;
        case LX:{
            CGContextBeginPath(context); //开始画
            CGContextMoveToPoint(context,self.frame.size.width/2, 200);
            CGContextAddLineToPoint(context, self.frame.size.width/2-100.0f, 300.f);
            CGContextAddLineToPoint(context, self.frame.size.width/2, 400.f);
            CGContextAddLineToPoint(context, self.frame.size.width/2+100, 300.f);
//            CGContextAddLineToPoint(context, self.frame.size.width/2, 200.f);
            CGContextClosePath(context);
            CGContextDrawPath(context, kCGPathFillStroke);//画笔和填充同时进行填充
        }
            break;
        case SJX:{
            CGContextBeginPath(context);
            CGContextMoveToPoint(context,self.frame.size.width/2, 200);
            CGContextAddLineToPoint(context, self.frame.size.width/2-100, 300);
            CGContextAddLineToPoint(context, self.frame.size.width/2+100, 300);
//            CGContextAddLineToPoint(context, self.frame.size.width/2, 200);
            CGContextClosePath(context);
            CGContextDrawPath(context, kCGPathFillStroke);
        }
            break;
        case PXSBX:{
            CGContextBeginPath(context);
            CGContextMoveToPoint(context,self.frame.size.width/2-100, 200);
            CGContextAddLineToPoint(context,self.frame.size.width/2+100, 200);
            CGContextAddLineToPoint(context,self.frame.size.width/2+150, 300);
            CGContextAddLineToPoint(context,self.frame.size.width/2-50, 300);
//            CGContextAddLineToPoint(context,self.frame.size.width/2-100, 200);
            CGContextClosePath(context);
            CGContextDrawPath(context, kCGPathFillStroke);            
        }
            break;
        case SX:{
            
            CGContextBeginPath(context);
            CGContextMoveToPoint(context,self.frame.size.width/2, 200);
            CGContextAddLineToPoint(context,self.frame.size.width/2-100, 300);
            //画曲线
            //参数解析
            //第一个参数是上下文，直接穿上面获取到的。
            //接下来两个参数cpx,cpy这两个是控制在哪一个点产生弧度
            //最后两个参数x,y是终点的位置
            CGContextAddQuadCurveToPoint(context, self.frame.size.width/2, 400, self.frame.size.width/2+100, 300);
            CGContextMoveToPoint(context,self.frame.size.width/2+100, 300);
            CGContextAddLineToPoint(context,self.frame.size.width/2, 200);
            CGContextClosePath(context);
            CGContextDrawPath(context, kCGPathFillStroke);
            //这里为什么两个画笔之间的结尾处会出现缺角了？？？、
            //继续往下看
            
        }
            break;
        default:
        {
            CGRect rect0 =  CGRectMake(self.frame.size.width/2-50, 200, 100, 100);
            CGContextFillRect(context, rect0);
            CGContextStrokeRect(context, rect0);
        }
            break;
    }
    
}


@end
