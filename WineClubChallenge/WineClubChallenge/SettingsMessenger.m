//
//  SettingsMessenger.m
//  WineClubChallenge
//
//  Created by C4Q on 6/1/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import "SettingsMessenger.h"
#import "APINetworkCaller.h"

@implementation SettingsMessenger
-(void)didSelectSortType:(NSString *)key {
    BOOL ascending = [key isEqualToString:@"A-Z"];
    
    NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:ascending];
    if ([key isEqualToString:@"None"]) {
        sortDescriptor = nil;
    }
    
    [self.wineSettingsReciever updateSort:sortDescriptor];
}

-(void)didSelectCategoryType:(NSString *)key {
    NSPredicate* filterPredicate = [NSPredicate predicateWithFormat:@"type CONTAINS[c] %@", key];
    
    if ([key isEqualToString: @"Both"]) {
        filterPredicate = nil;
    }
    
    [self.wineSettingsReciever updateFilter:filterPredicate];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSPredicate* searchPredicate = [NSPredicate predicateWithFormat:@"name CONTAINS[cd] %@", searchBar.text];
    
    if ([searchBar.text isEqualToString: @""]) {
        searchPredicate = nil;
    }
    
    [self.categorySearchReceiver search:searchPredicate];
}

-(void)didPressAllButton {
    
    [[[ApiNetworkCaller alloc] init] initialFetchWines];
}

@end
