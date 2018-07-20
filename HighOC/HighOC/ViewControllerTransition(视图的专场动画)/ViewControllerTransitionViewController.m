//
//  ViewControllerTransitionViewController.m
//  HighOC
//
//  Created by DengPan on 2018/7/19.
//  Copyright © 2018年 DengPan. All rights reserved.
//

#import "ViewControllerTransitionViewController.h"
#import "AnimationVC.h"
#import "SecondViewController.h"

@interface ViewControllerTransitionViewController ()<UINavigationControllerDelegate>

@end

@implementation ViewControllerTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"VC的转场动画";
    self.view.backgroundColor = [UIColor blueColor];
    self.navigationController.delegate = self;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 20, 30);
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonAtion:) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view.
}

-(void)buttonAtion:(UIButton *)sender{
    
    [self.navigationController pushViewController:[[SecondViewController alloc]init] animated:YES];
    
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    AnimationVC *ani = [[AnimationVC alloc]init];
    ani.transitionType = operation;
    
    return ani;
    
}

//-(id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
//
//    return [[AnimationVC alloc]init];
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
