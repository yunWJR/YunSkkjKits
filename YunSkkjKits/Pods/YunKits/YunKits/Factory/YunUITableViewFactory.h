//
// Created by yun on 2017/5/15.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunUITableViewFactory : NSObject

+ (UITableView *_Nullable)tvWithTg:(id _Nullable)target
                           classes:(NSArray *_Nullable)classes
                               ids:(NSArray *_Nullable)ids;

+ (UITableView *_Nullable)tvWithTg:(id _Nullable)target
                         classItem:(Class _Nullable)cellClass
                               ids:(NSArray *_Nullable)ids;

@end