//
//  NSDateFormatter+_4HourClock.m
//  RAECategories
//
//  Created by Roy on 24/10/2017.
//

#import "NSDateFormatter+ClockType.h"

@implementation NSDateFormatter (ClockType)

+(BOOL)clockIs24HourFormat {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterNoStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    NSString *dateString = [formatter stringFromDate:[NSDate date]];
    NSRange amRange = [dateString rangeOfString:[formatter AMSymbol]];
    NSRange pmRange = [dateString rangeOfString:[formatter PMSymbol]];
    BOOL is24Hour = amRange.location == NSNotFound && pmRange.location == NSNotFound;
    return is24Hour;
}

@end
