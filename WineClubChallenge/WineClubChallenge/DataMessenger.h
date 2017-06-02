//
//  DataMessenger.h
//  WineClubChallenge
//
//  Created by C4Q on 5/31/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#ifndef DataMessenger_h
#define DataMessenger_h
#import <Foundation/Foundation.h>
#import "NetworkAnswering.h"
#import "CategoryReceiver.h"
#import "WineReceiver.h"
#import "ErrorReceiver.h"

//This class speaks to the APINetworkCaller, parses the json into my custom classes, and passes it to the right VC

@interface DataMessenger : NSObject<NetworkAnswering>

@property id<CategoryReceiver> categoryReceiver;
@property id<WineReceiver> wineReceiver;
@property id<ErrorReceiver> errorReceiver;

@end
#endif /* DataMessenger_h */
