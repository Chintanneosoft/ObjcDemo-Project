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
    [self setUpUI];
    [self getProductList];
}

- (void) setUpUI{
    self.VM = [[HomeViewModel alloc] init];
    self.VM.resultMessageDelegate = self;
    self.view.backgroundColor = [UIColor colorNamed:@"primary"];
    [self.navigationController setNavigationBarHidden:YES];
    self.navigationController.title = @"NeoStore";
    self.navigationController.navigationItem.title = @"NeoStore";
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

- (void)resultWithMessage:(NSString *)resultMsg {
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([resultMsg  isEqual: @"Products Fetched SuccessFully"]){
            [self.homeTableView reloadData];
            NSLog(@"%@", self.VM.categoryProductList);
        } else {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert" message:resultMsg preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                
            }];
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    });
}


@end
