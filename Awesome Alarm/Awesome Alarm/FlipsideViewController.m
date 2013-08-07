//
//  FlipsideViewController.m
//  Awesome Alarm
//
//  Created by David Gisser on 8/3/13.
//  Copyright (c) 2013 David Gisser. All rights reserved.
//

#import "FlipsideViewController.h"

@interface FlipsideViewController ()

@end

@implementation FlipsideViewController
@synthesize scrollView = _scrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.alarm = [[Alarm alloc] init];
    self.alarm.label = @"Alarm";
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setContentSize:CGSizeMake(320, 1000)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (IBAction)LabelDone:(id)sender {
    [sender resignFirstResponder];
    UITextField *labelField = (UITextField*) sender;
    self.alarm.label = labelField.text;
}

- (IBAction)AlarmSet:(UIButton *)sender {
    self.alarm.sleep = self.sleepValue.on;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"h:mm a"];
    self.alarm.time = [formatter stringFromDate:self.alarmTime.date];
    NSLog(@"%@",self.alarm.time);
    [self.delegate sendAlarm:self.alarm];
}

@end
