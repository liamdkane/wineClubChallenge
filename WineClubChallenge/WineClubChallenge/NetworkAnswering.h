//
//  NetworkAnswering.h
//  WineClubChallenge
//
//  Created by C4Q on 5/31/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkAnswering <NSObject>
-(void)didRecieveCategoryies: (NSArray *)json;
-(void)didRecieveWine: (NSArray *)json;
@end
