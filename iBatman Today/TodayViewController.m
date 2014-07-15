//
//  TodayViewController.m
//  iBatman Today
//
//  Created by Liviu Romascanu on 7/13/14.
//  Copyright (c) 2014 Liviu Romascanu. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.applicaster.applicaster.sharegroup"];
    BOOL switchState = [sharedDefaults boolForKey:@"ImOnIt"];
    [self.imOnItSwitch setOn:switchState animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encoutered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (IBAction)switchValueChanged:(id)sender {
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.applicaster.applicaster.sharegroup"];
    [sharedDefaults setBool:self.imOnItSwitch.on forKey:@"ImOnIt"];
    [sharedDefaults synchronize];
}
@end
