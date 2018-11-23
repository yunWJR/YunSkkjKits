//
// Created by yun on 2017/8/2.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "SkkjGenderHelper.h"
#import "YunValueHelper.h"

@interface SkkjGenderHelper () {
}

@end

@implementation SkkjGenderHelper

+ (NSString *)getGenderTxt:(NSInteger)gender {
    GenderType type = (GenderType) gender;

    return [self getGenderTxtByType:type];
}

+ (NSString *)getGenderTxtByIdTxt:(NSString *)genderId {
    GenderType type = [self getGenderTypeByIdTxt:genderId];

    return [self getGenderTxtByType:type];
}

+ (GenderType)getGenderTypeByIdTxt:(NSString *)idTxt {
    if ([idTxt isEqualToString:[YunValueHelper intStr:GenderMale]]) {
        return GenderMale;
    }

    if ([idTxt isEqualToString:[YunValueHelper intStr:GenderFemale]]) {
        return GenderFemale;
    }

    if ([idTxt isEqualToString:[YunValueHelper intStr:GenderUnknown]]) {
        return GenderUnknown;
    }

    return GenderNone;
}

+ (NSString *)getGenderTxtByType:(GenderType)type {
    switch (type) {
        case GenderUnknown:
            return @""; // 保密
            break;
        case GenderMale:
            return @"男";
            break;
        case GenderFemale:
            return @"女";
            break;
        case GenderNone:
            return @"";
            break;
    }

    return nil;
}

+ (GenderType)getGenderTypeByTxt:(NSString *)txt {
    if ([txt isEqualToString:@"男"]) {
        return GenderMale;
    }

    if ([txt isEqualToString:@"女"]) {
        return GenderFemale;
    }

    return GenderUnknown;
}

@end