//
//  DataMessanger.m
//  WineClubChallenge
//
//  Created by C4Q on 5/31/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataMessanger.h"
#import "NetworkAnswering.h"
#import "WineCategoryInfo.h"
#import "WineObject.h"

@interface DataMessanger()<NetworkAnswering>



@end

@implementation DataMessanger



-(void)didRecieveWine:(NSArray *)json {
    NSMutableArray *wineObjects = [NSMutableArray array];
    
    for (NSDictionary *currentWine in json) {
        WineObject* wine = [[WineObject alloc] initWithDictionary:currentWine];
        [wineObjects addObject:wine];
    }
    [self.wineReceiver didReceiveWines:wineObjects];
}

-(void)didRecieveCategoryies:(NSArray *)json {
    
    NSMutableArray *categoryObjects = [NSMutableArray array];
    
    for (NSDictionary *currentCategoryType in json) {
        NSString *categoryType = currentCategoryType[@"Name"];
        NSArray *categories = currentCategoryType[@"Refinements"];
        
        if ([categoryType  isEqual: @"Wine Type"] || [categoryType  isEqual: @"Varietal"] ){
            for (NSDictionary *currentCategory in categories) {
                WineCategory *category = [[WineCategory alloc]initWithDictionary:currentCategory];
                [categoryObjects addObject:category];
            }
        }
    }
    [self.categoryReceiver didReceiveCategories:categoryObjects];
}
@end
