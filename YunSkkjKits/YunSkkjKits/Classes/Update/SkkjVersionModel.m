//
// Created by yun on 2017/8/28.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import <Mantle/MTLModel.h>
#import "SkkjVersionModel.h"

@implementation SkkjVersionModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    NSMutableDictionary *mapping = [[NSDictionary mtl_identityPropertyMapWithModel:self] mutableCopy];

    mapping[@"version"] = @"newVersion";

    return mapping;
}

+ (instancetype)modelWithData:(id)data {
    NSError *modelErr;
    SkkjVersionModel *model = [MTLJSONAdapter modelOfClass:SkkjVersionModel.class
                                        fromJSONDictionary:data
                                                     error:&modelErr];

    if (modelErr) {return nil;}
    else {return model;}
}

- (BOOL)isSameItem:(SkkjVersionModel *)item {
    if (self.hasNewVersion != item.hasNewVersion) {
        return NO;
    }

    if (self.mustUpdate != item.mustUpdate) {
        return NO;
    }

    if (![self.version isEqualToString:item.version]) {
        return NO;
    }

    if (![self.downloadUrl isEqualToString:item.downloadUrl]) {
        return NO;
    }

    if (![self.remark isEqualToString:item.remark]) {
        return NO;
    }

    return YES;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;

    return self;
}

@end