//
//  WineDetailView.m
//  WineClubChallenge
//
//  Created by C4Q on 6/1/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import "WineDetailView.h"
#import "Masonry.h"

@interface WineDetailView()

@property UIImageView* imageView;
@property UILabel* descriptionLabel;
@property UILabel* addToCartLabel;
@property UITextField* quantityTextField;
@property UIButton* addToCartButton;
@property WineObject* wine;

@end

@implementation WineDetailView

-(instancetype)initWithWine:(WineObject *)wine {
    self = [super init];
    if (self) {
        self.wine = wine;
    }
    [self setupViewHierarchy];
    
    return self;
}

-(void)setupViewHierarchy {
    self.imageView = [[UIImageView alloc] init];
    self.imageView.image = self.wine.largeImage;
    
    self.descriptionLabel = [[UILabel alloc] init];
    self.descriptionLabel.text = self.wine.description;
    
    
    self.addToCartLabel = [[UILabel alloc] init];
    self.addToCartLabel.text = @"Quantity to add to cart";

    self.quantityTextField = [[UITextField alloc] init];
    self.quantityTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    self.addToCartButton = [UIButton buttonWithType:UIButtonTypeSystem];

    [self addSubview:self.imageView];
    [self addSubview:self.descriptionLabel];
    [self addSubview: self.addToCartLabel];
    [self addSubview:self.quantityTextField];
    [self addSubview:self.addToCartButton];
}

@end
