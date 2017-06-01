//
//  WineObject.m
//  WineClubChallenge
//
//  Created by C4Q on 5/30/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "WineObject.h"
#import "WineCategoryInfo.h"

@implementation WineObject

- (instancetype)initWithName:(NSString *)name
        description:(NSString *)description
           imageURL:(NSString *)imageURL
           category:(NSArray *)category
{
    self = [super init];
    if(self != nil) {
        self.name = name;
        self.wineDescription = description;
        self.imageURL = imageURL;
        self.category = category;
    }
    return self;
}


-(instancetype)initWithDictionary:(NSDictionary *)wineDictionary {
    
    NSMutableArray* category = [NSMutableArray array];
    NSString* name = wineDictionary[@"Name"];
    NSString* description = wineDictionary[@"Description"];
    NSString* imageURL = [wineDictionary valueForKeyPath:@"Labels.Url"];
    
    NSDictionary* varietalDictionary = wineDictionary[@"Varietal"];
    NSDictionary* wineTypeDictionary = [wineDictionary valueForKeyPath:@"Varietal.WineType"];
    
    if ([varietalDictionary isKindOfClass:[NSDictionary class]] ) {
        WineCategory* varietal = [[WineCategory alloc] initWithDictionary:varietalDictionary];
        [category addObject:varietal];
    }
    if ([wineTypeDictionary isKindOfClass:[NSDictionary class]]) {
        WineCategory* wineType = [[WineCategory alloc] initWithDictionary:wineTypeDictionary];
        [category addObject:wineType];
    }
    

    return [self initWithName:name description:description imageURL:imageURL category:category];
}


@end
