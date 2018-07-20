//
//  SecondViewController.m
//  HighOC
//
//  Created by DengPan on 2018/7/19.
//  Copyright © 2018年 DengPan. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(buttonAtion:) forControlEvents:UIControlEventTouchUpInside];

    button.frame = CGRectMake(100, 100, 20, 30);
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    
    
    // Do any additional setup after loading the view.
}

-(void)buttonAtion:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
