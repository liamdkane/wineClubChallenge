//
//  APINetworkCaller.h
//  WineClubChallenge
//
//  Created by C4Q on 5/31/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#ifndef APINetworkCaller_h
#define APINetworkCaller_h
#import <Foundation/Foundation.h>
#import "NetworkAnswering.h"

@interface APINetworkCaller: NSObject
-(void)fetchCategories;
-(void)initialFetchWines;

@end

#endif /* APINetworkCaller_h */
