//
//  SettingsLabel.m
//  WineClubChallenge
//
//  Created by C4Q on 6/1/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import "SettingsLabel.h"

@implementation SettingsLabel

-(instancetype)initWith:(NSString *)text {
    self = [super init];
    self.text = text;
    self.textAlignment = NSTextAlignmentCenter;
    self.adjustsFontSizeToFitWidth = YES;
    [self setMinimumScaleFactor:0.5];
    return self;
}

@end
