//
//  BaseViewController.h
//  BaseViewController
//
//  Created by dengyanzhou on 15/8/27.
//  Copyright (c) 2015年 YiXingLvDong. All rights reserved.
//


#import <UIKit/UIKit.h>
/**
 * 屏幕适配的两种方法
 */
typedef NS_ENUM(NSUInteger, FitViewType){
    FitViewTypeDefault = 0,
    FitViewTypeEdgesExtended
};
/**
 *  网络加载等待类型
 */
typedef NS_ENUM(NSUInteger,NetWorkLoadType) {
    NetWorkLoadTypeDefault,
    NetWorkLoadTypeImageAnimation,
    NetWorkLoadTypeImageAnimationAndPromptText,
};
@interface NetWorkLoadIngView : UIImageView
@property (nonatomic, strong) NSArray *imageAnimationArray;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, copy) NSString *defaultPromptText;
@end

@interface NetWorkChangeView: UILabel

@end
@interface BaseViewController : UIViewController
/**全屏布局视图开始的Y值*/
@property (nonatomic, assign,readonly) CGFloat viewToTop;
/**全局布局视图结束的Y值*/
@property (nonatomic, assign,readonly) CGFloat viewToBottom;
/**哪种适配方式,子类重写,默认是第一种*/
@property (nonatomic, assign,readonly) FitViewType  fitViewType;
/**适配条件 留个接口子类继承重写*/
- (void)fitCondition;//填充适配的条件eg:导航条是否隐藏,导航条是否透明 tabBar是否隐藏
//*****************************网络加载UI******************************//
/**
 *  显示网络加载UI
 *
 *  @param netWorkLoadType     网络加载UI类型
 *  @param imageAnimationArray 动画数组
 *  @param promptText          提示文本
 */
- (void)showLoadingUIWithNetWorkLoadType:(NetWorkLoadType)netWorkLoadType
                        andImageAnimation:(NSArray*)imageAnimationArray
                            andPromptText:(NSString*)promptText;
- (void)hideLoadingUI;
/**留个接口让子类自己定义自己的网络加载UI*/
- (void)showCustomLoadingUI;
/**
 * 提示文本UI 一会自动隐藏
 *
 *  @param PromptText 提示的文本
 *  @param interval   多长时间以后自动隐藏
 */
- (void)showPromptTextUIWithPromptText:(NSString*)PromptText
                           andDuration:(NSTimeInterval)interval;
/**
 *  显示警告框
 *
 *  @param message  警告框内容
 *  @param title    警告框内容
 *  @param delegate 警告框的代理
 */
- (void)showAlertViewWithMessage:(NSString*)message
                        andTitle:(NSString*)title
                     andDelegate:(id<UIAlertViewDelegate>)delegate;
//*****************************网络监听UI-监听网络变化 在ViewWillAppear开启 在viewWillDisAppear在关闭*****************************//
/**是否监听网络变化*/
@property (nonatomic, assign) BOOL isOpenNetListen;

/**
 *  网络变化的回调
 *
 *  @param note reach发来的消息
 */
- (void)reachabilityChanged:(NSNotification *)note;

@end
