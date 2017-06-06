//
//  AddToCartButtonDelegate.h
//  WineClubChallenge
//
//  Created by C4Q on 6/2/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WineObject.h"

@protocol AddToCartButtonDelegate <NSObject>

-(void)AddToCartButtonPressed:(WineObject *)wine quantity:(NSInteger)quantity;

@end
