//
//  WineReceiver.h
//  WineClubChallenge
//
//  Created by C4Q on 5/31/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WineObject.h"

@protocol WineReceiver <NSObject>
-(void)didReceiveWines: (NSMutableArray *)wines;
-(void)didReceiveWineImage: (WineObject *)wineWithImage;
@end
