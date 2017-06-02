//
//  ShoppingCartTableViewCell.m
//  WineClubChallenge
//
//  Created by C4Q on 6/2/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import "ShoppingCartTableViewCell.h"
#import "Masonry.h"

@interface ShoppingCartTableViewCell()

@property (nonatomic) UIImageView *wineImageView;
@property (nonatomic) UILabel *wineNameLabel;
@property (nonatomic) UIButton *plusOneButton;
@property (nonatomic) UIButton *minusOneButton;


@end

@implementation ShoppingCartTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {        
        [self setupViews];
        [self setupConstraints];
    }
    return self;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupViews {
    self.wineImageView = [[UIImageView alloc] initWithImage:self.wine.thumbImage];
    self.wineNameLabel = [[UILabel alloc] init];
    
    self.plusOneButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.plusOneButton setTitle:@"+1" forState:UIControlStateNormal];
    self.plusOneButton.tag = 1;
    [self.plusOneButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    self.minusOneButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.minusOneButton setTitle:@"-1" forState:UIControlStateNormal];
    self.minusOneButton.tag = -1;
    [self.minusOneButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];

    self.quantityLabel = [[UILabel alloc] init];
    
    [self.contentView addSubview: self.wineNameLabel];
    [self.contentView addSubview: self.wineImageView];
    [self.contentView addSubview: self.plusOneButton];
    [self.contentView addSubview: self.minusOneButton];
    [self.contentView addSubview: self.quantityLabel];
}

-(void)setupConstraints {
    [self.plusOneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView.mas_trailing).with.offset(-20);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.quantityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.plusOneButton.mas_leading).with.offset(-2);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.minusOneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.quantityLabel.mas_leading).with.offset(-2);
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

-(void)buttonPressed:(UIButton *)sender {
    
    [self.delegate AddToCartButtonPressed:self.wine quantity:sender.tag];
}

-(void)setWine:(WineObject *)wine {
    _wine = wine;
    self.wineNameLabel.text = wine.name;
    self.wineImageView.image = wine.thumbImage;
}

@end
