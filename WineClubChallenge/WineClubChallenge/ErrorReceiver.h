//
//  ErrorReceiver.h
//  WineClubChallenge
//
//  Created by C4Q on 6/1/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ErrorReceiver <NSObject>
-(void)errorReceived: (NSError *)error;
@end
