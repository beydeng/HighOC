//
//  ImageDrawingViewController.m
//  HighOC
//
//  Created by DengPan on 2018/7/25.
//  Copyright © 2018年 DengPan. All rights reserved.
//

#import "ImageDrawingViewController.h"
#import "ImageDrawing.h"

@interface ImageDrawingViewController ()

@end

@implementation ImageDrawingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ImageDrawing *imageView = [[ImageDrawing alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    [self.view addSubview:imageView];
    
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
