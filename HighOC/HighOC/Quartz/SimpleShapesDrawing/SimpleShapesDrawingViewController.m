//
//  SimpleShapesDrawingViewController.m
//  HighOC
//
//  Created by DengPan on 2018/7/23.
//  Copyright © 2018年 DengPan. All rights reserved.
//

#import "SimpleShapesDrawingViewController.h"
#import "SimpleShapesDrawing.h"

@interface SimpleShapesDrawingViewController ()

@property (nonatomic,strong) SimpleShapesDrawing *simple;

@end

@implementation SimpleShapesDrawingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.simple = [[SimpleShapesDrawing alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.simple];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-20, self.view.frame.size.height-100, 40, 40)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(createShapes:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(20, self.view.frame.size.height-50, self.view.frame.size.width-40,30)];
    slider.maximumValue = 20;
    [slider addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    // Do any additional setup after loading the view.
}

-(void)createShapes:(UIButton *)sender{
    
    //arc4random()%7
    [self.simple setShapesType:SX];
    
}

- (void)changeValue:(id)sender {
    
    [self.simple setStrokeWidth:[(UISlider *)sender value]];
    
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
