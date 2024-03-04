//
//  LoginService.h
//  ObjcDemo Project
//
//  Created by Neosoft on 04/03/24.
//

#import <Foundation/Foundation.h>
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginService : NSObject
typedef void(^CompletionBlock)(User * _Nullable user, UserFailure * _Nullable userFailure, NSError * _Nullable error);

+ (void)loginUserWithEmail:(NSString *)email password:(NSString *)password completion:(CompletionBlock)completion ;
@end

NS_ASSUME_NONNULL_END
