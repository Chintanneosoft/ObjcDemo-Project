//
//  LoginViewModel.m
//  ObjcDemo Project
//
//  Created by Neosoft on 01/03/24.
//

#import "LoginViewModel.h"
#import "Validation.h"
#import "LoginService.h"
//MARK: - LoginViewModel
@implementation LoginViewModel
// Function to validate and send for API Call
- (void)validateLoginCredentailsWithEmail: (NSString *)email password:(NSString *)password{
    
    Validation *valid = [[Validation alloc] init];
    
    NSString *validationResult = [valid loginValidationWithEmail:email password:password];
    
    if (validationResult == nil){
        [LoginService loginUserWithEmail:email password:password completion:^(User *user, UserFailure *userFailure, NSError *error) {
            if (user != nil) {
                [[NSUserDefaults standardUserDefaults] setObject:user.data.access_token ? user.data.access_token : @"" forKey: @"accessToken"];
//                [[NSUserDefaults standardUserDefaults] setObject:user.firstName ? user.firstName : @"" forKey:UserDefaultsKeysUserFirstName];
//                [self.loginViewModelDelegate showAlertWithResult:YES message:user.userMsg];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.resultMessageDelegate resultWithMessage: user.user_msg];
                });
               
                NSLog(@"%@", user.user_msg);
            } else if (userFailure != nil) {
//                [self.loginViewModelDelegate showAlertWithResult:NO message:userFailure.userMsg];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.resultMessageDelegate resultWithMessage: userFailure.user_msg];
                });
                NSLog(@"%@", userFailure.user_msg);
            } else if (error != nil) {
                NSLog(@"%@", error.localizedDescription);
//                [self.loginViewModelDelegate showAlertWithResult:NO message:error.localizedDescription];
            }
        }];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.resultMessageDelegate resultWithMessage: validationResult];
        });
        NSLog(@"%@", validationResult);
    }
}

@end
