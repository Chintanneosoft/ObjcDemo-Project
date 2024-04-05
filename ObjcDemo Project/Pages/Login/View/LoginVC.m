//
//  LoginVC.m
//  ObjcDemo Project
//
//  Created by Neosoft on 01/03/24.
//

#import "LoginVC.h"
#import "LoginViewModel.h"
#import "RegisterVC.h"
#import "OTPVerificationVC.h"

//MARK: - LoginVC
@implementation LoginVC

//MARK: - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.VM = [[LoginViewModel alloc] init];
    self.VM.resultMessageDelegate = self;
    [self setUpUI];
}

//Functions
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

//MARK: - IBActions
- (IBAction)btnSignUpTapped:(id)sender {
    RegisterVC *nextVC = [[RegisterVC alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (IBAction)btnSubmitTapped:(id)sender {
    [self validateUser];
//    OTPVerificationVC *nextVC = [[OTPVerificationVC alloc] init];
//    [self.navigationController pushViewController:nextVC animated:YES];
}

//MARK: - ResultMessageDelegate Functions
- (void)resultWithMessage:(NSString *)resultMsg {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showAlertWithTitle:@"Title" message:resultMsg completion:^{
            if ([resultMsg  isEqual: @"Logged In successfully"]){
                OTPVerificationVC *nextVC = [[OTPVerificationVC alloc] init];
                [self.navigationController pushViewController:nextVC animated:YES];
            }
        }];
    });
}

@end
