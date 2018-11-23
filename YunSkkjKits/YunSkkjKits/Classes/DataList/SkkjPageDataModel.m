//
// Created by yun on 16/12/21.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <Mantle/MTLModel.h>
#import <MJRefresh/MJRefreshHeader.h>
#import "MJRefreshFooter.h"
#import "SkkjPageDataModel.h"
#import "UIView+YunAdd.h"

@implementation SkkjPageDataModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    NSMutableDictionary *mapping = [[NSDictionary mtl_identityPropertyMapWithModel:self] mutableCopy];
    return mapping;
}

+ (instancetype)modelWithMTLObject:(id)obj {
    if ([obj isKindOfClass:MTLModel.class]) {
        NSDictionary *objDic = ((MTLModel *) obj).dictionaryValue;
        NSError *error;
        SkkjPageDataModel *model = [MTLJSONAdapter modelOfClass:SkkjPageDataModel.class
                                             fromJSONDictionary:objDic
                                                          error:&error];

        if (error) {
            return nil;
        }
        else {
            return model;
        }
    }
    else {
        return nil;
    }
}

+ (BOOL)isNoMoreDataWithMTLPageObject:(id)obj {
    SkkjPageDataModel *model = [self modelWithMTLObject:obj];
    if (model) {
        if (model.pageNum < model.pages) {
            return NO;
        }
    }

    return YES;
}

- (BOOL)hasNoMoreData {
    return self.isLastPage;
}

- (void)setFooterState:(UIScrollView *)footerView {
    if (footerView.mj_header != nil) {
        [footerView.mj_header endRefreshing];
    }

    if (footerView.mj_footer == nil) {return;}

    if (self.hasNoMoreData) {
        [footerView.mj_footer endRefreshingWithNoMoreData];
    }
    else {
        [footerView.mj_footer endRefreshing];
    }

    footerView.mj_footer.hidden = footerView.contentSize.height < footerView.height;
}

@end