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
#import "WineApiKeys.m"

@implementation WineObject

- (instancetype)initWithName:(NSString *)name
                 description:(NSString *)description
               thumbImageURL:(NSString *)thumbImageURL
               largeImageURL:(NSString *)largeImageURL
                    category:(NSArray *)category
{
    self = [super init];
    if(self != nil) {
        self.name = name;
        self.wineDescription = description;
        self.thumbImageURL = thumbImageURL;
        self.largeImageURL = largeImageURL;
        self.category = category;
    }
    return self;
}


-(instancetype)initWithDictionary:(NSDictionary *)wineDictionary {
    
    NSMutableArray* category = [NSMutableArray array];
    NSString* name = wineDictionary[kWineNameKey];
    NSString* description = wineDictionary[kWineDescriptionKey];
    NSArray* imageURLArray = [wineDictionary valueForKeyPath:kWineImageUrlKey];
    NSString* thumbImageUrl;
    NSString* largeImageUrl;
    
    for (NSDictionary* imageDictionary in imageURLArray) {
        if ([imageDictionary[@"Name"] isEqualToString:@"thumbnail"]) {
            thumbImageUrl = imageDictionary[@"Url"];
        }
        
        if ([imageDictionary[@"Name"] isEqualToString:@"large"]) {
            largeImageUrl = imageDictionary[@"Url"];
        }
    }
    
    NSDictionary* varietalDictionary = wineDictionary[kWineVarietalKey];
    NSDictionary* wineTypeDictionary = [wineDictionary valueForKeyPath:kWineWineTypeKeyPath];
    
    if ([varietalDictionary isKindOfClass:[NSDictionary class]] ) {
        WineCategory* varietal = [[WineCategory alloc] initWithDictionary:varietalDictionary type:kCategoryTypeVarietalTypeKey];
        [category addObject:varietal];
    }
    if ([wineTypeDictionary isKindOfClass:[NSDictionary class]]) {
        WineCategory* wineType = [[WineCategory alloc] initWithDictionary:wineTypeDictionary type:kCategoryTypeWineTypeKey];
        [category addObject:wineType];
    }
    
    
    return [self initWithName:name description:description thumbImageURL:thumbImageUrl largeImageURL:largeImageUrl category:category];
}

-(BOOL)isEqual:(WineCategory *)object {
    return [object.name isEqualToString:self.name];
}

-(NSUInteger)hash {
    return self.name.hash;
}

-(id)copyWithZone:(NSZone *)zone {
    WineObject *copy = [[[self class] alloc] init];
    
    if (copy) {
        copy.name = self.name;
        copy.wineDescription = self.wineDescription;
        copy.thumbImageURL = self.thumbImageURL;
        copy.largeImageURL = self.largeImageURL;
        copy.category = self.category;
        copy.thumbImage = self.thumbImage;
        copy.largeImage = self.largeImage;
        copy.timeAddedToCart = self.timeAddedToCart;
    }
    
    return copy;
}

@end
