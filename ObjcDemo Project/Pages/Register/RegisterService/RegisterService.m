//
//  RegisterService.m
//  ObjcDemo Project
//
//  Created by Neosoft on 22/03/24.
//

#import "RegisterService.h"

// MARK: - Register

@implementation RegisterService

+ (void)registerUserWithFname:(NSString *)fname
                        lname:(NSString *)lname
                        email:(NSString *)email
                         pass:(NSString *)pass
                        cpass:(NSString *)cpass
                       gender:(NSString *)gender
                        phone:(NSString *)phone
                   completion:(void (^)(User * _Nullable user, NSError * _Nullable error))completion {
    NSNumber *phoneNumber = @([phone intValue]);
    NSDictionary *params = @{@"first_name" : fname,
                             @"last_name" : lname,
                             @"email" : email,
                             @"password" : pass,
                             @"confirm_password" : cpass,
                             @"gender" : gender,
                             @"phone_no" : phoneNumber};
        
    APIServices *apiService = [[APIServices alloc] initWithService:APIServiceUserRegister param:params];
    
    [[APIManager sharedInstance] callRequestWithAPICallType:apiService completion:^(NSData *data, NSError *error){
            if (error) {
            completion(nil, error);
        } else {
            User *user = [[User alloc] initWithData:data error:&error];
            if (error) {
                completion(nil, error);
            } else {
                completion(user, nil);
            }
        }
    }];
}

@end
