//
//  WineDetailViewController.h
//  WineClubChallenge
//
//  Created by C4Q on 6/1/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WineObject.h"
#import "AddToCartButtonDelegate.h"
#import "ShoppingCartMessenger.h"

@interface WineDetailViewController : UIViewController<AddToCartButtonDelegate>

@property id<ShoppingCartMessenger> shoppingCartMessenger;
-(instancetype)initWithWine:(WineObject *)wine;
-(void)setImage: (UIImage *)image;
@end
