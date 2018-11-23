//
// Created by yun on 2017/8/28.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SkkjVersionModel;
@class YunErrorHelper;

@interface SkkjUpdateRqt : NSObject

- (void)checkVersion:(NSString *)url
             success:(void (^)(SkkjVersionModel *data))success
             failure:(void (^)(YunErrorHelper *error))failure;

@end