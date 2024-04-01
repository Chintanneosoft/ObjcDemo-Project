//
//  LoginVC.h
//  ObjcDemo Project
//
//  Created by Neosoft on 01/03/24.
//

#import <UIKit/UIKit.h>
#import "LoginViewModel.h"

NS_ASSUME_NONNULL_BEGIN
//MARK: - LoginVC
@interface LoginVC : UIViewController<UITextFieldDelegate,LoginViewModelDelegate>

//MARK: - IBOutlets
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *lblLogin;
@property (weak, nonatomic) IBOutlet UITextField *txtUserName;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UIImageView *imgUserName;
@property (weak, nonatomic) IBOutlet UIImageView *imgPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnSignUp;
@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;

//ViewModel
@property (strong, nonatomic) LoginViewModel *VM;

//IBActions
- (IBAction)btnSignUpTapped:(id)sender;
- (IBAction)btnSubmitTapped:(id)sender;

@end

NS_ASSUME_NONNULL_END
