//
//  SavedOverlayView.h
//  Clinicards
//
//  Created by Roy Derks on 23/03/2017.
//  Copyright © 2017 Synappz BV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SavedOverlayView : UIView

@property(nonatomic,weak) IBOutlet UIImageView *overlayImage;
@property(nonatomic,weak) IBOutlet UILabel *overlayTitle;

@end
