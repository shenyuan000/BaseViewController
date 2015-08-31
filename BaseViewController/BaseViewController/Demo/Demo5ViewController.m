//
//  Demo5ViewController.m
//  BaseViewController
//
//  Created by dengyanzhou on 15/8/31.
//  Copyright (c) 2015年 YiXingLvDong. All rights reserved.
//

#import "Demo5ViewController.h"

@interface Demo5ViewController ()

@end

@implementation Demo5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeTop | UIRectEdgeLeft | UIRectEdgeRight;
      UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100,20)];
    lable.text = @"请看界面底部";
    lable.textColor = [UIColor redColor];
    [lable sizeToFit];
    lable.center = self.view.center;
    [self.view addSubview:lable];
    [self showPromptTextUIWithPromptText:@"数据解析错误" title:nil andDuration:3];
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
