//
//  Validation.m
//  ObjcDemo Project
//
//  Created by Neosoft on 01/03/24.
//

#import <Foundation/Foundation.h>

@interface Validation : NSObject

- (NSString *)registerValidationWithFirstName:(NSString *)firstName lastName:(NSString *)lastName email:(NSString *)email password:(NSString *)password confirmPassword:(NSString *)confirmPassword mobileNumber:(NSString *)mobileNumber;

- (NSString *)loginValidationWithEmail:(NSString *)email password:(NSString *)password;

- (NSString *)resetPassValidationWithOldPass:(NSString *)oldPass newPass:(NSString *)newPass confirmPass:(NSString *)confirmPass;

- (NSString *)updateUserValidationWithFname:(NSString *)fname lname:(NSString *)lname email:(NSString *)email dob:(NSString *)dob profilePic:(NSString *)profilePic phone:(NSString *)phone;

@end

@implementation Validation

- (NSString *)registerValidationWithFirstName:(NSString *)firstName lastName:(NSString *)lastName email:(NSString *)email password:(NSString *)password confirmPassword:(NSString *)confirmPassword mobileNumber:(NSString *)mobileNumber {
    // Your validation logic here
    return nil;
}

- (NSString *)loginValidationWithEmail:(NSString *)email password:(NSString *)password {
    // Your validation logic here
    return nil;
}

- (NSString *)resetPassValidationWithOldPass:(NSString *)oldPass newPass:(NSString *)newPass confirmPass:(NSString *)confirmPass {
    // Your validation logic here
    return nil;
}

- (NSString *)updateUserValidationWithFname:(NSString *)fname lname:(NSString *)lname email:(NSString *)email dob:(NSString *)dob profilePic:(NSString *)profilePic phone:(NSString *)phone {
    // Your validation logic here
    return nil;
}

@end
