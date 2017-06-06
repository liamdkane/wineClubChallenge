//
//  WineListTableViewController.m
//  WineClubChallenge
//
//  Created by C4Q on 5/30/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import "WineListTableViewController.h"
#import "WineObject.h"
#import "WineTableViewCell.h"
#import "WineCategoryInfo.h"
#import "APINetworkCaller.h"
#import "WineDetailViewController.h"
#import "UIViewController+AddShoppingCartItem.h"

@interface WineListTableViewController ()

@property NSMutableArray *unsortedWines;
@property NSMutableArray *sortedWines;
@property NSMutableArray *categories;
@property NSSortDescriptor *sortWineBy;
@property NSPredicate *filterWineCategoryBy;

@end

@implementation WineListTableViewController

NSString *kWineCellId = @"Wine Cell ReuseId";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass: [WineTableViewCell class] forCellReuseIdentifier:kWineCellId];
    [self addShoppingCartButton];
}


#pragma Network Receiving Delegate Methods
-(void)didReceiveWines:(NSMutableArray *)wines {
    self.unsortedWines = wines;
    [self updateWineTableView];
}

-(void)didReceiveWineImage:(WineObject *)wineWithImage thumb:(BOOL)isItThumb {
    if (isItThumb) {
        NSArray *cells = [self.tableView visibleCells];
        for (WineTableViewCell* cell in cells) {
            if (cell.wine == wineWithImage) {
                UIImage *image = wineWithImage.thumbImage;
                [cell.wineImageView setImage:image];
                [cell setNeedsLayout];
            }
        }
    } else {
        WineDetailViewController* detailVC = (WineDetailViewController *)self.navigationController.topViewController;
        [detailVC setImage:wineWithImage.largeImage];
    }
}

-(void)AddToCartButtonPressed:(WineObject *)wine quantity:(NSInteger)quantity {
    [self.shoppingCartMessenger addToShoppingCart:wine quantity:quantity];
}

#pragma SettingsViewDelegate Methods
-(void)updateSort:(NSSortDescriptor *)by {
    self.sortWineBy = by;
    [self updateWineTableView];
}
-(void)updateFilter:(NSPredicate *)by {
    self.filterWineCategoryBy = by;
    [self updateWineTableView];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return (self.categories) ? self.categories.count : 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    
    return [self currentWinesIn:section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: kWineCellId forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[WineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kWineCellId];
    }
    WineObject* currentWine = [self currentWinesIn:indexPath.section][indexPath.row];
    
    if (currentWine.thumbImage == nil) {
        [[[ApiNetworkCaller alloc]init] fetchImage:currentWine thumb:YES];
    }
    
    [cell setWine: currentWine];
    cell.delegate = self;
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    WineCategory* currentCategory = self.categories[section];
    return (currentCategory) ? currentCategory.name : @"All";
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    WineTableViewCell* currentCell = [tableView cellForRowAtIndexPath:indexPath];
    WineDetailViewController* detailVC = [[WineDetailViewController alloc] initWithWine:currentCell.wine];
    detailVC.shoppingCartMessenger = self.shoppingCartMessenger;
    [[[ApiNetworkCaller alloc]init]fetchImage:currentCell.wine thumb:NO];
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - Helper Functions

-(void)updateWineTableView {
    
    [self sortWines];
    [self filterCategory];
    
    [self.tableView reloadData];
}


//These helper functions should be refactored into an extension so that another view that might want to sort wine can do so
-(NSArray*)currentWinesIn:(NSInteger)section {
    if (self.categories) {
        WineCategory* currentCategory = self.categories[section];
        NSPredicate* categoryPredicate = [NSPredicate predicateWithFormat:@"category CONTAINS[cd] %@", currentCategory];
        NSArray* winesInCategory = [self.sortedWines filteredArrayUsingPredicate:categoryPredicate];
        return winesInCategory;
    }
    return self.sortedWines;
}

-(void)sortWines {
    if (self.sortWineBy) {
        NSMutableArray *sortByName = [NSMutableArray arrayWithObject:self.sortWineBy];
        NSMutableArray* sortedWines = (NSMutableArray *)[self.unsortedWines sortedArrayUsingDescriptors:sortByName];
        self.sortedWines = sortedWines;
    } else {
        self.sortedWines = self.unsortedWines;
    }
}

-(void)filterCategory {
    NSMutableSet* categorySet = [NSMutableSet set];
    
    for (WineObject* wine in self.sortedWines) {
        [categorySet addObjectsFromArray:wine.category];
    }
    
    if (self.filterWineCategoryBy) {
        [categorySet filterUsingPredicate:self.filterWineCategoryBy];
        
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
        NSMutableArray *sortByName = [NSMutableArray arrayWithObject:sortDescriptor];
        NSMutableArray *categoriesSortedByName = (NSMutableArray*)[[categorySet allObjects] sortedArrayUsingDescriptors:sortByName];
        
        self.categories = categoriesSortedByName;
    } else {
        self.categories = nil;
    }
}

@end
