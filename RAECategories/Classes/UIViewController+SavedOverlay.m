//
//  UIViewController+SavedOverlay.m
//  Pods
//
//  Created by Roy Derks on 14/06/2017.
//
//

#import "SavedOverlayView.h"
#import "BDGScreenshot.h"
#import "UIViewController+SavedOverlay.h"
#import "NSBundle+PodResourceBundle.h"

@implementation UIViewController (SavedOverlay)

/**
 Shows the changed overlay by taken a screenshot and blurring it. Then overlays it with a checkmark image and a UILabel
 
 @param completion block to be called when the animation finished.
 */

-(void)showChangedSavedOverlay:(void (^)())completion withMessage:(NSString *)message color:(UIColor*)color
{
    //[[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    if(!message.length || color == nil) {
        if(completion) {
            completion();
        }
    }
    NSBundle *bundle = [NSBundle podResourceBundleWithName:@"RAECategories" class:[SavedOverlayView class]];

    //Create screenshot
    UIImageView *changesSavedImageView;
    changesSavedImageView = [[UIImageView alloc] initWithFrame:[self visibleRectForView:self.view]];
    changesSavedImageView.image = [self screenshotImageForView:self.view];
    
    //Add blur
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    blurView.frame = CGRectMake(0, 0, CGRectGetWidth(changesSavedImageView.frame), CGRectGetHeight(changesSavedImageView.frame));
    [changesSavedImageView addSubview:blurView];
    changesSavedImageView.alpha = 0;
    [self.view addSubview:changesSavedImageView];
    
    //View with icon and text
    
    SavedOverlayView *overlayView = [[bundle loadNibNamed:@"SavedOverlayView" owner:nil options:nil] objectAtIndex:0];
    overlayView.frame = CGRectMake(0, 0, CGRectGetWidth(changesSavedImageView.frame), CGRectGetHeight(changesSavedImageView.frame));
    overlayView.overlayImage.image = [[UIImage imageNamed:@"Icon_Saved_Overlay" inBundle:bundle compatibleWithTraitCollection:nil] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    overlayView.overlayImage.tintColor = color;
    overlayView.overlayTitle.textColor = color;
    overlayView.overlayTitle.text = message;
    [changesSavedImageView addSubview:overlayView];
    
    //Fade in
    [UIView animateWithDuration:0.25 animations:^{
        changesSavedImageView.alpha = 0.95;
        overlayView.alpha = 1;
        
    } completion:^(BOOL finished) {
        //Fade out
        [UIView animateWithDuration:0.33 delay:0.8 options:0 animations:^{
            changesSavedImageView.alpha = 0;
            overlayView.alpha = 0;
            
        } completion:^(BOOL finished) {
            //Remove and finish
            [overlayView removeFromSuperview];
            [changesSavedImageView removeFromSuperview];
            if(completion) { completion(); }
        }];
    }];
    
}

-(void)showChangedSavedOverlay:(void (^)())completion color:(UIColor*)color
{
    [self showChangedSavedOverlay:completion withMessage:nil color:color];
}

-(CGRect)visibleRectForView:(UIView*)view
{
    if([view isKindOfClass:[UITableView class]]) {
        UITableView *tableView = (UITableView*)view;
        CGFloat contentOffset = tableView.contentOffset.y + tableView.contentInset.top;
        CGRect visibleRect = CGRectMake(tableView.contentOffset.x,
                                        contentOffset, tableView.bounds.size.width, tableView.bounds.size.height);
        return visibleRect;
    } else {
        return view.bounds;
    }
}

-(UIImage*)screenshotImageForView:(UIView*)view
{
    if([view isKindOfClass:[UITableView class]]) {
        CGRect visibleRect = [self visibleRectForView:view];
        UIGraphicsBeginImageContextWithOptions(visibleRect.size, NO, 0.0f);
        [self.view drawViewHierarchyInRect:CGRectMake(0, 0, visibleRect.size.width, visibleRect.size.height)
                        afterScreenUpdates:YES];
        UIImage *screenshotImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return screenshotImage;
    } else {
        return [BDGScreenshot screenshotFromView:view];
    }
}

@end
