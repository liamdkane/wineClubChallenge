//
//  WineTableViewCell.m
//  WineClubChallenge
//
//  Created by C4Q on 6/1/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import "WineTableViewCell.h"
#import "Masonry.h"

@interface WineTableViewCell()

@property (nonatomic) UILabel *wineNameLabel;
@property UIButton *addToCartButton;

@end

@implementation WineTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
        [self setupConstraints];
    }
    return self;
}

-(void)setWine:(WineObject *)wine {
    _wine = wine;
    self.wineNameLabel.text = wine.name;
    self.wineImageView.image = wine.thumbImage;
}

-(void)addToCartButtonPressed {
    [self.delegate AddToCartButtonPressed:self.wine quantity: 1];
}

-(void)setupView {
    self.wineImageView = [[UIImageView alloc] initWithImage:self.wine.thumbImage];
    self.wineNameLabel = [[UILabel alloc] init];
    self.addToCartButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.addToCartButton setTitle:@"Add 1 To Cart" forState:UIControlStateNormal];
    [self.addToCartButton addTarget:self action:@selector(addToCartButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview: self.wineNameLabel];
    [self.contentView addSubview: self.wineImageView];
    [self.contentView addSubview:self.addToCartButton];
    [self bringSubviewToFront:self.addToCartButton];
}

-(void)setupConstraints {
    [self.addToCartButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView.mas_trailing).with.offset(-20);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.wineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView.mas_leading).with.offset(20);
        make.top.equalTo(self.contentView.mas_top).with.offset(2);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-2);
    }];
    
    [self.wineNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.wineImageView.mas_trailing).with.offset(8);
        make.centerY.equalTo(self.contentView);
    }];

}

@end
