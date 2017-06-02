//
//  WineDetailView.h
//  WineClubChallenge
//
//  Created by C4Q on 6/1/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WineObject.h"

@interface WineDetailView : UIView

@property UIImageView* imageView;
-(instancetype)initWithWine: (WineObject *)wine;

@end
