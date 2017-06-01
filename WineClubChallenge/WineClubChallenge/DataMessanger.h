//
//  DataMessanger.h
//  WineClubChallenge
//
//  Created by C4Q on 5/31/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#ifndef DataMessanger_h
#define DataMessanger_h
#import <Foundation/Foundation.h>
#import "NetworkAnswering.h"
#import "CategoryReceiver.h"
#import "WineReceiver.h"

//This class speaks to the APINetworkCaller, parses the json into my custom classes, and passes it to the right VC

@interface DataMessanger : NSObject<NetworkAnswering>

@property id<CategoryReceiver> categoryReceiver;
@property id<WineReceiver> wineReceiver;

@end
#endif /* DataMessanger_h */
