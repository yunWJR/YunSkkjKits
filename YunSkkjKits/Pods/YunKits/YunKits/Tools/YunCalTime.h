//
//  Created by yiliu on 16/4/13.
//  Copyright © 2016年 mushoom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YunCalTime : NSObject

/**
 *获取当前日期
 */
+ (NSDictionary *)calculationNowTime;

/**
 *设置默认时间
 */
+ (NSDictionary *)calculationDefaultTime:(NSString *)defaultTime;

/**
 *获取年
 */
+ (NSArray *)calculationYear;

/**
 *获取月
 */
+ (NSArray *)calculationMonth;

/**
 *根据月份获取天数
 */
+ (NSArray *)calculationDay:(NSString *)year andMonth:(NSString *)month;

/**
 *获取时
 */
+ (NSArray *)calculationHH;

/**
 *获取分
 */
+ (NSArray *)calculationMM;

/**
 *根据时间获取星期几
 */
+ (NSString *)ObtainWeek:(NSString *)day andMonth:(NSString *)month andYear:(NSString *)year;

/**
 *把阳历转换成农历
 */
+ (NSString *)getChineseCalendarWithDate:(NSString *)dateStr;

+ (NSDictionary *)getChineseCalendarWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

/**
 *根据月份获取天数（周末变红色字体）
 */
+ (NSArray *)calculationDay2:(NSString *)iyear andMonth:(NSString *)month;

@end
