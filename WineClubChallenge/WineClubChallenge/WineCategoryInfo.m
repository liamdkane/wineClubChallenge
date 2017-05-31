//
//  WineCategoryInfo.m
//  WineClubChallenge
//
//  Created by C4Q on 5/31/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WineCategoryInfo.h"


@implementation WineCategory

//- (instancetype)init { @throw nil; }

-(instancetype)initWithName:(NSString *)name id:(NSInteger *)id
{
    self = [super init];
    if(self != nil) {
        _name = name;
        _id = id;
    }
    return self;
}

@end
