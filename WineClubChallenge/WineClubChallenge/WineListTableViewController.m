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
}


#pragma Network Receiving Delegate Methods
-(void)didReceiveWines:(NSMutableArray *)wines {
    self.unsortedWines = wines;
    [self updateWineTableView];
}

-(void)didReceiveWineImage:(WineObject *)wineWithImage {
    NSArray *cells = [self.tableView visibleCells];
    for (WineTableViewCell* cell in cells) {
        if (cell.wine == wineWithImage) {
            UIImage *image = wineWithImage.thumbImage;
            [cell.imageView setImage:image];
            [cell setNeedsLayout];
        }
    }
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
    if (currentWine.thumbImage) {
        cell.imageView.image = currentWine.thumbImage;
    } else {
        [[[ApiNetworkCaller alloc]init] fetchImage:currentWine thumb:YES];
    }
    [cell setWine: currentWine];
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    WineCategory* currentCategory = self.categories[section];
    return (currentCategory) ? currentCategory.name : @"All";
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(void)tableView:(UITableView *)tableView prefetchRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
    
}

#pragma mark - Helper Functions

-(void)updateWineTableView {
    
    [self sortWines];
    [self filterCategory];
    
    [self.tableView reloadData];
}

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



/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */
