//
//  HomeVC.m
//  ObjcDemo Project
//
//  Created by Neosoft on 01/04/24.
//

#import "HomeVC.h"
#import "RegisterVC.h"
#import "HomeCategoriesTableViewCell.h"

//MARK: - HomeVC
@implementation HomeVC

//MARK: - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
    self.VM = [[HomeViewModel alloc] init];
    self.view.backgroundColor = [UIColor colorNamed:@"primary"];
}

- (void)setTableView{
    self.homeTableView.delegate = self;
    self.homeTableView.dataSource = self;

    [self.homeTableView registerNib:[UINib nibWithNibName:@"HomeCategoriesTableViewCell" bundle:nil] forCellReuseIdentifier: @"HomeCategoriesTableViewCell"];
}

//MARK: - TableView Functions
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    HomeCategoriesTableViewCell *categoryCell = [tableView dequeueReusableCellWithIdentifier:@"HomeCategoriesTableViewCell" forIndexPath:indexPath];
    
    return  categoryCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (NSInteger)self.VM.categoryProductList[section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}



@end
