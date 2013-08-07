//
//  MainViewController.h
//  Awesome Alarm
//
//  Created by David Gisser on 8/3/13.
//  Copyright (c) 2013 David Gisser. All rights reserved.
//

#import "FlipsideViewController.h"
#import <AVFoundation/AVAudioPlayer.h>

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>
-(void)updateClock;
-(void)alarmRing;
-(void)emptyAlarm;
- (IBAction)labelDone:(id)sender;
- (IBAction)clearAlarm:(UIButton *)sender;
- (IBAction)snooze:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UILabel *currentTime;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSTimer *snoozeTimer;
@property (strong, nonatomic) IBOutlet UILabel *alarmTime;
@property (strong, nonatomic) Alarm *alarm;
@property (strong, nonatomic) IBOutlet UITextField *alarmLabel;
@property (strong, nonatomic) IBOutlet UIButton *clear;
@property (strong, nonatomic) AVAudioPlayer *click;
@property (strong, nonatomic) IBOutlet UIButton *snooze;

@end
