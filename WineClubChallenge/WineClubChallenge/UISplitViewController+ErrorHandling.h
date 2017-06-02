//
//  UISplitViewController+ErrorHandling.h
//  WineClubChallenge
//
//  Created by C4Q on 6/1/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ErrorReceiver.h"

@interface UISplitViewController (ErrorHandling)<ErrorReceiver>
    -(void)errorReceived:(NSError *)error;
@end
