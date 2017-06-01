//
//  NetworkAnswering.h
//  WineClubChallenge
//
//  Created by C4Q on 5/31/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WineObject.h"

@protocol NetworkAnswering <NSObject>
-(void)didReceiveCategories: (NSDictionary *)json;
-(void)didReceiveWine: (NSDictionary *)json;
-(void)didReceiveWineImage:(WineObject *)wineWithImage thumb: (BOOL)isItThumb;
@end
