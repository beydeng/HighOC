//
//  LineShapesDrawingViewController.m
//  HighOC
//
//  Created by DengPan on 2018/7/23.
//  Copyright © 2018年 DengPan. All rights reserved.
//

#import "LineShapesDrawingViewController.h"
#import "LineShapesDrawing.h"

@interface LineShapesDrawingViewController ()

@end

@implementation LineShapesDrawingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view = [[LineShapesDrawing alloc]initWithFrame:self.view.bounds];
    
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
