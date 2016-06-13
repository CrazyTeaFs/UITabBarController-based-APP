//
//  NSDate+JHExtension.h
//  WeiBo
//
//  Created by gameloft on 16/6/1.
//  Copyright © 2016年 gameloft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (JHExtension)

/**
 *  返回一个NSDateComponents对象，这个对象保存了从from到NSDate当前对象中的时间的差值
 *
 *  @param from 起始时间
 *
 *  @return 返回包含from到当前NSDate对象中时间差值的NSDateComponets对象
 */
- (NSDateComponents *)jh_deltaDateFrom:(NSDate *)from;

/**
 *  判断当前日期与NSDate对象中的日期是否在同一年
 *
 *  @return 同年返回true 否则返回false
 */
- (BOOL)jh_isThisYear;

/**
 *  判断当前日期与NSDate对象中的日期差值来确定是否是昨天
 *
 *  @return 是昨天返回true 否则返回false
 */
- (BOOL)jh_isYesterday;

/**
 *  判断是否是今天之内。通过判断当前的年月日与NSDate对象中的年月日是否相等来实现
 *
 *  @return 同一天返回true 否则返回false
 */
- (BOOL)jh_isToday;

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
- (void)jh_setReportTimeToLabel:(UILabel *)label time:(NSString *)time;

@end
