///
/// Created by yun on 2017/4/25.
/// Copyright (c) 2017 yun. All rights reserved.
///

#import <Foundation/Foundation.h>

@interface YunAppItem : NSObject

+ (UIWindow *)appWindow;

+ (UIWindow *)getCurWindow;

/// 禁止手机睡眠
+ (void)stopIdle;

/// 是否可以打开设置页面
+ (BOOL)canOpenSystemSetting;

/// 调至app设置界面
+ (void)gotoSettingView;

/// 隐藏键盘
+ (void)hideKb;

/// 单位:M
+ (CGFloat)getCacheSize;

/// 清除缓存
- (void)clearCache;

/// 手机型号
+ (NSString *)getDeviceInfo;

+ (UIViewController *)getRootViewController;

+ (UIViewController *)getCurrentViewController;

/// 获取当前正在显示的控制器
+ (UIViewController *)getVisibleVcFrom:(UIViewController *)vc;

/// 跳转 app store 评论
+ (BOOL)gotoAppStoreComment;

/// 跳转app store
+ (BOOL)gotoAppStore;

+ (NSString *)appStoreUrl;

@end