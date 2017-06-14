//
//  NSBundle+PodResourceBundle.h
//  Pods
//
//  Created by Roy Derks on 14/06/2017.
//
//

#import <Foundation/Foundation.h>

@interface NSBundle (PodResourceBundle)

+(NSBundle *)podResourceBundleWithName:(NSString*)name class:(Class)c;

@end
