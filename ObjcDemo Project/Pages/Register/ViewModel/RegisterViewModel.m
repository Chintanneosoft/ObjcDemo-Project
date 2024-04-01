#import "RegisterViewModel.h"
#import "Validation.h"

@implementation RegisterViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _registerInputData = [@{
            @"firstName": @"",
            @"lastName": @"",
            @"email": @"",
            @"phone": @"",
            @"gender": @"",
            @"password": @"",
            @"confirmPassword": @""
        } mutableCopy];
    }
    return self;
}

- (void) callValidations{

    Validation *valid = [[Validation alloc] init];
    NSString *validationResult = [valid registerValidationWithFirstName: _registerInputData[@"firstName"]
                                                               lastName:_registerInputData[@"lastName"]
                                                                  email:_registerInputData[@"email"]
                                                               password:_registerInputData[@"password"]
                                                        confirmPassword:_registerInputData[@"confirmPassword"]
                                                           mobileNumber:_registerInputData[@"phone"]];

    if (validationResult == nil) {
        [RegisterService registerUserWithFname:_registerInputData[@"firstName"]
                                                 lname:_registerInputData[@"lastName"]
                                                 email:_registerInputData[@"email"]
                                                  pass:_registerInputData[@"password"]
                                                 cpass:_registerInputData[@"confirmPassword"]
                                                gender:_registerInputData[@"gender"]
                                                 phone:_registerInputData[@"phone"]
                                           completion:^(User *user, NSError *error) {
            if (user) {
//                [[NSUserDefaults standardUserDefaults] setObject:user.data.access_token ? user.data.access_token : @"" forKey:@"accessToken"];
                NSLog(@"%@", user.user_msg);
                // [self.registerViewModelDelegate showAlertWithResult:YES message:user.user_msg];
            } else if (error) {
                NSLog(@"%@", error.localizedDescription);
                // [self.registerViewModelDelegate showAlertWithResult:NO message:error.localizedDescription];
            }
        }];
    } else {
        NSLog(@"%@", validationResult);
    }
}

@end
