//
//  WineCategoryInfo.m
//  WineClubChallenge
//
//  Created by C4Q on 5/31/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import "WineCategoryInfo.h"
#import "WineApiKeys.m"


@implementation WineCategory

-(instancetype)initWithName:(NSString *)name id:(NSInteger)categoryId type:(NSString *)type
{
    self = [super init];
    if(self != nil) {
        self.name = name;
        self.categoryId = categoryId;
        self.type = type;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)categoryDictionary type:(NSString*)type {
    
    NSNumber *categoryId = [categoryDictionary objectForKeyedSubscript:kCategoryIdKey];
    NSString *name = [categoryDictionary objectForKeyedSubscript:kCategoryNameKey];
    
    return [self initWithName:name id:[categoryId integerValue] type:type];
}

-(BOOL)isEqual:(WineCategory *)object {
    return [object.name isEqualToString:self.name];
}

-(NSUInteger)hash {
    return self.name.hash;
}

@end

