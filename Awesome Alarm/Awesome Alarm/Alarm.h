//
//  Alarm.h
//  Awesome Alarm
//
//  Created by David Gisser on 8/3/13.
//  Copyright (c) 2013 David Gisser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Alarm : NSObject
@property (strong, nonatomic) NSString *label;
@property (strong, nonatomic) NSString *time;
@property (strong, nonatomic) NSString *songTitle;
@property (assign, nonatomic) BOOL sleep;
@property (assign, nonatomic) BOOL rang;

@end
