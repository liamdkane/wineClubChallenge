//
//  SettingsMessanger.h
//  WineClubChallenge
//
//  Created by C4Q on 6/1/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingsReceiverDelegate.h"
#import "CategorySearchDelegate.h"
#import "WineSettingsDelegate.h"

@interface SettingsMessanger : NSObject<SettingsReceiverDelegate>

@property id<WineSettingsDelegate> wineSettingsReciever;
@property id<CategorySearchDelegate> categorySearchReceiver;

@end
