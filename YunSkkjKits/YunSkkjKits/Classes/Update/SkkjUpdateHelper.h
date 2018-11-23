//
// Created by yun on 2017/8/15.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SkkjUpdateHelper : NSObject

@property (nonatomic, copy) NSString *checkVersionUrl;

@property (nonatomic, copy) NSString *versionCacheFileName;

@property (nonatomic, copy) void (^block)(BOOL canEnter, BOOL shouldCloseApp);

+ (SkkjUpdateHelper *)instance;

- (void)checkUpdate:(void (^)(BOOL canEnter, BOOL shouldCloseApp))rst;

- (void)showMustUpdateView;

@end