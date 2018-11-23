//
// Created by yun on 16/6/28.
// Copyright (c) 2017 yun. All rights reserved.
//

//六位数字地址码，八位数字出生日期码，三位数字顺序码和一位数字校验码。
//static NSUInteger addressLen  = 6;
//static NSUInteger birthdayLen = 8;
//static NSUInteger sxCodeLen = 3;
/*
 1、将前面的身份证号码17位数分别乘以不同的系数。从第一位到第十七位的系数分别为：7－9－10－5－8－4－2－1－6－3－7－9－10－5－8－4－2。
 2、将这17位数字和系数相乘的结果相加。
 3、用加出来和除以11，看余数是多少？
 4、余数只可能有0－1－2－3－4－5－6－7－8－9－10这11个数字。其分别对应的最后一位身份证的号码为1－0－X －9－8－7－6－5－4－3－2。
 5、通过上面得知如果余数是3，就会在身份证的第18位数字上出现的是9。如果对应的数字是2，身份证的最后一位号码就是罗马数字x。
 例如：某男性的身份证号码为【53010219200508011x】， 我们看看这个身份证是不是合法的身份证。
 首先我们得出前17位的乘积和【(5*7)+(3*9)+(0*10)+(1*5)+(0*8)+(2*4)+(1*2)+(9*1)+(2*6)+(0*3)+(0*7)+(5*9)+(0*10)+(8*5)+(0*8)+(1*4)+(1*2)】是189，然后用189除以11得出的结果是189/11=17----2，也就是说其余数是2。最后通过对应规则就可以知道余数2对应的检验码是X。所以，可以判定这是一个正确的身份证号码。
 */

#import "YunIdCardHelper.h"
#import "YunValueVerifier.h"

@interface YunIdCardHelper ()

@property (nonatomic, strong) NSArray *validateCode;
@property (nonatomic, strong) NSArray *digits;
@property (nonatomic, strong) NSDictionary *zoneCode;

@end

@implementation YunIdCardHelper

+ (BOOL)isValidIdCard:(NSString *)idCard {
    return [[self alloc] validateIDCard:idCard];
}

- (BOOL)validateIDCard:(NSString *)identityCard {
    BOOL flag;
    if ([YunValueVerifier isInvalidStr:identityCard]) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex2];
    if ([identityCardPredicate evaluateWithObject:identityCard]) {
        if ([self checkCode:identityCard]) {
            return YES;
        }
    }
    return NO;
}

- (NSArray *)validateCode {
    return @[@7, @9, @10, @5, @8, @4, @2, @1, @6, @3, @7, @9, @10, @5, @8, @4, @2];
}

- (NSArray *)digits {
    return @[@1, @0, @10, @9, @8, @7, @6, @5, @4, @3, @2];
}

- (NSDictionary *)zoneCode {
    if (!_zoneCode) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ZoneCode" ofType:@"json"];
        NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:nil];
        _zoneCode = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
    }
    return _zoneCode;
}

- (BOOL)checkCode:(NSString *)code {
    NSInteger sum = 0;
    for (NSInteger i = 0; i < self.validateCode.count; i++) {
        sum +=
                ((NSNumber *) self.validateCode[i]).integerValue *
                [code substringWithRange:NSMakeRange(i, 1)].integerValue;
    }
    int remainder = (int) fmod(sum, 11);

    NSString *last = [code substringFromIndex:code.length - 1];

    if ([[last lowercaseString] isEqual:@"x"]) {
        last = @"10";
    }
    NSInteger lastNum = last.integerValue;

    return ((NSNumber *) self.digits[remainder]).integerValue == lastNum;
}

+ (NSString *)birthdayStrFromIdentityCard:(NSString *)idCard {
    NSMutableString *result = [NSMutableString stringWithCapacity:0];
    NSString *year = nil;
    NSString *month = nil;

    BOOL isAllNumber = YES;
    NSString *day = nil;
    if ([idCard length] < 14) {
        return result;
    }

    //**截取前14位
    NSString *fontNumer = [idCard substringWithRange:NSMakeRange(0, 13)];

    //**检测前14位否全都是数字;
    const char *str = [fontNumer UTF8String];
    const char *p = str;
    while (*p != '\0') {
        if (!(*p >= '0' && *p <= '9')) {
            isAllNumber = NO;
        }
        p++;
    }
    if (!isAllNumber) {
        return result;
    }

    year = [idCard substringWithRange:NSMakeRange(6, 4)];
    month = [idCard substringWithRange:NSMakeRange(10, 2)];
    day = [idCard substringWithRange:NSMakeRange(12, 2)];

    [result appendString:year];
    [result appendString:@"-"];
    [result appendString:month];
    [result appendString:@"-"];
    [result appendString:day];
    return result;
}

//根据身份证号性别
+ (NSInteger)getIdCardSex:(NSString *)idCard {
    if ([YunValueVerifier isInvalidStr:idCard]) {return 0;}

    int sexInt = [[idCard substringWithRange:NSMakeRange(16, 1)] intValue];

    if (sexInt % 2 != 0) {
        return 1;
    }
    else {
        return 2;
    }
}

//根据省份证号获取年龄
+ (NSString *)getIdCardAge:(NSString *)idCard {
    if ([YunValueVerifier isInvalidStr:idCard]) {return @"";}

    NSDateFormatter *formatterTow = [[NSDateFormatter alloc] init];
    [formatterTow setDateFormat:@"yyyy-MM-dd"];
    NSString *dateStr = [self birthdayStrFromIdentityCard:idCard];
    NSDate *bsyDate = [formatterTow dateFromString:dateStr];

    NSTimeInterval dateDiff = [bsyDate timeIntervalSinceNow];

    int age = (int) (trunc(dateDiff / (60 * 60 * 24)) / 365);

    return [NSString stringWithFormat:@"%d", -age];
}

@end