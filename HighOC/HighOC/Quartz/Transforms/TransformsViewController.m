//
//  TransformsViewController.m
//  HighOC
//
//  Created by DengPan on 2018/7/25.
//  Copyright © 2018年 DengPan. All rights reserved.
//

#import "TransformsViewController.h"
#import "TransFormsView.h"

@interface TransformsViewController ()

@end

@implementation TransformsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view = [[TransFormsView alloc]initWithFrame:self.view.bounds];
    
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
