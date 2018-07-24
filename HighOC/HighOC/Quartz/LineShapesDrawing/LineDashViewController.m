//
//  LineDashViewController.m
//  HighOC
//
//  Created by DengPan on 2018/7/24.
//  Copyright © 2018年 DengPan. All rights reserved.
//

#import "LineDashViewController.h"
#import "LineDshDrawing.h"
@interface LineDashViewController ()

@end

@implementation LineDashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"虚线和文字";
    
    self.view = [[LineDshDrawing alloc]initWithFrame:self.view.frame];
    
    // Do any additional setup after loading the view.
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
