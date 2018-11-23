//
// Created by yun on 2017/8/2.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSInteger {
    GenderUnknown = 0,
    GenderMale = 1,
    GenderFemale = 2,
    GenderNone = 3,
} GenderType;

@interface SkkjGenderHelper : NSObject

+ (NSString *)getGenderTxt:(NSInteger)gender;

+ (NSString *)getGenderTxtByIdTxt:(NSString *)genderId;

+ (GenderType)getGenderTypeByIdTxt:(NSString *)idTxt;

+ (NSString *)getGenderTxtByType:(GenderType)type;

+ (GenderType)getGenderTypeByTxt:(NSString *)txt;

@end