//
//  CategoryViewController.h
//  WineClubChallenge
//
//  Created by C4Q on 5/31/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import "CategoryReceiver.h"
#import <UIKit/UIKit.h>
#import "SettingsView.h"
#import "CategorySearchDelegate.h"

@interface CategoryViewController : UIViewController<CategoryReceiver,
                                                     UITableViewDelegate,
                                                     UITableViewDataSource,
                                                     CategorySearchDelegate>

@end
