//
//  TodayViewController.m
//  Batman Signal
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
    self.preferredContentSize = CGSizeMake(320.0, 50.0);
    NSURL *statusURL = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/u/24517939/batsignal.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:statusURL];
    __block typeof(self) blockSelf = self;
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue currentQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                               if ([[json objectForKey:@"on"] boolValue]) {
                                   blockSelf.statusLabel.text = @"On";
                                   blockSelf.statusLabel.textColor = [UIColor greenColor];
                               } else {
                                   blockSelf.statusLabel.text = @"Off";
                                   blockSelf.statusLabel.textColor = [UIColor redColor];
                               }
                           }];
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

@end
