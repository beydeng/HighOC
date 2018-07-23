//
//  GLCircleSpreadAnimation.h
//  GLPushAnimationDemo
//
//  Created by Beydeng on 2017/3/16.
//  Copyright © 2017年 Beydeng. All rights reserved.
//  圆圈类型传播

#import "GLTransitionManager.h"

@interface GLCircleSpreadAnimation : GLTransitionManager


/**
 初始化方法

 @param point 扩散的中心位置
 @param radius 半径
 @return 返回
 */
- (id)initWithStartPoint:(CGPoint)point radius:(CGFloat)radius;

@end
