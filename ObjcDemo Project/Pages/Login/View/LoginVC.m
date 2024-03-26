//
//  LoginVC.m
//  ObjcDemo Project
//
//  Created by Neosoft on 01/03/24.
//

#import "LoginVC.h"
#import "LoginViewModel.h"
#import "RegisterVC.h"

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.VM = [[LoginViewModel alloc] init];
    [self setUpUI];
}

- (void)setDelegates{
    self.txtUserName.delegate = self;
    self.txtPassword.delegate = self;
}

- (void)setUpUI{
    self.containerView.layer.cornerRadius = 20;
    self.btnSubmit.clipsToBounds = YES;
    self.btnSignUp.clipsToBounds = YES;
    self.btnSubmit.layer.cornerRadius = 40;
    self.btnSignUp.layer.cornerRadius = 40;
}

- (void) validateUser{
    [self.VM validateLoginCredentailsWithEmail: self.txtUserName.text password:self.txtPassword.text];
}


- (IBAction)btnSignUpTapped:(id)sender {
    RegisterVC *nextVC = [[RegisterVC alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (IBAction)btnSubmitTapped:(id)sender {
    [self validateUser];
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
