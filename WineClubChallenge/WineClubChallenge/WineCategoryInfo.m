//
//  WineCategoryInfo.m
//  WineClubChallenge
//
//  Created by C4Q on 5/31/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import "WineCategoryInfo.h"


@implementation WineCategory

- (instancetype)init { @throw nil; }

-(instancetype)initWithName:(NSString *)name id:(NSInteger)categoryId
{
    self = [super init];
    if(self != nil) {
        self.name = name;
        self.categoryId = categoryId;
        
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)categoryDictionary {
    
    NSString *categoryId = [categoryDictionary objectForKeyedSubscript:@"Id"];
    NSString *name = [categoryDictionary objectForKeyedSubscript:@"Name"];
    
    return [self initWithName:name id:(NSInteger)categoryId];
}

@end
