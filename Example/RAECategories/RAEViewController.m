//
//  RAEViewController.m
//  RAECategories
//
//  Created by rajderks on 06/14/2017.
//  Copyright (c) 2017 rajderks. All rights reserved.
//

#import "RAEViewController.h"
#import "RAECategories.h"

@interface RAEViewController ()

@property(nonatomic,weak) IBOutlet UIView *yellowView;
@property(nonatomic,weak) IBOutlet UIView *blueView;
@property(nonatomic,weak) IBOutlet UIView *greenView;
@property(nonatomic,weak) IBOutlet UIView *redView;

@end

@implementation RAEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)doIt:(id)sender
{
}

-(IBAction)doOtherThing:(id)sender
{
    NSArray *views = @[self.blueView, self.yellowView, self.greenView, self.redView];
    for(UIView *v in views) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(([views indexOfObject:v] * 0.15) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if([v isEqual:self.yellowView]) {
                [v popWithScale:1.4 andDuration:0.4 completion:nil];
            } else {
                [v pop:nil];
            }
        });
    }
}

@end
