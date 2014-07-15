//
//  ViewController.m
//  iBatman
//
//  Created by Liviu Romascanu on 7/13/14.
//  Copyright (c) 2014 Liviu Romascanu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self updateSwitch];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateSwitchAnimated)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self updateSwitch];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchValueChanged:(id)sender {
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.applicaster.applicaster.sharegroup"];
    [sharedDefaults setBool:self.imOnItSwitch.on forKey:@"ImOnIt"];
    [sharedDefaults synchronize];
}

- (IBAction)shareButtonClicked:(id)sender {
    NSArray *array = [NSArray arrayWithObjects:@"Sharing with Batman", [NSURL URLWithString:@"http://www.batman.com"], nil];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:array applicationActivities:nil];
    [self presentViewController:activityViewController animated:YES completion:nil];
}

#pragma mark - private
- (void)updateSwitch
{
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.applicaster.applicaster.sharegroup"];
    BOOL switchState = [sharedDefaults boolForKey:@"ImOnIt"];
    [self.imOnItSwitch setOn:switchState animated:NO];
}

- (void)updateSwitchAnimated
{
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.applicaster.applicaster.sharegroup"];
    BOOL switchState = [sharedDefaults boolForKey:@"ImOnIt"];
    [self.imOnItSwitch setOn:switchState animated:YES];
}

@end
