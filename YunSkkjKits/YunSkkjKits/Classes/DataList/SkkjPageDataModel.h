//
// Created by yun on 16/12/21.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <Mantle/MTLModel.h>
#import <Mantle/Mantle.h>
#import <UIKit/UIKit.h>

@interface SkkjPageDataModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign) NSInteger pages;

@property (nonatomic, assign) NSInteger pageNum;

@property (nonatomic, assign) NSInteger pageSize;

@property (nonatomic, assign) NSInteger size;

@property (nonatomic, assign) NSInteger startRow;

@property (nonatomic, assign) NSInteger endRow;

//@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger prePage;

@property (nonatomic, assign) NSInteger nextPage;

@property (nonatomic, assign) BOOL isFirstPage;

@property (nonatomic, assign) BOOL isLastPage;

@property (nonatomic, assign) BOOL hasPreviousPage;

@property (nonatomic, assign) BOOL hasNextPage;

@property (nonatomic, assign) BOOL firstPage;

@property (nonatomic, assign) BOOL lastPage;

//@property (nonatomic, strong) id list;

+ (BOOL)isNoMoreDataWithMTLPageObject:(id)obj;

- (BOOL)hasNoMoreData;

- (void)setFooterState:(UIScrollView *)footerView;

@end