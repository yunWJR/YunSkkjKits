//
// Created by yun on 2017/8/15.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import <YunBaseApp/YunRqtUrlHelper.h>
#import "YunSystemMediaHelper.h"
#import "SkkjUpdateHelper.h"
#import "SkkjUpdateRqt.h"
#import "SkkjVersionModel.h"
#import "YunCacheFileHelper.h"
#import "YunAlertViewHelper.h"
#import "YunValueVerifier.h"

@interface SkkjUpdateHelper () {
    SkkjVersionModel *_data;
}

@end

@implementation SkkjUpdateHelper

+ (SkkjUpdateHelper *)instance {
    static SkkjUpdateHelper *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _versionCacheFileName = @"YunSkkjVersionCache";
        [self loadCache];
    }

    return self;
}

- (void)loadCache {
    _data = [YunCacheFileHelper.instance getItemTaskByName:_versionCacheFileName];
}

- (void)checkUpdate:(void (^)(BOOL canEnter, BOOL shouldCloseApp))rst {
    SkkjUpdateRqt *rqt = [SkkjUpdateRqt new];

    [rqt checkVersion:self.checkUrl success:^(SkkjVersionModel *model) {
        if (model.hasNewVersion) {
            if (model.mustUpdate) {
                [[YunAlertViewHelper instance] showYes:
                         [NSString stringWithFormat:@"检测到新版本%@, 点击确定去更新\n\n%@", model.version, model.remark]
                                                result:^(BOOL yes) {
                                                    [YunSystemMediaHelper openURL:model.downloadUrl];

                                                    if (rst) rst(NO, YES);
                                                }];
            }
            else {
                if ([self isSameData:model dat2:_data]) {
                    return;
                }

                [[YunAlertViewHelper instance] showYesNo:
                         [NSString stringWithFormat:@"检测到新版本%@, 是否更新?\n\n%@", model.version, model.remark]
                                                  result:^(BOOL yes) {
                                                      if (yes) {
                                                          [YunSystemMediaHelper openURL:model.downloadUrl];
                                                          if (rst) rst(NO, YES);
                                                      }
                                                      else {
                                                          //[self initViews];
                                                      }
                                                  }];
            }

            if (rst) rst(YES, NO);
        }
        else {
            if (rst) rst(YES, NO);
        }

        _data = model;
        [YunCacheFileHelper.instance saveItemTask:_data fileName:_versionCacheFileName];
    }         failure:^(YunErrorHelper *error) {
        if (rst) rst(YES, NO);
    }];
}

- (BOOL)isSameData:(SkkjVersionModel *)data1 dat2:(SkkjVersionModel *)data2 {
    if (data1 && data2) {
        return [data1 isSameItem:data2];
    }

    return NO;
}

- (void)showMustUpdateView {
    SkkjUpdateRqt *rqt = [SkkjUpdateRqt new];

    [rqt checkVersion:self.checkUrl success:^(SkkjVersionModel *model) {
        if (model.hasNewVersion) {
            if (model.mustUpdate) {
                [[YunAlertViewHelper instance] showYes:
                         [NSString stringWithFormat:@"检测到新版本%@, 点击确定去更新\n\n%@", model.version, model.remark]
                                                result:^(BOOL yes) {
                                                    [YunSystemMediaHelper openURL:model.downloadUrl];

                                                    if (_block) _block(NO, YES);
                                                }];
            }
            else {
                if ([self isSameData:model dat2:_data]) {
                    return;
                }

                [[YunAlertViewHelper instance] showYesNo:
                         [NSString stringWithFormat:@"检测到新版本%@, 是否更新?\n\n%@", model.version, model.remark]
                                                  result:^(BOOL yes) {
                                                      if (yes) {
                                                          [YunSystemMediaHelper openURL:model.downloadUrl];
                                                          if (_block) _block(NO, YES);
                                                      }
                                                      else {
                                                          //[self initViews];
                                                      }
                                                  }];
            }

        }
        else {
        }

        _data = model;
        [YunCacheFileHelper.instance saveItemTask:_data fileName:_versionCacheFileName];
    }         failure:^(YunErrorHelper *error) {
    }];
}

- (NSString *)checkUrl {
    if ([YunValueVerifier isValidStr:_checkVersionUrl]) {
        return _checkVersionUrl;
    }

    return [YunRqtUrlHelper urlCmBaseApi:@"checkVersion"];
}

@end
