//
//  RegisterVC.m
//  ObjcDemo Project
//
//  Created by Neosoft on 01/03/24.
//

#import "RegisterVC.h"
#import "TextFieldTableViewCell.h"
#import "RegisterHeaderView.h"

@interface RegisterVC ()

@end

@implementation RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTableView];
    [self setUpUI];
    
}

- (void) setUpUI{
//    self.navigationItem.title = @"Sign Up";
//    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
}

- (void)setTableView {
    self.registerTableView.delegate = self;
    self.registerTableView.dataSource = self;
    
    [self.registerTableView registerNib:[UINib nibWithNibName:@"TextFieldTableViewCell" bundle:nil] forCellReuseIdentifier: @"TextFieldTableViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldTableViewCell" forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            [cell configureCellwithPlaceholder:@"First Name" image:[UIImage systemImageNamed:@"person.circle.fill"]];
            break;
        case 1:
            [cell configureCellwithPlaceholder:@"Last Name" image:[UIImage systemImageNamed:@"person.circle.fill"]];
            break;
        case 2:
            [cell configureCellwithPlaceholder:@"Email" image:[UIImage systemImageNamed:@"envelope.circle.fill"]];
            break;
        case 3:
            [cell configureCellwithPlaceholder:@"Phone Number" image:[UIImage systemImageNamed:@"phone.bubble.fill"]];
            break;
        case 4:
            [cell configureCellwithPlaceholder:@"Password" image:[UIImage systemImageNamed:@"lock.circle.fill"]];
            break;
        case 5:
            [cell configureCellwithPlaceholder:@"Confirm Password" image:[UIImage systemImageNamed:@"lock.circle.fill"]];
            break;
        default:
            break;
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    RegisterHeaderView *view = [[RegisterHeaderView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    [view setLabelText:@"Sign Up"];
    view.lblRegister.backgroundColor = [UIColor whiteColor];
    view.backgroundColor = [UIColor redColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
