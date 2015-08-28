//
//  BaseTableViewController.h
//  BaseViewController
//
//  Created by dengyanzhou on 15/8/28.
//  Copyright (c) 2015年 YiXingLvDong. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
/**tableView*/
@property (nonatomic, strong,readonly) UITableView *tableView;
/**数据源*/
@property (nonatomic, strong) NSMutableArray *dataArray;
//*****************是否开启头部刷新和脚部刷新 子类可在ViewDidLoad方法设置开启与否 默认都不开启******************************//
/**开启头部刷新*/
@property (nonatomic, assign)   BOOL isOpenHeaderRefresh;
/**开始脚部加载更多*/
@property (nonatomic, assign)   BOOL isOpenFooterRefresh;
//*****************************只有开启头部刷新和脚部刷新 下面的方法才被回调******************************//
/**头部刷新的回调子类重写*/
- (void)headerRefresh;
/**脚部帅新的回调子类重写*/
- (void)footerRefresh;

@end
