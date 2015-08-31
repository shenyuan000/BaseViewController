//
//  Demo6ViewController.m
//  BaseViewController
//
//  Created by dengyanzhou on 15/8/31.
//  Copyright (c) 2015年 YiXingLvDong. All rights reserved.
//

#import "Demo6ViewController.h"

@interface Demo6ViewController ()

@end

@implementation Demo6ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isOpenHeaderRefresh = YES;
    self.isOpenFooterRefresh = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 头部刷新的回调
- (void)headerRefresh
{
    
    //TODO: 头部刷新回调 子类需要重写
    //时间队列，规定时间执行某个事件
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格;
        [self.tableView reloadData];
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.tableView.header endRefreshing];
    });

}
#pragma mark - 脚部加载更多的回调
- (void)footerRefresh
{
    //TODO: 脚部刷新回调 子类需要重写
    //时间队列，规定时间执行某个事件
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格;
        [self.tableView reloadData];
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.tableView.footer endRefreshing];
    });

}


@end
