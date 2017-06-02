//
//  WineObject.h
//  WineClubChallenge
//
//  Created by C4Q on 5/30/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#ifndef WineObject_h
#define WineObject_h
#import <UIKit/UIKit.h>

@interface WineObject : NSObject<NSCopying>

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *wineDescription;
@property (nonatomic, retain) NSString *thumbImageURL;
@property (nonatomic, retain) NSString *largeImageURL;
@property (nonatomic, retain) NSArray *category;
@property (nonatomic, retain) UIImage *thumbImage;
@property (nonatomic, retain) UIImage *largeImage;
@property (nonatomic, retain) NSDate *timeAddedToCart;

-(instancetype)initWithDictionary:(NSDictionary *)wineDictionary;

-(BOOL)isEqual:(WineObject*)object;
-(NSUInteger)hash;


@end


#endif /* WineObject_h */
