//
//  RegisterService.h
//  ObjcDemo Project
//
//  Created by Neosoft on 22/03/24.
//

#import <Foundation/Foundation.h>
#import "API Manager.h"
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface RegisterService : NSObject

+ (void)registerUserWithFname:(NSString *)fname
                        lname:(NSString *)lname
                        email:(NSString *)email
                         pass:(NSString *)pass
                        cpass:(NSString *)cpass
                       gender:(NSString *)gender
                        phone:(NSString *)phone
                   completion:(void (^)(User * _Nullable user, NSError * _Nullable error))completion;

@end

NS_ASSUME_NONNULL_END
