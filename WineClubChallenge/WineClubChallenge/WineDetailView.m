//
//  WineDetailView.m
//  WineClubChallenge
//
//  Created by C4Q on 6/1/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import "WineDetailView.h"
#import "Masonry.h"
#import "SettingsLabel.h"
#import "NSString_StripHtml.h"

@interface WineDetailView()

@property SettingsLabel* descriptionLabel;
@property SettingsLabel* addToCartLabel;
@property UITextField* quantityTextField;
@property UIButton* addToCartButton;
@property WineObject* wine;

@end

@implementation WineDetailView

CGFloat wineViewBorder = 16.0;

-(instancetype)initWithWine:(WineObject *)wine {
    self = [super init];
    if (self) {
        self.wine = wine;
    }
    [self setupViewHierarchy];
    [self setupConstraints];
    
    return self;
}

-(void)setupViewHierarchy {
    
    self.imageView = [[UIImageView alloc] init];
    if (self.wine.largeImage) {
        self.imageView.image = self.wine.largeImage;
    } else {
        self.imageView.image = self.wine.thumbImage;
    }
    self.descriptionLabel = [[SettingsLabel alloc] initWith: [self.wine.wineDescription stringByStrippingHTML]];
    self.descriptionLabel.numberOfLines = 0;
    self.addToCartLabel = [[SettingsLabel alloc] initWith:@"Quantity to add to cart"];
    
    self.quantityTextField = [[UITextField alloc] init];
    self.quantityTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    self.addToCartButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.addToCartButton setTitle:@"Add to Cart" forState:UIControlStateNormal];
    
    [self addSubview:self.imageView];
    [self addSubview:self.descriptionLabel];
    [self addSubview: self.addToCartLabel];
    [self addSubview:self.quantityTextField];
    [self addSubview:self.addToCartButton];
}

-(void)setupConstraints {
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(wineViewBorder);
        make.centerX.equalTo(self);
    }];
    
    [self.descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).with.offset(wineViewBorder);
        make.leading.equalTo(self.mas_leading).with.offset(wineViewBorder);
        make.trailing.equalTo(self.mas_trailing).with.offset(-wineViewBorder);
        make.centerX.equalTo(self);
    }];
    
    [self.addToCartLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.descriptionLabel.mas_bottom).with.offset(wineViewBorder);
        make.centerX.equalTo(self);
        make.bottom.lessThanOrEqualTo(self.mas_bottom).with.offset(-wineViewBorder);
    }];
    
    [self.quantityTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addToCartLabel.mas_bottom).with.offset(wineViewBorder);
        make.centerX.equalTo(self);
    }];
    
    [self.addToCartButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.quantityTextField.mas_bottom).with.offset(wineViewBorder);
        make.centerX.equalTo(self);
    }];
}

@end
