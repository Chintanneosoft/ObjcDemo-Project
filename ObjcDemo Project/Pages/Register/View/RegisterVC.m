//
//  RegisterVC.m
//  ObjcDemo Project
//
//  Created by Neosoft on 01/03/24.
//

#import "RegisterVC.h"
#import "TextFieldTableViewCell.h"
#import "SubmitButtonTableViewCell.h"
#import "RegisterHeaderView.h"

//MARK: - RegisterVC
@implementation RegisterVC

//MARK: - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTableView];
    [self setUpUI];
    _VM = [[RegisterViewModel alloc] init];
}

- (void) setUpUI{
//    self.navigationItem.title = @"Sign Up";
//    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
}

- (void) sendForValidation{
    [_VM callValidations];
}

- (void)setTableView {
    self.registerTableView.delegate = self;
    self.registerTableView.dataSource = self;
    
    [self.registerTableView registerNib:[UINib nibWithNibName:@"TextFieldTableViewCell" bundle:nil] forCellReuseIdentifier: @"TextFieldTableViewCell"];
    [self.registerTableView registerNib:[UINib nibWithNibName:@"SubmitButtonTableViewCell" bundle:nil] forCellReuseIdentifier: @"SubmitButtonTableViewCell"];
    [self.registerTableView registerNib:[UINib nibWithNibName:@"RegisterHeaderView" bundle:nil] forCellReuseIdentifier:@"RegisterHeaderView"];
}

//MARK: - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0){
        return 7;
    }
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldTableViewCell" forIndexPath:indexPath];
        cell.txtTextFieldCell.tag = indexPath.row + 1;
        cell.delegate = self;
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
                [cell configureCellwithPlaceholder:@"Phone Number" image:[UIImage systemImageNamed:@"phone.circle.fill"]];
                break;
            case 4:
                [cell configureCellwithPlaceholder:@"Gender" image:[UIImage imageNamed:@"gender"]];
                break;
            case 5:
                [cell configureCellwithPlaceholder:@"Password" image:[UIImage systemImageNamed:@"lock.circle.fill"]];
                break;
            case 6:
                [cell configureCellwithPlaceholder:@"Confirm Password" image:[UIImage systemImageNamed:@"lock.circle.fill"]];
                break;
            default:
                break;
        }
        return cell;
    }
    
    SubmitButtonTableViewCell *buttonCell = [tableView dequeueReusableCellWithIdentifier:@"SubmitButtonTableViewCell" forIndexPath:indexPath];
    buttonCell.submitButtonTapHandler = ^(SubmitButtonTableViewCell *cell) {
        [self sendForValidation];
    };
    return buttonCell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    RegisterHeaderView *headerView = [[RegisterHeaderView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)];
//    NSLog(@"%@", headerView.lblRegister);
//    [headerView setLabelText:@"Sign Up"];   //Not working
    
    UILabel *registerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)];
    registerLabel.text = @"Sign Up";
    registerLabel.textAlignment = NSTextAlignmentCenter;
    registerLabel.font = [UIFont fontWithName:@"KohinoorDevanagari-Semibold" size:24.0f];
    registerLabel.textColor = [UIColor whiteColor];
    [headerView addSubview:registerLabel];
    
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:registerLabel
                                                                         attribute:NSLayoutAttributeCenterX
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:headerView
                                                                         attribute:NSLayoutAttributeCenterX
                                                                        multiplier:1.0
                                                                          constant:0.0];

    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:registerLabel
                                                                         attribute:NSLayoutAttributeCenterY
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:headerView
                                                                         attribute:NSLayoutAttributeCenterY
                                                                        multiplier:1.0
                                                                          constant:0.0];

    // Activate constraints
    [NSLayoutConstraint activateConstraints:@[centerXConstraint, centerYConstraint]];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0){
        return 50;
    }
    return 0;
}

//MARK: - TextFieldTableViewCellDelegate Protocol 
- (void)tableViewCellDidSubmitTextFieldValues:(NSString *)textFieldValue textFieldtag:(NSInteger)tag {
    switch (tag) {
        case 1:
            _VM.registerInputData[@"firstName"] = textFieldValue;
            break;
        case 2:
            _VM.registerInputData[@"lastName"] = textFieldValue;
            break;
        case 3:
            _VM.registerInputData[@"email"] = textFieldValue;
            break;
        case 4:
            _VM.registerInputData[@"phone"] = textFieldValue;
            break;
        case 5:
            _VM.registerInputData[@"gender"] = textFieldValue;
            break;
        case 6:
            _VM.registerInputData[@"password"] = textFieldValue;
            break;
        case 7:
            _VM.registerInputData[@"confirmPassword"] = textFieldValue;
            break;
        
        default:
            break;
    }
}

@end
