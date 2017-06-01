//
//  CategoryViewController.m
//  WineClubChallenge
//
//  Created by C4Q on 5/31/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import "Masonry.h"
#import "CategoryViewController.h"
#import "WineCategoryInfo.h"
#import "CategoryTableViewCell.h"
#import "APINetworkCaller.h"
#import "SettingsView.h"

@interface CategoryViewController ()

@property NSArray *categories;
@property UITableView *categoryTableView;
@property SettingsView *settingsView;

@end

@implementation CategoryViewController

NSString *kCategoryCellId = @"Category Cell ID";


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupViewHierarchy];
    [self setupConstraints];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didReceiveCategories:(NSArray *)categories {
    self.categories = categories;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.categoryTableView reloadData];
    });
}

#pragma SettingsViewDelegate Methods

-(void)search:(NSPredicate *)forCategory {
    
}

#pragma TableView DataSource && Delegate Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //Although its implied at 1, I always feel better having this function just so I don't have to think about where to put it when I want to change the sections
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.categories.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WineCategory *currentCategory = self.categories[indexPath.row];

    CategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: kCategoryCellId forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[CategoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCategoryCellId];
    }
    
    [cell setCategory:currentCategory];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CategoryTableViewCell *currentCell = [tableView cellForRowAtIndexPath:indexPath];
    
    [[[ApiNetworkCaller alloc] init] fetchWinesInCategory: currentCell.category];    
}

#pragma View Setup

-(void)setupViewHierarchy {
    self.categoryTableView = [[UITableView alloc] init];
    self.categoryTableView.delegate = self;
    self.categoryTableView.dataSource = self;
    
    self.settingsView = [[SettingsView alloc] init];
    
    [self.categoryTableView registerClass: [CategoryTableViewCell class] forCellReuseIdentifier:kCategoryCellId];
    [self.view addSubview:self.categoryTableView];
    [self.view addSubview:self.settingsView];
}

-(void)setupConstraints {
    [self.settingsView mas_makeConstraints:^(MASConstraintMaker *make) {
        //normally i would make the offset dynamic, but I couldn't find an extremely simple solution and I know that the iOS status bar is always 20 points.
        make.top.equalTo(self.view.mas_top).offset(20);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.categoryTableView.mas_top);
    }];
    
    [self.categoryTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.settingsView.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottomMargin);
    }];
}

@end
