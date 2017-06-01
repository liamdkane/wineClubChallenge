//
//  WineCategoryInfo.h
//  WineClubChallenge
//
//  Created by C4Q on 5/31/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#ifndef WineCategoryInfo_h
#define WineCategoryInfo_h


#import <Foundation/Foundation.h>

@interface WineCategory : NSObject

@property (nonatomic) NSInteger categoryId;
@property (nonatomic) NSString *name;
-(instancetype)initWithDictionary:(NSDictionary *)categoryDictionary;

@end


#endif /* WineCategoryInfo_h */
