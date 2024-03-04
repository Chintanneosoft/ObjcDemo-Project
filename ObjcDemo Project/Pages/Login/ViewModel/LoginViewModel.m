//
//  LoginViewModel.m
//  ObjcDemo Project
//
//  Created by Neosoft on 01/03/24.
//

#import "LoginViewModel.h"
#import "Validation.h"
#import "LoginService.h"

@implementation LoginViewModel


- (void)validateLoginCredentailsWithEmail: (NSString *)email password:(NSString *)password{
    
    Validation *valid = [[Validation alloc] init];
    
    NSString *validationResult = [valid loginValidationWithEmail:email password:password];
    
    if (validationResult != nil){
        [LoginService loginUserWithEmail:email password:password completion:^(User *user, UserFailure *userFailure, NSError *error) {
            if (user != nil) {
//                [[NSUserDefaults standardUserDefaults] setObject:user.accessToken ? user.accessToken : @"" forKey:UserDefaultsKeysAccessToken];
//                [[NSUserDefaults standardUserDefaults] setObject:user.firstName ? user.firstName : @"" forKey:UserDefaultsKeysUserFirstName];
//                [self.loginViewModelDelegate showAlertWithResult:YES message:user.userMsg];
                NSLog(@"%@", user.user_msg);
            } else if (userFailure != nil) {
//                [self.loginViewModelDelegate showAlertWithResult:NO message:userFailure.userMsg];
                NSLog(@"%@", userFailure.user_msg);
            } else if (error != nil) {
                NSLog(@"%@", error.localizedDescription);
//                [self.loginViewModelDelegate showAlertWithResult:NO message:error.localizedDescription];
            }
        }];
    } else {
        NSLog(@"%@", validationResult);
    }
}

@end
