//
//  CategorySearchDelegate.h
//  WineClubChallenge
//
//  Created by C4Q on 6/1/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CategorySearchDelegate <NSObject>
-(void)search:(NSPredicate *)forCategory;
@end
