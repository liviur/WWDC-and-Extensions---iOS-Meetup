//
//  TodayViewController.h
//  iBatman Today
//
//  Created by Liviu Romascanu on 7/13/14.
//  Copyright (c) 2014 Liviu Romascanu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayViewController : UIViewController
@property (strong, nonatomic) IBOutlet UISwitch *imOnItSwitch;
- (IBAction)switchValueChanged:(id)sender;

@end
