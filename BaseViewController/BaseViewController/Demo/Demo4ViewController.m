//
//  Demo4ViewController.m
//  BaseViewController
//
//  Created by dengyanzhou on 15/8/31.
//  Copyright (c) 2015年 YiXingLvDong. All rights reserved.
//

#import "Demo4ViewController.h"

@interface Demo4ViewController ()

@end

@implementation Demo4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 1; i < 9; i++) {
        NSString *imageName = [NSString stringWithFormat:@"loading_%d",i];
        UIImage  *image = [UIImage imageNamed:imageName];
        [array addObject:image];
    }
    [self showLoadingUIWithNetWorkLoadType:NetWorkLoadTypeImageAnimationAndPromptText andImageAnimation:array andPromptText:@"正在玩命加载中,喝杯茶先!"];
  

    // Do any additional setup after loading the view.
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self hideLoadingUI];
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
