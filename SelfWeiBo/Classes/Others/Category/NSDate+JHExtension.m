//
//  NSDate+JHExtension.m
//  WeiBo
//
//  Created by gameloft on 16/6/1.
//  Copyright © 2016年 gameloft. All rights reserved.
//

#import "NSDate+JHExtension.h"

@implementation NSDate (JHExtension)

/**
 *  返回一个NSDateComponents对象，这个对象保存了从from到NSDate当前对象中的时间的差值
 *
 *  @param from 起始时间
 *
 *  @return 返回包含from到当前NSDate对象中时间差值的NSDateComponets对象
 */
- (NSDateComponents *)jh_deltaDateFrom:(NSDate *)from
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                            | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    return [calendar components:unit fromDate:from toDate:self options:kNilOptions];

}

/**
 *  判断当前日期与NSDate对象中的日期是否在同一年
 *
 *  @return 同年返回true 否则返回false
 */
- (BOOL)jh_isThisYear
{
    /** 取得当前日历类对象*/
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    /** 取出年份*/
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    
    return nowYear == selfYear;
}

/**
 *  判断是否是今天之内。通过判断当前的年月日与NSDate对象中的年月日是否相等来实现
 *
 *  @return 同一天返回true 否则返回false
 */
- (BOOL)jh_isToday
{
    /** 取得当前日历类对象*/
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return nowCmps.year == selfCmps.year
    && nowCmps.month == selfCmps.month
    && nowCmps.day == selfCmps.day;
}

/**
 *  判断当前日期与NSDate对象中的日期差值来确定是否是昨天
 *
 *  @return 是昨天返回true 否则返回false
 */
- (BOOL)jh_isYesterday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    /** 通过formatter把NSDate对象转换成string，去掉时分秒的干扰，相当于去比较2015-12-31 00:00:00 与 2016-01-01 00:00:00 是否满足1天的时间差*/
    NSDate *nowDate = [fmt dateFromString:[fmt stringFromDate:[NSDate date]]];
    NSDate *selfDate = [fmt dateFromString:[fmt stringFromDate:self]];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:kNilOptions];
    
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == 1;
}

/**
 *  格式化时间并显示。
    昨天 20:23:33
    刚刚
    一分钟前
    50分钟前
    2015-5-2 20:32:21
 如果时间不在今年，那么不格式化时间。如果时间在今年，是在今天之内，显示多少小时前发布，多少分钟前发布，昨天多少时分秒发布的或者多少个月前发布的。
 *
 *  @param label 需要设置时间文本的label
 *  @param time  服务器传回来的时间
 */
- (void)jh_setReportTimeToLabel:(UILabel *)label time:(NSString *)time
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate *create_time = [fmt dateFromString:time];
    
    if (create_time.jh_isThisYear) {
        if (create_time.jh_isToday) {
            NSDateComponents *cmps = [[NSDate date] jh_deltaDateFrom:create_time];
            
            if (cmps.hour >= 1) {
                /** 时间大于一个小时，但是在今天之内*/
                label.text = [NSString stringWithFormat:@"%zd小时前", cmps.hour];
            } else if (cmps.minute >= 1) {
                /** 大于一分钟，但是小于一小时*/
                label.text = [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
            } else {
                /** 小于一分钟，但是在今天之内*/
                label.text = @"刚刚";
            }
        } else if (create_time.jh_isYesterday){
            /** 昨天发布的*/
            fmt.dateFormat = @"昨天: HH:mm:ss";
            label.text = [fmt stringFromDate:create_time];
        } else {
            /** 今年之内发布，但是是几天前了*/
            fmt.dateFormat = @"MM-dd HH:mm:ss";
            label.text = [fmt stringFromDate:create_time];
        }
    } else {
        /** 非今年发布*/
        fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        label.text = [fmt stringFromDate:create_time];
    }
}

@end
