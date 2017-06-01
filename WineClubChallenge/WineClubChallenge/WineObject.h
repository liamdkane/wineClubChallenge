//
//  WineObject.h
//  WineClubChallenge
//
//  Created by C4Q on 5/30/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#ifndef WineObject_h
#define WineObject_h
#import <Foundation/Foundation.h>

@interface WineObject : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *wineDescription;
@property (nonatomic, retain) NSString *imageURL;
@property (nonatomic, retain) NSArray *category;
-(instancetype)initWithDictionary:(NSDictionary *)wineDictionary;


@end


#endif /* WineObject_h */
