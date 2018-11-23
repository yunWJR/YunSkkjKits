//
// Created by yun on 2017/8/28.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import <Mantle/MTLModel.h>
#import <Mantle/Mantle.h>

@interface SkkjVersionModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *version;
@property (nonatomic, copy) NSString *downloadUrl;
@property (nonatomic, copy) NSString *remark;

@property (nonatomic, assign) BOOL hasNewVersion;

@property (nonatomic, assign) BOOL mustUpdate;

+ (instancetype)modelWithData:(id)data;

- (BOOL)isSameItem:(SkkjVersionModel *)item;

@end