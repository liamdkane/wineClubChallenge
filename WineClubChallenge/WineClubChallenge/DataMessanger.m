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
#import "WineApiKeys.m"

@interface DataMessanger()<NetworkAnswering>



@end

@implementation DataMessanger
-(void)didRecieveWine:(NSDictionary *)json {
    
    NSArray *wineArray = [json valueForKeyPath:kWineListKeyPath];

    NSMutableArray *wineObjects = [NSMutableArray array];
    
    for (NSDictionary *currentWine in wineArray) {
        WineObject* wine = [[WineObject alloc] initWithDictionary:currentWine];
        [wineObjects addObject:wine];
    }
    [self.wineReceiver didReceiveWines:wineObjects];
}

-(void)didRecieveCategories:(NSDictionary *)json {
    
    NSArray *categoriesJsonArray = [json objectForKey:kCategoryInitialKey];

    NSMutableArray *categoryObjects = [NSMutableArray array];
    
    for (NSDictionary *currentCategoryType in categoriesJsonArray) {
        NSString *categoryType = currentCategoryType[kCategoryTypeKey];
        NSArray *categories = currentCategoryType[kCategoryRefinementsKey];
        
        if ([categoryType  isEqual: kCategoryTypeWineTypeKey] || [categoryType  isEqual: kCategoryTypeVarietalTypeKey] ) {
            for (NSDictionary *currentCategory in categories) {
                WineCategory *category = [[WineCategory alloc]initWithDictionary:currentCategory type:categoryType];
                [categoryObjects addObject:category];
            }
        }
    }
    [self.categoryReceiver didReceiveCategories:categoryObjects];
}
@end
