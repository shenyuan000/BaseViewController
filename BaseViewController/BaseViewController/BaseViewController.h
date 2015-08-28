//
//  BaseViewController.h
//  BaseViewController
//
//  Created by dengyanzhou on 15/8/27.
//  Copyright (c) 2015年 YiXingLvDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
/**全屏布局视图开始的Y值*/
@property (nonatomic, assign,readonly) CGFloat viewToTop;
/**全局布局视图结束的Y值*/
@property (nonatomic, assign,readonly) CGFloat viewToBottom;
/**适配条件 留个接口子类继承重写*/
- (void)fitCondition;//填充适配的条件eg:导航条是否隐藏,导航条是否透明 tabBar是否隐藏
@end
