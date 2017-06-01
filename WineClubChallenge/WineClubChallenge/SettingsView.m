//
//  SettingsView.m
//  WineClubChallenge
//
//  Created by C4Q on 6/1/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import "SettingsView.h"
#import "Masonry.h"
#import "SettingsLabel.h"
#import "AppDelegate.h"

@interface SettingsView()

@property id<SettingsReceiverDelegate> delegate;

@property (nonatomic) UISearchBar *categorySearchBar;

@property (nonatomic) SettingsLabel *categoryTypeLabel;
@property (nonatomic) UISegmentedControl *categoryTypeControl;

@property (nonatomic) SettingsLabel *alphabeticalFilterLabel;
@property (nonatomic) UISegmentedControl *alphabeticalFilterControl;

@property (nonatomic) UIButton *allButton;

@end

@implementation SettingsView

CGFloat viewBorder = 8.0;

-(instancetype)init {
    self = [super init];
    
    AppDelegate* app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.delegate = app.settingsMessenger;
    
    [self setUpViewHierarchy];
    [self configureConstraints];
    return self;
}


-(void)setUpViewHierarchy {
    self.categorySearchBar = [[UISearchBar alloc]init];
    self.categorySearchBar.delegate = self.delegate;
    self.categorySearchBar.text = @"Search Categories";
    
    self.categoryTypeLabel = [[SettingsLabel alloc] initWith:@"Filter by:"];
    self.categoryTypeControl = [[UISegmentedControl alloc]initWithItems:@[@"Wine Type",@"Varietal",@"Both"]];
    [self.categoryTypeControl addTarget:self action:@selector(didSelectCategory:) forControlEvents:UIControlEventValueChanged];
    
    self.alphabeticalFilterLabel = [[SettingsLabel alloc] initWith:@"Sort by:"];
    self.alphabeticalFilterControl = [[UISegmentedControl alloc] initWithItems:@[@"A-Z",@"Z-A",@"None"]];
    [self.alphabeticalFilterControl addTarget:self action:@selector(didSelectSort:) forControlEvents:UIControlEventValueChanged];

    self.allButton = [UIButton buttonWithType: UIButtonTypeSystem];
    [self.allButton setTitle:@"All Wines" forState:UIControlStateNormal];
    [self.allButton addTarget:self action:@selector(didPressAllButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.categorySearchBar];
    [self addSubview:self.categoryTypeLabel];
    [self addSubview:self.categoryTypeControl];
    [self addSubview:self.alphabeticalFilterLabel];
    [self addSubview:self.alphabeticalFilterControl];
    [self addSubview:self.allButton];
}

-(void)configureConstraints {
    [self.categorySearchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(viewBorder);
        make.left.equalTo(self.mas_left).with.offset(viewBorder);
        make.right.equalTo(self.mas_right).with.offset(-viewBorder);
    }];
    
    [self.categoryTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.categorySearchBar.mas_bottom).with.offset(viewBorder);
        make.centerX.equalTo(self);
    }];
    
    [self.categoryTypeControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.categoryTypeLabel.mas_bottom).with.offset(viewBorder);
        make.left.equalTo(self.mas_left).with.offset(viewBorder);
        make.right.equalTo(self.mas_right).with.offset(-viewBorder);
    }];
    
    [self.alphabeticalFilterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.categoryTypeControl.mas_bottom).with.offset(viewBorder);
        make.centerX.equalTo(self);
    }];

    [self.alphabeticalFilterControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.alphabeticalFilterLabel.mas_bottom).with.offset(viewBorder);
        make.centerX.equalTo(self);
    }];
    
    [self.allButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.alphabeticalFilterControl.mas_bottom).with.offset(viewBorder);
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.mas_bottom).with.offset(-viewBorder);
    }];

}

#pragma Targets

-(void)didPressAllButton {
    [self.delegate didPressAllButton];
}

-(void)didSelectCategory: (UISegmentedControl *)sender {
    NSString* category = [sender titleForSegmentAtIndex: sender.selectedSegmentIndex];
    [self.delegate didSelectCategoryType:category];
}

-(void)didSelectSort: (UISegmentedControl *)sender {
    NSString* category = [sender titleForSegmentAtIndex: sender.selectedSegmentIndex];
    [self.delegate didSelectSortType:category];
}

@end

