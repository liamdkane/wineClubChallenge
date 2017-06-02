//
//  ShoppingCart.m
//  WineClubChallenge
//
//  Created by C4Q on 6/2/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import "ShoppingCart.h"

@interface ShoppingCart ()
@property (nonatomic, retain) NSMutableDictionary* shoppingCart;
@end

@implementation ShoppingCart

-(instancetype)init {
    self = [super init];
    if (self) {
        self.shoppingCart = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void)checkShoppingCart {
    
    [self.delegate shoppingCartUpdated: [self.shoppingCart copy]];
}

-(void)addToShoppingCart:(WineObject *)wine quantity:(NSInteger)quantity {
    if (self.shoppingCart[wine]) {
        
        NSNumber* oldValue = [self.shoppingCart objectForKey:wine];
        NSNumber* newValue = [NSNumber numberWithInteger: [oldValue integerValue] + quantity];
        
        if ([newValue integerValue] <= 0) {
            [self removeFromShoppingCart:wine];
            return;
        }
        [self.shoppingCart setObject:newValue forKey:[wine copy]];
    } else {
        WineObject *copy = [wine copy];
        [copy setTimeAddedToCart:[NSDate dateWithTimeIntervalSinceNow:0]];
        [self.shoppingCart setObject:[NSNumber numberWithInteger:quantity] forKey:copy];
    }
    [self checkShoppingCart];
}

-(void)removeFromShoppingCart:(WineObject *)wine {
    [self.shoppingCart removeObjectForKey:wine];
    [self checkShoppingCart];
}

@end
