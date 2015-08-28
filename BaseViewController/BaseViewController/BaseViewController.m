//
//  BaseViewController.m
//  BaseViewController
//
//  Created by dengyanzhou on 15/8/27.
//  Copyright (c) 2015年 YiXingLvDong. All rights reserved.
//

#import "BaseViewController.h"

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
/**适配带导航和不带导航--带tabBar和不带tarbar的 self.view的布局*/
- (void)fitView:(FitViewType)fitViewType
{   //填充适配条件
    [self fitCondition];
    //自动调整Insets关闭
    self.automaticallyAdjustsScrollViewInsets = NO;
    //*****************************第一种方法******************************//
    if (fitViewType == FitViewTypeDefault) {
        //当前的容器为导航控制器
        if (self.navigationController && self.navigationController.tabBarController == nil) {
            _viewToBottom = 0;
            //导航条隐藏
            if (self.navigationController.isNavigationBarHidden) {
                _viewToTop = 20;
            //导航条显示
            }else{
                //导航条透明
                if (self.navigationController.navigationBar.translucent) {
                    _viewToTop = 20;
                //导航条不透明
                }else{
                    _viewToTop = 64;
                }
            }
        //当前的容器是tabBar控制器
        }else if (self.navigationController == nil && self.tabBarController){
            _viewToTop = 20;
            //tabBar隐藏
            if (self.tabBarController.tabBar.isHidden) {
                _viewToBottom = 0;
            //tabBar显示
            }else{
                _viewToBottom = 49;
            }
        //当前容器的容器是tabBar的控制器
        }else if (self.navigationController && self.navigationController.tabBarController){
            
            //导航条显示 tabBar显示
            if (self.navigationController.isNavigationBarHidden == NO
                && self.navigationController.tabBarController.tabBar.isHidden == NO) {
                _viewToBottom =  49;
                //导航条透明
                if (self.navigationController.navigationBar.translucent) {
                    _viewToTop = 20;
                }else{
                    _viewToTop = 64;
                }
            //导航条隐藏 tarBar隐藏
            }else if (self.navigationController.isNavigationBarHidden
                      && self.navigationController.tabBarController.tabBar.isHidden){
                
                _viewToTop = 20;
                _viewToBottom = 0;
                
            //导航条显示 tarBar隐藏
            }else if (self.navigationController.isNavigationBarHidden == NO
                      && (self.tabBarController.tabBar.isHidden
                          || self.hidesBottomBarWhenPushed)){
                          //导航条透明
                          if (self.navigationController.navigationBar.translucent) {
                              _viewToTop = 20;
                          }else{
                              _viewToTop = 64;
                          }
                          _viewToBottom = 0;
                          //导航条隐藏 tabBar显示
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
        
         _viewToBottom = 0;
        //1当前的容器是导航控制器
        if (self.navigationController && self.navigationController.tabBarController == nil) {
            
            //导航条隐藏
            if (self.navigationController.navigationBarHidden) {
                self.edgesForExtendedLayout = UIRectEdgeAll;
                self.extendedLayoutIncludesOpaqueBars = YES;
                _viewToTop =  20;

            //导航条没有隐藏
            }else{
                //导航条透明
                if (self.navigationController.navigationBar.translucent) {
                    self.edgesForExtendedLayout = UIRectEdgeAll;
                    self.extendedLayoutIncludesOpaqueBars = YES;
                    _viewToTop = 20;
                //导航条不透明
                }else{
                    self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeRight |  UIRectEdgeBottom;
                    self.extendedLayoutIncludesOpaqueBars = NO;
                    _viewToTop = 0;
                }
            }
        //2当前容器的容器是TabBarController
        }else if (self.navigationController && self.navigationController.tabBarController){
            
            //*****************************start******************************//
            //1）导航条显示 tabBar显示
            if (self.navigationController.isNavigationBarHidden == NO
                && self.navigationController.tabBarController.tabBar.isHidden == NO) {
                //导航条透明
                if (self.navigationController.navigationBar.translucent) {
                    self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeRight |UIRectEdgeTop;
                    self.extendedLayoutIncludesOpaqueBars = YES;
                    _viewToTop = 20;
                }else{
                    self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeRight ;
                    self.extendedLayoutIncludesOpaqueBars = NO;
                    _viewToTop = 0;
                }
            //2）导航条显示 tabBar隐藏
            }else if (self.navigationController.isNavigationBarHidden == NO
                      && (self.navigationController.tabBarController.tabBar.hidden
                          || self.hidesBottomBarWhenPushed)){
                          
                          //导航条透明
                          if (self.navigationController.navigationBar.translucent) {
                              self.edgesForExtendedLayout = UIRectEdgeAll;
                              self.extendedLayoutIncludesOpaqueBars = YES;
                              _viewToTop = 20;
                          //导航条不透明
                          }else{
                              self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeRight | UIRectEdgeBottom;
                              self.extendedLayoutIncludesOpaqueBars = NO;
                              _viewToTop = 0;
                          }
            //3）导航条隐藏 tabBar显示
            }else if (self.navigationController.isNavigationBarHidden
                                && (self.navigationController.tabBarController.tabBar.isHidden == NO
                                    || self.hidesBottomBarWhenPushed == NO)){
                                    self.edgesForExtendedLayout = UIRectEdgeTop | UIRectEdgeLeft | UIRectEdgeRight;
                                    self.extendedLayoutIncludesOpaqueBars= YES;
                                    _viewToTop = 20;
            //4）导航条隐藏 taBar隐藏
            }else{
                self.edgesForExtendedLayout = UIRectEdgeAll;
                _viewToTop = 20;
            }
            //*****************************end******************************//
            
        //3当前的容器tarBarController
        }else if (self.navigationController == nil && self.tabBarController){
            //tabBar隐藏
            if (self.tabBarController.tabBar.isHidden ) {
                self.edgesForExtendedLayout = UIRectEdgeAll;
            //tabBar显示
            }else{
                self.edgesForExtendedLayout = UIRectEdgeRight | UIRectEdgeLeft | UIRectEdgeTop;
            }
            _viewToTop = 20;
        //4没有容器
        }else{
            self.edgesForExtendedLayout = UIRectEdgeAll;
            self.extendedLayoutIncludesOpaqueBars = YES;
            _viewToTop = 20;
        }
    }
}
#pragma mark - 适配条件 留个接口子类继承重写
- (void)fitCondition
{

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
