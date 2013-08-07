//
//  FlipsideViewController.h
//  Awesome Alarm
//
//  Created by David Gisser on 8/3/13.
//  Copyright (c) 2013 David Gisser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Alarm.h"

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
- (void)sendAlarm:(Alarm *)alarm;
@end

@interface FlipsideViewController : UIViewController

@property (strong, nonatomic) Alarm *alarm;
@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;
@property (assign, nonatomic) NSString *label;
@property (strong, nonatomic) IBOutlet UISwitch *sleepValue;
@property (strong, nonatomic) IBOutlet UIDatePicker *alarmTime;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)done:(id)sender;
- (IBAction)LabelDone:(id)sender;
- (IBAction)AlarmSet:(UIButton *)sender;

@end
