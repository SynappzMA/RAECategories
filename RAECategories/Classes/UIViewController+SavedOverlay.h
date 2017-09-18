//
//  UIViewController+SavedOverlay.h
//  Pods
//
//  Created by Roy Derks on 14/06/2017.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (SavedOverlay)

-(void)showChangedSavedOverlay:(void (^)(void))completion color:(UIColor*)color;
-(void)showChangedSavedOverlay:(void (^)(void))completion withMessage:(NSString *)message color:(UIColor*)color;

@end
