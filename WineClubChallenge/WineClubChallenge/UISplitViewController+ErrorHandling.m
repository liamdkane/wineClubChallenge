//
//  UISplitViewController+ErrorHandling.m
//  WineClubChallenge
//
//  Created by C4Q on 6/1/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import "UISplitViewController+ErrorHandling.h"

@implementation UISplitViewController (ErrorHandling)
-(void)errorReceived:(NSError *)error {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"ERROR" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil]; //You can use a block here to handle a press on this button
    [alert addAction:actionOk];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
