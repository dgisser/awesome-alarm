//
//  SongViewController.m
//  Awesome Alarm
//
//  Created by David Gisser on 8/7/13.
//  Copyright (c) 2013 David Gisser. All rights reserved.
//

#import "SongViewController.h"
#import "FlipsideViewController.h"

@interface SongViewController ()

@end

@implementation SongViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"%@",self.mainDelegate);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"fromTable"]) {
        FlipsideViewController *controller = (FlipsideViewController *)segue.destinationViewController;
        controller.delegate = self.mainDelegate;
    }
    if ([[segue identifier] isEqualToString:@"treasure"]) {
        FlipsideViewController *controller = (FlipsideViewController *)segue.destinationViewController;
        controller.delegate = self.mainDelegate;
        controller.alarm.songTitle = @"treasure";
    }
    if ([[segue identifier] isEqualToString:@"battle"]) {
        FlipsideViewController *controller = (FlipsideViewController *)segue.destinationViewController;
        controller.delegate = self.mainDelegate;
        controller.alarm.songTitle = @"battlescars";
    }
    
}

@end
