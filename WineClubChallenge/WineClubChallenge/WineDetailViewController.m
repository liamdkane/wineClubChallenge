//
//  WineDetailViewController.m
//  WineClubChallenge
//
//  Created by C4Q on 6/1/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import "WineDetailViewController.h"

@interface WineDetailViewController ()

@property WineObject* wine;

@end

@implementation WineDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(instancetype)initWithWine:(WineObject *)wine {
    self = [super init];
    if (self) {
        self.wine = wine;
    }
    return self;
}



@end
