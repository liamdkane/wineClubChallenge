//
//  WineApiKeys.m
//  WineClubChallenge
//
//  Created by C4Q on 5/31/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <Foundation/Foundation.h>

//My lack of familiarity with Objective C left me kind of confused how to handle Api keys, normally I use an enum in swift, but that doesn't really translate, this seems like the most maintainable I could think of.

static NSString* kCategoryInitialKey = @"Categories";
static NSString* kCategoryTypeWineTypeKey = @"Wine Type";
static NSString* kCategoryTypeVarietalTypeKey = @"Varietal";
static NSString* kCategoryTypeKey = @"Name";
static NSString* kCategoryRefinementsKey = @"Refinements";
static NSString* kCategoryIdKey = @"Id";
static NSString* kCategoryNameKey = @"Name";

static NSString* kWineListKeyPath = @"Products.List";
static NSString* kWineNameKey = @"Name";
static NSString* kWineDescriptionKey = @"Description";
static NSString* kWineImageUrlKeyPath = @"Labels.Url";
static NSString* kWineVarietalKey = @"Varietal";
static NSString* kWineWineTypeKeyPath = @"Varietal.WineType";


