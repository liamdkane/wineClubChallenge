//
//  SettingsReveiverDelegate.h
//  WineClubChallenge
//
//  Created by C4Q on 6/1/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SettingsReceiverDelegate <NSObject, UISearchBarDelegate>

-(void)didSelectSortType: (NSString *)key;
-(void)didSelectCategoryType: (NSString *)key;

@end
