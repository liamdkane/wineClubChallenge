//
//  AppDelegate.h
//  WineClubChallenge
//
//  Created by C4Q on 5/30/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataMessanger.h"
#import "SettingsMessanger.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) DataMessanger *dataManager;
@property (strong, nonatomic) SettingsMessanger *settingsMessanger;

@end

