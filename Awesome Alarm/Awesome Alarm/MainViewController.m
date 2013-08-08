//
//  MainViewController.m
//  Awesome Alarm
//
//  Created by David Gisser on 8/3/13.
//  Copyright (c) 2013 David Gisser. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateClock) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"%@",@"hello");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

- (void)updateClock
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"hh:mm a"];
    self.currentTime.text = [format stringFromDate:[NSDate date]];
    if ([self.currentTime.text isEqualToString:self.alarmTime.text] && self.alarm.rang == FALSE) {
        self.alarm.rang = TRUE;
        self.snooze.hidden = FALSE;
        [self alarmRing];
    }
    
}

- (IBAction)labelDone:(id)sender {
    [sender resignFirstResponder];
    UITextField *labelField = (UITextField*) sender;
    self.alarm.label = labelField.text;
}

- (IBAction)clearAlarm:(UIButton *)sender {
    [self.snoozeTimer invalidate];
    [self emptyAlarm];
}

- (void)emptyAlarm
{
    self.alarm = nil;
    self.alarm.rang = FALSE;
    self.alarmTime.text = @"";
    self.alarmLabel.text = @"";
    self.snooze.hidden = TRUE;
    self.alarmLabel.hidden = TRUE;
    [self.click stop];
}

- (IBAction)snooze:(UIButton *)sender {
    [self.click stop];
    self.snoozeTimer = [NSTimer scheduledTimerWithTimeInterval:30 target:self selector:@selector(alarmRing) userInfo:nil repeats:NO];
}

-(void)sendAlarm:(Alarm *)alarm
{
    self.alarm = alarm;
    self.alarmLabel.hidden = FALSE;
    self.clear.hidden = FALSE;
    if (self.alarm.time.length == 7) {
        self.alarmTime.text = [@"0" stringByAppendingString:self.alarm.time];
    }
    else{
        self.alarmTime.text = self.alarm.time;
    }
    self.alarmLabel.text = self.alarm.label;
    self.alarm.rang = FALSE;
}

-(void)alarmRing
{
    if (self.alarm.songTitle == NULL) {
        self.alarm.songTitle = @"battlescars";
    }
    NSURL* musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                               pathForResource:self.alarm.songTitle
                                               ofType:@"mp3"]];
    self.click = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile error:nil];
    self.click.numberOfLoops = -1;
    if(!self.click.playing){
        [self.click play];
    }
}

@end
