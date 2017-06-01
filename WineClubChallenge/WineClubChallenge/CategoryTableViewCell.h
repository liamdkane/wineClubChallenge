//
//  CategoryTableViewCell.h
//  WineClubChallenge
//
//  Created by C4Q on 5/31/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WineCategoryInfo.h"

@interface CategoryTableViewCell : UITableViewCell

-(void)setCategory: (WineCategory *)category;
@property (nonatomic) WineCategory* category;

@end
