//
//  IndexTableViewController.m
//  HighOC
//
//  Created by DengPan on 2018/7/19.
//  Copyright © 2018年 DengPan. All rights reserved.
//

#import "IndexTableViewController.h"
#import "ViewControllerTransitionViewController.h"

@interface IndexTableViewController ()
{
    NSMutableArray *_arrayData;
}
@end

@implementation IndexTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"总结";
    
    _arrayData = [@[@{@"title":@"VC的转场动画",@"class":@"ViewControllerTransitionViewController"}] mutableCopy];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _arrayData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
                                                                                           
    NSDictionary *dic = _arrayData[indexPath.row];
    cell.textLabel.text = dic[@"title"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 64;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dic = _arrayData[indexPath.row];
        
    [self.navigationController pushViewController:[[NSClassFromString(dic[@"class"]) alloc]init] animated:YES];
    
}

@end
