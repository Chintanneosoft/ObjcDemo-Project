//
//  Validation.h
//  ObjcDemo Project
//
//  Created by Neosoft on 04/03/24.
//

#ifndef Validation_h
#define Validation_h

#import <Foundation/Foundation.h>

@interface Validation : NSObject

- (NSString *)registerValidationWithFirstName:(NSString *)firstName lastName:(NSString *)lastName email:(NSString *)email password:(NSString *)password confirmPassword:(NSString *)confirmPassword mobileNumber:(NSString *)mobileNumber;

- (NSString *)loginValidationWithEmail:(NSString *)email password:(NSString *)password;

- (NSString *)resetPassValidationWithOldPass:(NSString *)oldPass newPass:(NSString *)newPass confirmPass:(NSString *)confirmPass;

- (NSString *)updateUserValidationWithFname:(NSString *)fname lname:(NSString *)lname email:(NSString *)email dob:(NSString *)dob profilePic:(NSString *)profilePic phone:(NSString *)phone;

@end

#endif /* Validation_h */
