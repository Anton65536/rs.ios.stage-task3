#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    
    if (monthNumber < 12 && monthNumber > 0) {
        return [df monthSymbols][monthNumber - 1];
    }
    return  nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.locale = [NSLocale localeWithLocaleIdentifier: @"ru_BY"];
    df.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    
    return [calendar component:NSCalendarUnitDay fromDate:[df dateFromString:date]];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    df.locale = [[NSLocale alloc] initWithLocaleIdentifier: @"ru_BY"];
    int day = [[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian] component: NSCalendarUnitWeekday fromDate:date];
    if (day) {
        return [df shortWeekdaySymbols][day - 1];
    }
    return nil;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
   
    if ([calendar components:NSCalendarUnitWeekOfYear fromDate:[NSDate now]].weekOfYear == [calendar components:NSCalendarUnitWeekOfYear fromDate:date].weekOfYear) {
        return YES;
    }
    
        return NO;
}

@end
