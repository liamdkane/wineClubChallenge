//
//  ShoppingCartTableViewController.h
//  WineClubChallenge
//
//  Created by C4Q on 6/2/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingCartDataReceiver.h"
#import "ShoppingCartMessenger.h"
#import "AddToCartButtonDelegate.h"

@interface ShoppingCartTableViewController : UITableViewController<ShoppingCartDataReceiver, AddToCartButtonDelegate>

-(instancetype)initWithShoppingCartMessenger:(id<ShoppingCartMessenger>) shoppingCartMessenger;

@end
