//
//  WineObject.m
//  WineClubChallenge
//
//  Created by C4Q on 5/30/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WineObject.h"

@implementation WineObject

- (instancetype)init { @throw nil; }


- (instancetype)init:(NSString *)name
        description:(NSString *)description
           imageURL:(NSString *)imageURL
           category:(NSArray *)category
{
    //self = [super init];
    //if(self != nil) {
        _name = name;
        _wineDescription = description;
        _imageURL = imageURL;
        _category = category;
    //}
    return self;
}

@end
