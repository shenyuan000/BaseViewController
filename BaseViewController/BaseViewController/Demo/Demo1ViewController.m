//
//  Demo1ViewController.m
//  BaseViewController
//
//  Created by dengyanzhou on 15/8/31.
//  Copyright (c) 2015年 YiXingLvDong. All rights reserved.
//

#import "Demo1ViewController.h"

@interface Demo1ViewController ()

@end

@implementation Demo1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(100,10, 100, 20)];
    lable.text = @"断开或者开启网络 观看页面效果";
    lable.textColor = [UIColor redColor];
    [lable sizeToFit];
    lable.center = self.view.center;
    [self.view addSubview:lable];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**view将要显示 开启*/
- (void)viewWillAppear:(BOOL)animated
{
     self.isOpenNetListen = YES;
}
/**view将要消失 关闭*/
- (void)viewWillDisappear:(BOOL)animated
{
    self.isOpenNetListen = NO;
}
- (void)goNetNotUse:(UIButton *)sender
{
    [super goNetNotUse:sender];
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
