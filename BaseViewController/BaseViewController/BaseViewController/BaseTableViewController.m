//
//  BaseTableViewController.m
//  BaseViewController
//
//  Created by dengyanzhou on 15/8/28.
//  Copyright (c) 2015年 YiXingLvDong. All rights reserved.
//

#import "BaseTableViewController.h"
#import "MJRefresh.h"
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
@interface BaseTableViewController ()

@end

@implementation BaseTableViewController
@synthesize tableView = _tableView;
#pragma mark - lifecycle
//加载视图
- (void)loadView
{
    [super loadView];
    //自定制视图
}
//加载视图完毕
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加tableView
    [self.view addSubview:self.tableView];
    self.isOpenHeaderRefresh = YES;
    self.isOpenFooterRefresh = YES;
    [self showPromptTextUIWithPromptText:@"加载失败" title:nil andDuration:3];
    // Do any additional setup after loading the view, typically from a nib.
}
//视图将要出现
- (void)viewWillAppear:(BOOL)animated
{
    self.isOpenNetListen = YES;
}
//视图已经出现
- (void)viewDidAppear:(BOOL)animated
{
}
//视图将要消失
- (void)viewWillDisappear:(BOOL)animated
{
    self.isOpenNetListen = NO;
}
//视图已经消失
- (void)viewDidDisappear:(BOOL)animated
{
}
//收到系统内存警告
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)fitCondition
{

   [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"wwdc15.jpg"] forBarMetrics:UIBarMetricsDefault];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,self.viewToTop,self.view.frame.size.width ,self.view.frame.size.height - self.viewToBottom - self.viewToTop ) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor yellowColor];
        
    }
    return _tableView;
}
#pragma mark - UITableViewDelegate - 子类重写
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (NSMutableArray *)dataArray
{
    if (!_dataArray ) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}
#pragma mark - 注册是否开启头部刷新and脚部刷新
- (void)setIsOpenHeaderRefresh:(BOOL)isOpenHeaderRefresh
{ _isOpenHeaderRefresh =  isOpenHeaderRefresh;
    if (_isOpenHeaderRefresh) {
        WS(weakSelf);
        self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf headerRefresh];
        }];
    }else{
        NSLog(@"不开启头部刷新");
    }
}
- (void)setIsOpenFooterRefresh:(BOOL)isOpenFooterRefresh
{  _isOpenFooterRefresh =  isOpenFooterRefresh;
    if (_isOpenFooterRefresh) {
        WS(weakSelf);
        self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            // 进入刷新状态后会自动调用这个block
            [weakSelf footerRefresh];
        }];
    }else{
        NSLog(@"不开启头脚部刷新");
    }
}
#pragma mark - 头部刷新and脚部刷新
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
