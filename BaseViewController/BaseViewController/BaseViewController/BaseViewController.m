//
//  BaseViewController.m
//  BaseViewController
//
//  Created by dengyanzhou on 15/8/27.
//  Copyright (c) 2015年 YiXingLvDong. All rights reserved.
//

#import "BaseViewController.h"
#import "Reachability.h"
#import "AppDelegate.h"
#import "UIView+Toast.h"

@implementation NetWorkLoadIngView
@end

@implementation NetWorkChangeView

@end

@interface BaseViewController ()

@property (nonatomic,strong) NetWorkChangeView  *netWorkChageView;
@property (nonatomic,strong) NetWorkLoadIngView *netWorkLoadIngView;
@end

@implementation BaseViewController
@synthesize fitViewType     = _fitViewType ;
@synthesize viewToTop       = _viewToTop;
@synthesize viewToBottom    = _viewToBottom;
@synthesize isOpenNetListen = _isOpenNetListen;
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
    [self fitViewWithFitViewType:self.fitViewType];
     self.isOpenNetListen = YES;
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
{ self.isOpenNetListen = NO;
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
- (void)fitViewWithFitViewType:(FitViewType)fitViewType
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
                if (self.navigationController.navigationBar.isTranslucent) {
                    _viewToTop = 20;
                //判断有没有背景图片
                UIImage *image = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
                    if (image) {
                        _viewToTop = 64;
                    }
                //导航条不透明
                }else{
                    self.extendedLayoutIncludesOpaqueBars = YES;
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
                if (self.navigationController.navigationBar.isTranslucent) {
                    _viewToTop = 20;
                    //判断有没有背景图片
                    UIImage *image = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
                    if (image) {
                        _viewToTop = 64;
                    }
                }else{
                    self.extendedLayoutIncludesOpaqueBars = YES;
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
                          if (self.navigationController.navigationBar.isTranslucent) {
                              _viewToTop = 20;
                              //判断有没有背景图片
                              UIImage *image = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
                              if (image) {
                                  _viewToTop = 64;
                              }
                          }else{
                              self.extendedLayoutIncludesOpaqueBars = YES;
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
                if (self.navigationController.navigationBar.isTranslucent) {
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
                if (self.navigationController.navigationBar.isTranslucent) {
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
                          if (self.navigationController.navigationBar.isTranslucent) {
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
  //TODO: 子类重写
}
- (FitViewType)fitViewType
{
    _fitViewType = FitViewTypeDefault;
    return _fitViewType;
    //TODO: 子类需要哪种就写哪种 默认是第一种
}
#pragma mark - 网络加载UI
- (void)showLoadingUIWithNetWorkLoadType:(NetWorkLoadType)netWorkLoadType
                       andImageAnimation:(NSArray *)imageAnimationArray
                           andPromptText:(NSString *)promptText
{
    switch (netWorkLoadType) {
        case NetWorkLoadTypeDefault: {
            
            break;
        }
        case NetWorkLoadTypeImageAnimation: {
            
            break;
        }
        case NetWorkLoadTypeImageAnimationAndPromptText: {
            
            break;
        }
        default: {
            break;
        }
    }

}
- (void)showCustomLoadingUI
{

}
- (void)hideLoadingUI
{
    if (_netWorkLoadIngView && !_netWorkLoadIngView.hidden) {
        _netWorkLoadIngView.hidden = YES;
    }
}
- (void)showPromptTextUIWithPromptText:(NSString *)PromptText
                                 title:(NSString*)title
                           andDuration:(NSTimeInterval)interval
{
   
    if (interval == 0) {
        interval = 3;
    }
    [self.view makeToast:PromptText
                duration:interval
                position:CSToastPositionBottom
                   title:title];

}
- (void)showAlertViewWithMessage:(NSString *)message
                        andTitle:(NSString *)title
                     andDelegate:(id<UIAlertViewDelegate>)delegate
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title
                                                       message:message
                                                      delegate:delegate
                                             cancelButtonTitle:@"取消"
                                             otherButtonTitles:@"确定", nil];
    [alertView show];
}
#pragma mark - 打开网络监听
- (void)setIsOpenNetListen:(BOOL)isOpenNetListen
{   _isOpenNetListen = isOpenNetListen;
    if (_isOpenNetListen) {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification object:nil];
    }else{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:kReachabilityChangedNotification
                                                  object:nil];
    }
}

- (void)reachabilityChanged:(NSNotification *)note
{   
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    Reachability *curReach = [note object];
    switch ([curReach currentReachabilityStatus]) {
        case NotReachable:{
            self.netWorkChageView.text = @"网络不可用,亲!";
            appDelegate.isHaveNet = NO;
            }
            break;
        case ReachableViaWiFi:{
        }
        case ReachableViaWWAN:{
            self.netWorkChageView.text = @"网络已链接^^!";
            appDelegate.isHaveNet = YES;
            [UIView animateWithDuration:1 animations:^{
                self.netWorkChageView.alpha = 0;
            } completion:^(BOOL finished) {
                self.netWorkChageView.hidden = YES;
            }];
        }
            break;
        default:
            break;
    }
}
- (NetWorkChangeView *)netWorkChageView
{
    if (!_netWorkChageView) {
        //判断当前的容器为导航控制器
        CGFloat start_Y = 64;
        BOOL currentContainer_Nav = YES;
        if (self.navigationController) {
            //导航控制器隐藏
            if (self.navigationController.isNavigationBarHidden) {
                start_Y = 20;
            }
            //当前的容器不是导航控制器
        }else{
            start_Y = 20;
            currentContainer_Nav = NO;
        }
        self.netWorkChageView = ({
            NetWorkChangeView *changeView = [[NetWorkChangeView alloc]initWithFrame:CGRectMake(0, start_Y,self.view.frame.size.width , 30)];
            changeView.layer.borderColor =  [UIColor purpleColor].CGColor;
            changeView.layer.borderWidth = 1;
            changeView.backgroundColor = [UIColor whiteColor];
            changeView.textColor = [UIColor redColor];
            changeView.textAlignment = NSTextAlignmentCenter;
            changeView.font = [UIFont boldSystemFontOfSize:14];
        
            if (currentContainer_Nav) {
                [self.navigationController.view addSubview:changeView];
            }else{
                [self.view addSubview:changeView];
                [self.view bringSubviewToFront:changeView];
            }
            changeView;
        });
    }
    _netWorkChageView.alpha = 1;
    _netWorkChageView.hidden =  NO;
    return _netWorkChageView;
}
@end
