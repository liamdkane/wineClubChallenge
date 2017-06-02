//
//  ShoppingCart.h
//  WineClubChallenge
//
//  Created by C4Q on 6/2/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShoppingCartMessenger.h"
#import "ShoppingCartDataReceiver.h"

@interface ShoppingCart : NSObject<ShoppingCartMessenger>

@property id<ShoppingCartDataReceiver> delegate;
-(void)addToShoppingCart:(WineObject *)wine quantity:(NSInteger)quantity;
-(void)removeFromShoppingCart:(WineObject *)wine;

@end
