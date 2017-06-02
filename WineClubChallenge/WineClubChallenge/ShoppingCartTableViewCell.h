//
//  ShoppingCartTableViewCell.h
//  WineClubChallenge
//
//  Created by C4Q on 6/2/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddToCartButtonDelegate.h"
#import "WineObject.h"

@interface ShoppingCartTableViewCell : UITableViewCell

-(void)setWine:(WineObject *)wine;
@property UILabel *quantityLabel;
@property id<AddToCartButtonDelegate> delegate;
@end
