//
//  UIAlertController+Fast.h
//  RAECategories
//
//  Created by Roy on 23/10/2017.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Fast)

+(void)showMessage:(NSString *)message fromViewController:(UIViewController *)viewController;
+(void)showMessage:(NSString *)title message:(NSString *)message fromViewController:(UIViewController *)viewController;
+(void)showMessage:(NSString *)title message:(NSString *)message actions:(NSArray<UIAlertAction*>*)actions fromViewController:(UIViewController *)viewController;

@end
