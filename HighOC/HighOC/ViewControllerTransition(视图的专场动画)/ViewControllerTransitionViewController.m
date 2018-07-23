//
//  ViewControllerTransitionViewController.m
//  HighOC
//
//  Created by DengPan on 2018/7/19.
//  Copyright © 2018年 DengPan. All rights reserved.
//

#import "ViewControllerTransitionViewController.h"
#import "SecondViewController.h"
#import "GLCircleSpreadAnimation.h"
#import "UIViewController+GLTransition.h"

@interface ViewControllerTransitionViewController ()

@end

@implementation ViewControllerTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"VC的转场动画";
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 50, 50);
    button.layer.cornerRadius = 25;
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonAtion:) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view.
}

-(void)buttonAtion:(UIButton *)sender{
    

    GLCircleSpreadAnimation *circleSpreadAnimation = [[GLCircleSpreadAnimation alloc] initWithStartPoint:sender.center radius:25];
    
    SecondViewController *secondVc = [[SecondViewController alloc] init];
    
    [self gl_pushViewControler:secondVc withAnimation:circleSpreadAnimation];
    
}


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
