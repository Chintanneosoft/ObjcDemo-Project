//
//  LoginService.m
//  ObjcDemo Project
//
//  Created by Neosoft on 04/03/24.
//

#import "LoginService.h"
#import "API Manager.h"

@implementation LoginService

+ (void)loginUserWithEmail:(NSString *)email password:(NSString *)password completion:(CompletionBlock)completion {
        
    NSDictionary *params = @{@"email" : email, @"password" : password};
        
    APIServices *apiService = [[APIServices alloc] initWithService:APIServiceUserLogin param:params];

    [[APIManager sharedInstance] callRequestWithAPICallType:apiService completion:^(NSData *data, NSError *error){
                if (error) {
                    completion(nil, nil, error);
                } else {
                    NSError *jsonError;
                    User *user = [[User alloc] initWithData:data error:&jsonError];
                    if (jsonError) {
                        UserFailure *userFailure = [[UserFailure alloc] initWithData:data error:&jsonError];
                        if (jsonError) {
                            completion(nil, nil, jsonError);
                        } else {
                            completion(nil, userFailure, nil);
                        }
                    } else {
                        completion(user, nil, nil);
                    }
                }
            }];
        }




@end
