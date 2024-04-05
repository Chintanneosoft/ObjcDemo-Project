//
//  HomeVC.m
//  ObjcDemo Project
//
//  Created by Neosoft on 01/04/24.
//

#import "HomeVC.h"
#import "RegisterVC.h"
#import "HomeCategoriesTableViewCell.h"
#import "RegisterHeaderView.h"

//MARK: - HomeVC
@implementation HomeVC

//MARK: - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
    [self setUpUI];
    [self getProductList];
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}

//Function
- (void) setUpUI{
    self.VM = [[HomeViewModel alloc] init];
    self.VM.resultMessageDelegate = self;
    self.view.backgroundColor = [UIColor colorNamed:@"secondary"];
}


- (void)setTableView{
    self.homeTableView.delegate = self;
    self.homeTableView.dataSource = self;

    [self.homeTableView registerNib:[UINib nibWithNibName:@"HomeCategoriesTableViewCell" bundle:nil] forCellReuseIdentifier: @"HomeCategoriesTableViewCell"];
}

- (void)getProductList{
    [self.VM callForGetProductList];
}

//MARK: - TableView Functions
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    HomeCategoriesTableViewCell *categoryCell = [tableView dequeueReusableCellWithIdentifier:@"HomeCategoriesTableViewCell" forIndexPath:indexPath];
    [categoryCell configureCellWithProductList:self.VM.categoryProductList[indexPath.section][@"CategoryProducts"]];
    return  categoryCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.VM.categoryProductList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.view.frame.size.width/1.8;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    RegisterHeaderView *headerView = [[RegisterHeaderView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)];
    UILabel *registerLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, tableView.frame.size.width, 30)];
    switch (section) {
        case 0:
            registerLabel.text = @"Tables";
            break;
        case 1:
            registerLabel.text = @"Chairs";
            break;
        case 2:
            registerLabel.text = @"Sofa";
            break;
        case 3:
            registerLabel.text = @"Cupboards";
            break;
            
        default:
            break;
    }
    
    registerLabel.textAlignment = NSTextAlignmentLeft;
    registerLabel.font = [UIFont fontWithName:@"KohinoorDevanagari-Semibold" size:22.0f];
    registerLabel.textColor = [UIColor whiteColor];
    [headerView addSubview:registerLabel];
    
    
    return headerView;
}

//MARK: - ResultMessageDelegate Function
- (void)resultWithMessage:(NSString *)resultMsg {
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([resultMsg  isEqual: @"Products Fetched SuccessFully"]){
            [self.homeTableView reloadData];
            NSLog(@"%@", self.VM.categoryProductList);
        } else {
            [self showAlertWithTitle:@"Alert" message:resultMsg completion:^{}];
        }
    });
}

@end
