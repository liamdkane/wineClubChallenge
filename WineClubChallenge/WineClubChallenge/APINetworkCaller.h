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
#import "WineCategoryInfo.h"
#import "WineObject.h"

@interface ApiNetworkCaller: NSObject
-(void)fetchCategories;
-(void)initialFetchWines;
-(void)fetchWinesInCategory: (WineCategory *)category;
//the bool here is pretty janky, normally i'd use an enum in swift
-(void)fetchImage: (WineObject *)wine thumb:(BOOL)isItThumbnail;

@end

#endif /* APINetworkCaller_h */
