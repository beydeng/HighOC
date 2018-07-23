//
//  GLTransitionContext.m
//  HighOC
//
//  Created by Beydeng on 2017/6/30.
//  Copyright © 2017年 DengPan. All rights reserved.
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
