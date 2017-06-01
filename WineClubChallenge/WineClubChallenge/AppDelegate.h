//
//  AppDelegate.h
//  WineClubChallenge
//
//  Created by C4Q on 5/30/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataMessenger.h"
#import "SettingsMessenger.h"
#import "AFImageDownloader.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) DataMessenger *dataManager;
@property (strong, nonatomic) SettingsMessenger *settingsMessenger;
@property (strong, nonatomic) AFAutoPurgingImageCache *imageCache;
@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;

@end

