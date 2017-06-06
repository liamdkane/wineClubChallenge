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

@property NSInteger categoryId;
@property NSString *name;
@property NSString *type;
-(instancetype)initWithDictionary:(NSDictionary* )categoryDictionary type:(NSString* )type;
-(BOOL)isEqual:(WineCategory*)object;
-(NSUInteger)hash;
@end


#endif /* WineCategoryInfo_h */
