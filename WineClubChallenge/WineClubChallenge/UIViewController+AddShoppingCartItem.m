//
//  UIViewController+AddShoppingCartItem.m
//  WineClubChallenge
//
//  Created by C4Q on 6/2/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import "UIViewController+AddShoppingCartItem.h"
#import "ShoppingCartTableViewController.h"
#import "AppDelegate.h"

@implementation UIViewController (AddShoppingCartItem)

-(void)addShoppingCartButton {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Shopping Cart" style:UIBarButtonItemStylePlain target:self action:@selector(shoppingCartButtonPressed)];
}

-(void)shoppingCartButtonPressed {
    AppDelegate* app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    ShoppingCartTableViewController *shoppingCartTVC = [[ShoppingCartTableViewController alloc] initWithShoppingCartMessenger:app.shoppingCart];
    app.shoppingCart.delegate = shoppingCartTVC;
    [self.navigationController pushViewController: shoppingCartTVC animated:YES];
}

@end
