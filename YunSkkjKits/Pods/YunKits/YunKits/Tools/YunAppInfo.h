///
/// Created by yun on 2016/11/24.
/// Copyright (c) 2017 yun. All rights reserved.
///

#import <Foundation/Foundation.h>

@interface YunAppInfo : NSObject

/// ---> version

/// 1.0.0
+ (NSString *)appVersion;

/// 100
+ (NSString *)appVersionStr;

/// 2.0.0 比较 1.0.0
+ (BOOL)shouldUpdate:(NSString *)serverVersion;

/// build version:1
+ (NSString *)bundleVersion;

/// <---

+ (NSString *)bundleIdentifier;

+ (NSString *)bundleDisplayName;

+ (NSString *)bundleName;

@end