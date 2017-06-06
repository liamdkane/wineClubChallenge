//
//  WineListTableViewController.h
//  WineClubChallenge
//
//  Created by C4Q on 5/30/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WineReceiver.h"
#import "WineSettingsDelegate.h"
#import "AddToCartButtonDelegate.h"
#import "ShoppingCartMessenger.h"

@interface WineListTableViewController : UITableViewController<WineReceiver, WineSettingsDelegate, AddToCartButtonDelegate>
@property id<ShoppingCartMessenger> shoppingCartMessenger;
@end
