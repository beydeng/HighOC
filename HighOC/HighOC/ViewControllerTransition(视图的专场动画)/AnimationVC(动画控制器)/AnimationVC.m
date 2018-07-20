//
//  AnimationVC.m
//  HighOC
//
//  Created by DengPan on 2018/7/19.
//  Copyright © 2018年 DengPan. All rights reserved.
//

#import "AnimationVC.h"

#define ScreenHeight  [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth   [[UIScreen mainScreen] bounds].size.width

@interface AnimationVC ()

@end

@implementation AnimationVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
    }
    return self;
}


//执行动画的地方，最核心的方法
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    //该方法接受一个遵守<UIViewControllerContextTransitioning>协议的转场环境对象，它提供了转场所需要的重要数据：参与转场的视图控制器和转场过程的状态信息。
    
    UIView *containerView = transitionContext.containerView;
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    CGFloat translation = containerView.frame.size.width;
    
    CGAffineTransform fromeViewTransform = CGAffineTransformIdentity;
    
    CGAffineTransform toViewTransform = CGAffineTransformIdentity;
    
    if (self.transitionType) {
        
        translation = self.transitionType == UINavigationControllerOperationPush?translation:-translation;

        fromeViewTransform = CGAffineTransformMakeTranslation(-translation, 0);
        
        toViewTransform = CGAffineTransformMakeTranslation(translation, 0);
        
    }else if (self.tabOperationDirection){
        
        translation = self.tabOperationDirection == TabOperationDirectionLeft?translation:-translation;

        fromeViewTransform = CGAffineTransformMakeTranslation(-translation, 0);
        
        toViewTransform = CGAffineTransformMakeTranslation(translation, 0);
        
    }else if (self.modalOperation){
        translation =  containerView.frame.size.height;
        
        toViewTransform = CGAffineTransformMakeTranslation(0,self.modalOperation == MyModalOperationPresentation?translation:0);
        fromeViewTransform = CGAffineTransformMakeTranslation(0,self.modalOperation == MyModalOperationPresentation?0:translation);
        
    }
    
    
    [containerView addSubview:toView];

    toView.transform = toViewTransform;
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
       
        fromView.transform = fromeViewTransform;
        toView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        //考虑到转场中途可能取消的情况，转场结束后，恢复视图状态。
//        fromView.transform = CGAffineTransformIdentity;
//        toView.transform = CGAffineTransformIdentity;
        
        //转场的结果有两种：完成或取消。非交互转场的结果只有完成一种情况，不过交互式转场需要考虑取消的情况。如何结束取决于转场的进度，通过transitionWasCancelled方法来获取转场的结果，然后使用completeTransition:来通知系统转场过程结束，这个方法会检查动画控制器是否实现了animationEnded:方法，如果有，则调用该方法。
        
        BOOL isCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:isCancelled];
        
    }];
    
}

// 返回动画时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.5;
    
}

//如果实现了，会在转场动画结束后调用，可以执行一些收尾工作(optional:可选)
//-(void)animationEnded:(BOOL)transitionCompleted{
//
//
//
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
