//
//  AnimationVC.h
//  HighOC
//
//  Created by DengPan on 2018/7/19.
//  Copyright © 2018年 DengPan. All rights reserved.
//

#import "RootViewController.h"


typedef enum : NSUInteger {
    TabOperationDirectionLeft,
    TabOperationDirectionRight,
} MyTabOperationDirection;

typedef enum : NSUInteger {
    MyModalOperationPresentation,
    MyModalOperationDismissal,
} MyModalOperation;

@interface AnimationVC : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic,assign) UINavigationControllerOperation transitionType;

@property (nonatomic,assign) MyTabOperationDirection tabOperationDirection;

@property (nonatomic,assign) MyModalOperation modalOperation;


@end
