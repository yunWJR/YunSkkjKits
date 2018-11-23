//
// Created by yun on 2017/8/28.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "SkkjUpdateRqt.h"
#import "YunErrorHelper.h"
#import "YunRqtMg.h"
#import "SkkjVersionModel.h"
#import "YunRqtUrlHelper.h"

@implementation SkkjUpdateRqt

// GET /commons/getLastVersion 版本号
- (void)checkVersion:(NSString *)url
             success:(void (^)(SkkjVersionModel *data))success
             failure:(void (^)(YunErrorHelper *error))failure {
    YunRqtMg *rqMg = [YunRqtMg request];

    [rqMg GET:url
   parameters:[YunRqtUrlHelper getBasePara]
     progress:nil
      success:^(NSURLSessionDataTask *task, id responseObject) {
          YunRqtRpsHelper *rsp = [[YunRqtRpsHelper alloc] initWithRsp:responseObject];
          if ([rsp isSuccess]) {
              SkkjVersionModel *model = [SkkjVersionModel modelWithData:rsp.data];
              if (model) {
                  success(model);
              }
              else {
                  failure([YunErrorHelper modelError]);
              }
          }
          else {
              failure([YunErrorHelper itemWithRpsError:rsp]);
          }
      } failure:^(NSURLSessionDataTask *task, NSError *error) {
         failure([YunErrorHelper itemWithError:error]);
     }];
}

@end