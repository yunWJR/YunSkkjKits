//
// Created by yun on 2017/6/29.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YunRgxHelper : NSObject

+ (BOOL)matchRgx:(NSString *)rgx ctn:(NSString *)ctn;

+ (NSString *)matchedCtnByRgx:(NSString *)rgx ctn:(NSString *)ctn;

@end