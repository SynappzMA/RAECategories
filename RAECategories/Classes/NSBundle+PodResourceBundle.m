//
//  NSBundle+PodResourceBundle.m
//  Pods
//
//  Created by Roy Derks on 14/06/2017.
//
//

#import "NSBundle+PodResourceBundle.h"

@implementation NSBundle (PodResourceBundle)

+(NSBundle *)podResourceBundleWithName:(NSString*)name class:(Class)c
{
    NSString *bundlePath = [[NSBundle bundleForClass:c] pathForResource:name ofType:@"bundle"];
    return [NSBundle bundleWithPath:bundlePath];
}

@end
