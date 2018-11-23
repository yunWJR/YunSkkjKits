//
// Created by yun on 2017/9/22.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "UIViewController+Nag.h"
#import "YunSizeHelper.h"
#import "Masonry.h"
#import "YunConfig.h"
#import "YunSystemHelper.h"

@implementation UIViewController (Nag)

- (UIView *)createTitleView {
    return [self createTitleView:YunConfig.instance.nagItemWidth];
}

- (UIView *)createTitleView:(CGFloat)itemW {
    UIView *tV = [UIView new];

    CGFloat tW = YunSizeHelper.screenWidth - itemW * 2;
    CGFloat tH = YunSizeHelper.navigationBarHeight;

    tV.frame = CGRectMake(0, 0, tW, tH);

    if ([YunSystemHelper sysVerGreater_Equal:@"11.0"]) {
        [tV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(tW));
            make.height.equalTo(@(tH));
        }];
    }
    else { // iOS11以下 无需
    }

    self.navigationItem.titleView = tV;

    return tV;
}

@end