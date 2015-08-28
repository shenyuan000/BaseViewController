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
    //*****************************第一种方法******************************//
    if (fitViewType == FitViewTypeDefault) {
        //判断当前的容器为导航控制器
        if (self.navigationController && self.navigationController.tabBarController == nil) {
            //导航条隐藏了 或者导航条透明
            if (self.navigationController.isNavigationBarHidden) {
                _viewToTop = 20;
                _viewToBottom = 49;
                
            }else{
                if (self.navigationController.navigationBarHidden == NO) {
                    //导航条透明
                    if (self.navigationController.navigationBar.translucent) {
                        _viewToTop = 20;
                        _viewToBottom = 0;
                    }else{
                        _viewToTop = 64;
                        _viewToBottom = 0;
                    }
                }
            }
            //当前的容器是tabbar控制器
        }else if (self.navigationController == nil && self.tabBarController){
            _viewToTop = 20;
            //tabar隐藏
            if (self.hidesBottomBarWhenPushed) {
                _viewToBottom = 0;
            }else{
                _viewToTop = 49;
            }
            //当前的的容器根视图控制器是tabBar的控制器
        }else if (self.navigationController && self.navigationController.tabBarController){
            
            //导航条存在 tabbar存在
            if (self.navigationController.isNavigationBarHidden == NO && self.navigationController.tabBarController.tabBar.isHidden == NO) {
                _viewToBottom =  49;
                //导航条透明
                if (self.navigationController.navigationBar.translucent) {
                    _viewToTop = 20;
                }else{
                    _viewToTop = 64;
                }
                //导航条不存在 tarBar不存在
            }else if (self.navigationController.isNavigationBarHidden && self.navigationController.tabBarController.tabBar.isHidden){
                
                _viewToTop = 20;
                _viewToBottom = 0;
                
                //导航条存在 tarBar 不存在
            }else if (self.navigationController.isNavigationBarHidden == NO && (self.tabBarController.tabBar.isHidden || self.hidesBottomBarWhenPushed)){
                //导航条透明
                if (self.navigationController.navigationBar.translucent) {
                    _viewToTop = 20;
                }else{
                    _viewToTop = 0;
                }
                _viewToBottom = 0;
                //导航条不存在 tabbar 存在
            }else{
                
                _viewToTop = 20;
                _viewToBottom = 49;
            }
            
            //当前没有容器
        }else{
            _viewToTop =  20;
            _viewToBottom = 0;
        }
        //*****************************第二种方法******************************//
    }else{
        
        //判断当前的容器导航控制器
        if (self.navigationController && self.navigationController.tabBarController == nil) {
            
            //导航条隐藏了或者导航条是透明的
            if (self.navigationController.navigationBarHidden ||self.navigationController.navigationBar.translucent ) {
                self.edgesForExtendedLayout = UIRectEdgeAll;
                self.extendedLayoutIncludesOpaqueBars = YES;
                _viewToTop =  20;
                _viewToBottom = 0;
                //导航条没有隐藏或者不是透明的
            }else{
                self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeRight |  UIRectEdgeBottom;
                _viewToTop = 0;
                _viewToBottom = 0;
                
            }
            
            //当前的根视图是tarBar
        }else if (self.navigationController && self.navigationController.tabBarController){
            
            //导航条存在 tabBar存在
            if (self.navigationController.navigationBarHidden == NO
                && self.navigationController.tabBarController.tabBar.hidden == NO) {
                //导航条是否透明
                if (self.navigationController.navigationBar.translucent == YES) {
                    self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeRight |UIRectEdgeTop;
                    self.extendedLayoutIncludesOpaqueBars = YES;
                    _viewToTop = 20;
                    _viewToBottom = 0;
                }else{
                    self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeRight ;
                    self.extendedLayoutIncludesOpaqueBars = NO;
                    _viewToTop = 0;
                    _viewToBottom = 0;
                    
                }
                //导航条存在 tabbar不存在
            }else if (self.navigationController.isNavigationBarHidden == NO
                      && (self.navigationController.tabBarController.tabBar.hidden  || self.hidesBottomBarWhenPushed)){
                
                //导航条是否透明
                if (self.navigationController.navigationBar.translucent == YES) {
                    self.edgesForExtendedLayout = UIRectEdgeAll;
                    self.extendedLayoutIncludesOpaqueBars = YES;
                    _viewToTop = 20;
                    _viewToBottom = 0;
                }else{
                    self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeRight | UIRectEdgeBottom;
                    self.extendedLayoutIncludesOpaqueBars = NO;
                    _viewToTop = 0;
                    _viewToTop = 0;
                }
                //导航条不存在 tabbar存在
            }else if (self.navigationController.isNavigationBarHidden && self.navigationController.tabBarController.tabBar.hidden == NO && self.hidesBottomBarWhenPushed == NO){
                
                self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
                _viewToTop = 20;
                _viewToBottom = 0;
                //导航条不存在 tabar 也不存在
            }else{
                
                self.edgesForExtendedLayout = UIRectEdgeAll;
                _viewToTop = 20;
                _viewToBottom = 0;
            }
            
            //当前的视图控制器是tarbar
        }else if (self.navigationController == nil && self.tabBarController){
            if (self.tabBarController.tabBar.hidden ) {
                self.edgesForExtendedLayout = UIRectEdgeAll;
            }else{
                self.edgesForExtendedLayout = UIRectEdgeRight | UIRectEdgeLeft | UIRectEdgeTop;
            }
            _viewToTop = 20;
            _viewToBottom = 0;
            //没有容器
        }else{
            self.edgesForExtendedLayout = UIRectEdgeAll;
            self.extendedLayoutIncludesOpaqueBars = YES;
            _viewToTop = 20;
            _viewToBottom = 0;
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
