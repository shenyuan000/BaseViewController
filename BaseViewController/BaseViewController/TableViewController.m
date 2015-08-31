//
//  TableViewController.m
//  BaseViewController
//
//  Created by dengyanzhou on 15/8/31.
//  Copyright (c) 2015年 YiXingLvDong. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    lable.font = [UIFont boldSystemFontOfSize:14];
    lable.textColor = [UIColor redColor];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.text = @"Demo";
    self.navigationItem.titleView = lable;
    [self.dataArray addObjectsFromArray:@[@"开启网络监听-Demo1",
                                          @"加载等待UI-默认-Demo2",
                                          @"加载等待UI-自定义动画-Demo3",
                                          @"加载等待UI-自定义动画+文字提示-Demo4",
                                          @"Toast提示-Demo5",
                                          @"下拉刷新-上拉加载更多-tableView才有效-Demo6",
                                          @"不带导航条 不带TabBar适配-Demo7",
                                          @"不带导航条 带tabBar-Demo8",
                                          @"既带导航条又带TabBar 适配-Demo9",
                                          ]
     ];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSArray *array  = @[@"Demo1ViewController",
                        @"Demo2ViewController",
                        @"Demo3ViewController",
                        @"Demo4ViewController",
                        @"Demo5ViewController",
                        @"Demo6ViewController",
                        @"Demo7ViewController",
                        @"Demo8ViewController",
                        @"Demo9ViewController",
                        ];
    
    Class class =   NSClassFromString(array[indexPath.row]);
    UIViewController *ctrl = [[class alloc]init];
    if ( indexPath.row == 5 || indexPath.row == 6 ) {
        ctrl.hidesBottomBarWhenPushed = YES;
    }
    ctrl.title = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:ctrl animated:YES];
}

@end
