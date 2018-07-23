//
//  ComeToQuartzViewController.m
//  HighOC
//
//  Created by DengPan on 2018/7/23.
//  Copyright © 2018年 DengPan. All rights reserved.
//

#import "ComeToQuartzViewController.h"
#import "ComeToQuartzView.h"

@interface ComeToQuartzViewController ()

@end

@implementation ComeToQuartzViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view = [[ComeToQuartzView alloc] initWithFrame:self.view.frame];
    UIGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(repaintView)];
    [self.view addGestureRecognizer:recognizer];
    
    // Do any additional setup after loading the view.
}

- (void)repaintView {
    [self.view setNeedsDisplay];
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
