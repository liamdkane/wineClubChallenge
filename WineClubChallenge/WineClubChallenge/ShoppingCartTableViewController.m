//
//  ShoppingCartTableViewController.m
//  WineClubChallenge
//
//  Created by C4Q on 6/2/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import "ShoppingCartTableViewController.h"
#import "ShoppingCartTableViewCell.h"
#import "WineDetailViewController.h"
#import "APINetworkCaller.h"

@interface ShoppingCartTableViewController ()

@property id<ShoppingCartMessenger> shoppingCartMessenger;
@property NSDictionary *currentShoppingCart;
@property NSArray *wines;

@end

@implementation ShoppingCartTableViewController

NSString* kShoppingCartTableCellId = @"ShoppingCart Cell Id";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.shoppingCartMessenger checkShoppingCart];
    [self.tableView registerClass: [ShoppingCartTableViewCell class] forCellReuseIdentifier:kShoppingCartTableCellId];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed)];
}

-(instancetype)initWithShoppingCartMessenger:(id<ShoppingCartMessenger>)shoppingCartMessenger {
    self = [super init];
    if (self) {
        self.shoppingCartMessenger = shoppingCartMessenger;
    }
    return self;
}

-(void)shoppingCartUpdated:(NSDictionary *)newShoppingCart {
    self.currentShoppingCart = newShoppingCart;
    [self sortWinesByTime];
    [self updateTitle];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.wines.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ShoppingCartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kShoppingCartTableCellId forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[ShoppingCartTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kShoppingCartTableCellId];
    }
    WineObject *currentObject = self.wines[indexPath.row];
    
    cell.quantityLabel.text = [self.currentShoppingCart[currentObject] stringValue];
    [cell setWine: currentObject];
    cell.delegate = self;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        WineObject *currentWine = self.wines[indexPath.row];
        [self.shoppingCartMessenger removeFromShoppingCart:currentWine];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ShoppingCartTableViewCell* currentCell = [tableView cellForRowAtIndexPath:indexPath];
    WineDetailViewController* detailVC = [[WineDetailViewController alloc] initWithWine:currentCell.wine];
    detailVC.shoppingCartMessenger = self.shoppingCartMessenger;
    [[[ApiNetworkCaller alloc]init]fetchImage:currentCell.wine thumb:NO];
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

-(void)AddToCartButtonPressed:(WineObject *)wine quantity:(NSInteger)quantity {
    [self.shoppingCartMessenger addToShoppingCart:wine quantity:quantity];
}

-(void)doneButtonPressed {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)sortWinesByTime {
    NSArray *timeSort = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"timeAddedToCart" ascending:NO]];
    self.wines = [self.currentShoppingCart.allKeys sortedArrayUsingDescriptors:timeSort];
}

-(void)updateTitle {
    NSInteger sumOfCartItems = 0;
    for (NSNumber* quantity in [self.currentShoppingCart allValues]) {
        sumOfCartItems += [quantity integerValue];
    }
    NSString *title = [NSString stringWithFormat:@"Shopping Cart: %@", [[NSNumber numberWithInteger:sumOfCartItems] stringValue]];
    [self.navigationItem setTitle:title];
}

@end
