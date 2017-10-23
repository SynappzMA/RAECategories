//
//  UIAlertController+Fast.m
//  RAECategories
//
//  Created by Roy on 23/10/2017.
//

#import "UIAlertController+Fast.h"

@implementation UIAlertController (Fast)

#pragma mark - Messages

+(void)showMessage:(NSString *)message fromViewController:(UIViewController *)viewController
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"alert_ok", @"") style:UIAlertActionStyleDefault handler:nil]];
    [viewController presentViewController:alertController animated:true completion:nil];
    CFRunLoopWakeUp(CFRunLoopGetCurrent());
}

+(void)showMessage:(NSString *)title message:(NSString *)message fromViewController:(UIViewController *)viewController
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"alert_ok", @"") style:UIAlertActionStyleDefault handler:nil]];
    [viewController presentViewController:alertController animated:true completion:nil];
    CFRunLoopWakeUp(CFRunLoopGetCurrent());
}

+(void)showMessage:(NSString *)title message:(NSString *)message actions:(NSArray<UIAlertAction*>*)actions fromViewController:(UIViewController *)viewController
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    for(UIAlertAction *action in actions) {
        [alertController addAction:action];
    }
    [viewController presentViewController:alertController animated:true completion:nil];
    CFRunLoopWakeUp(CFRunLoopGetCurrent());
}

@end
