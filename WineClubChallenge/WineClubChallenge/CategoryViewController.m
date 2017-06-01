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

@interface CategoryViewController ()

@property NSArray *categories;
@property UITableView *categoryTableView;
//@property

@end

@implementation CategoryViewController

NSString *kCategoryCellId = @"Category Cell ID";


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    [self setUpViewHierarchy];
    [self setUpConstraints];
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //Although its implied at 1, I always feel better having this function just so I don't have to think about where to put it when I want to change the sections
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.categories.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: kCategoryCellId forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCategoryCellId];
    }
    WineCategory *currentCategory = self.categories[indexPath.row];
    cell.textLabel.text = currentCategory.name;
    
    return cell;
}

-(void)setUpViewHierarchy {
    self.categoryTableView = [[UITableView alloc] init];
    self.categoryTableView.delegate = self;
    self.categoryTableView.dataSource = self;
    
    [self.categoryTableView registerClass: [UITableViewCell class] forCellReuseIdentifier:kCategoryCellId];
    [self.view addSubview:self.categoryTableView];
}

-(void)setUpConstraints {
    [self.categoryTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

@end
