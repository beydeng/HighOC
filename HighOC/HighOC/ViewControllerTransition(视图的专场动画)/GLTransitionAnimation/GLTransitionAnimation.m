//
//  GLTransitionContext.m
//  GLTransitionAnimationDemo
//
//  Created by Beydeng on 2017/3/24.
//  Copyright © 2017年 Beydeng. All rights reserved.
//

#import "GLTransitionAnimation.h"

@interface GLTransitionAnimation ()


/**
 动画时间
 */
@property (nonatomic,assign) NSTimeInterval duration;


@end

@implementation GLTransitionAnimation

- (id)initWithDuration:(NSTimeInterval)duration
{
    self = [super init];
    if (self) {
        _duration = duration;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (self.animationBlock) {
        self.animationBlock(transitionContext);
    }
}

@end
