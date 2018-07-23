//
//  SimpleShapesDrawing.h
//  HighOC
//
//  Created by DengPan on 2018/7/23.
//  Copyright © 2018年 DengPan. All rights reserved.
//

#import "RootView.h"

typedef enum : NSUInteger {
    ZFX,//正方形
    CFX,//长方形
    LX,//菱形
    PXSBX,//平行四边形
    SJX,//三角形
    YX,//圆形
    SX,//扇形
} ShapesType;

@interface SimpleShapesDrawing : RootView

@property (nonatomic, assign) CGFloat strokeWidth;

@property (nonatomic,assign) ShapesType shapesType;

@end
