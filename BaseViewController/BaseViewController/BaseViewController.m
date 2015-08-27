//
//  BaseViewController.m
//  BaseViewController
//
//  Created by dengyanzhou on 15/8/27.
//  Copyright (c) 2015年 YiXingLvDong. All rights reserved.
//

#import "BaseViewController.h"

/**
 * 屏幕适配的两种方法
 */
typedef NS_ENUM(NSUInteger, FitViewType){
    FitViewTypeDefault = 0,
    FitViewTypeEdgesExtended,
};
@interface BaseViewController ()

@end

@implementation BaseViewController

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
    
    // Do any additional setup after loading the view, typically from a nib.
}
//视图将要出现
- (void)viewWillAppear:(BOOL)animated
{
}
//视图已经出现
- (void)viewDidAppear:(BOOL)animated
{
}
//视图将要消失
- (void)viewWillDisappear:(BOOL)animated
{
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
/**适配带导航和不带导航*/
- (void)fitView:(FitViewType)fitViewType
{
    //自动调整Insets关闭
    self.automaticallyAdjustsScrollViewInsets = NO;
    if (fitViewType == FitViewTypeDefault) {
        //有导航栏且导航栏没有隐藏
        if (self.navigationController
            && self.navigationController.isNavigationBarHidden == NO ) {
            //导航条不透明
            if (self.navigationController.navigationBar.translucent == NO) {
                _viewToTop = 64; //从导航条下面开始计算
                //导航条透明
            }else{
                _viewToTop = 20; //从状态条下面开始计算
            }
            //没有导航控制器或者导航控制器隐藏了
        }else{
            _viewToTop = 20;
        }
        
        //判断当前的容器如果是tabBarController
        if (self.tabBarController) {
            //判断tabBar是否隐藏
            if (self.tabBarController.tabBar.hidden) {
                _viewToBottom = 0;
            }else{
                _viewToBottom = 49;
            }
            //判断当前容器是导航控控制器且工具条存在
        }else if (self.navigationController
                  && self.navigationController.isToolbarHidden == NO
                  && self.navigationController.tabBarController == nil){
            _viewToBottom = 44;
            //判断当前根容器是tabBarController
        }else if (self.navigationController && self.navigationController.tabBarController){
            //tabbar隐藏了
            if (self.tabBarController.tabBar.hidden || self.hidesBottomBarWhenPushed) {
                _viewToBottom = 0;
            }else{
                _viewToBottom = 49;
            }
        }else{
            _viewToBottom = 0;
        }
     //第二种适配方法
    }else{
        //判断当前容器
        if (self.navigationController
            && self.navigationController.isNavigationBarHidden == NO
            && self.navigationController.toolbarHidden
            && self.navigationController.tabBarController == nil) {
            
            if (self.navigationController.navigationBar.translucent == NO) {
                self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeRight;
                //不扩展不透明的bar
                self.extendedLayoutIncludesOpaqueBars = NO;
                _viewToTop = 0;
            }else
            {
                self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeRight | UIRectEdgeTop;
                self.extendedLayoutIncludesOpaqueBars = YES;
                _viewToTop = 20;
            }
            _viewToBottom = 0;
        }else if (self.navigationController
                  && self.navigationController.isNavigationBarHidden == NO
                  && self.navigationController.toolbarHidden == NO
                  && self.navigationController.tabBarController == nil){
            self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeRight | UIRectEdgeTop;
            _viewToTop = 20;
            _viewToBottom = 0;
        }else if (self.navigationController){
        
        
        
        
        
        }
      
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
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
