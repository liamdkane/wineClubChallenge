//
//  WineDetailViewController.m
//  WineClubChallenge
//
//  Created by C4Q on 6/1/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import "WineDetailViewController.h"
#import "WineDetailView.h"
#import "Masonry.h"

@interface WineDetailViewController ()

@property WineObject* wine;
@property WineDetailView* detailView;

@end

@implementation WineDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.detailView = [[WineDetailView alloc] initWithWine:self.wine];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:self.detailView];
    [self.detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(instancetype)initWithWine:(WineObject *)wine {
    self = [super init];
    if (self) {
        self.wine = wine;
    }
    [self.navigationItem setTitle:wine.name];
    return self;
}

-(void)setImage:(UIImage *)image {
    [self.detailView.imageView setImage:image];
    [self.detailView layoutIfNeeded];
}

@end
