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
    [self showChangedSavedOverlay:^() {
        NSLog(@"Hi, I completed");
    }withMessage:@"Changes saved!" color:[UIColor blueColor]];
}

@end
