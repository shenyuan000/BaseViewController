//
//  AppDelegate.h
//  BaseViewController
//
//  Created by dengyanzhou on 15/8/27.
//  Copyright (c) 2015年 YiXingLvDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**全局标识有没有网络，每次请求接口时都要做次判断*/
@property (nonatomic, assign) BOOL isHaveNet;
/**网络监听者*/
@property (nonatomic, strong) Reachability *reach;
- (void)startNetListen;
@end

