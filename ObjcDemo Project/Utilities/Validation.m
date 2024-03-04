//
//  Validation.m
//  ObjcDemo Project
//
//  Created by Neosoft on 01/03/24.
//

#import <Foundation/Foundation.h>
#import "Validation.h"

@implementation Validation

- (NSString *)registerValidationWithFirstName:(NSString *)firstName lastName:(NSString *)lastName email:(NSString *)email password:(NSString *)password confirmPassword:(NSString *)confirmPassword mobileNumber:(NSString *)mobileNumber {
    
    if (!firstName || !lastName || !password || !confirmPassword || !email || !mobileNumber || [firstName isEqualToString:@""] || [lastName isEqualToString:@""] || [password isEqualToString:@""] || [confirmPassword isEqualToString:@""] || [email isEqualToString:@""] || [mobileNumber isEqualToString:@""]) {
        return @"Please fill the required fields";
    }
    
    if (firstName.length <= 3 || ![self containsOnlyCharacters:firstName]) {
        return @"Enter a valid first name";
    }
    
    if (lastName.length <= 3 || ![self containsOnlyCharacters:lastName]) {
        return @"Enter a valid last name";
    }
    
    if (email && ![self validateEmail:email]) {
        return @"Enter a valid email id";
    }
    
    if (password.length < 8 || ![self containsOnlyAllowedCharacters:password] || ![self containsOneNumberAndOneSpecialChar:password]) {
        return @"Enter a valid password";
    }
    
    if (![password isEqualToString:confirmPassword]) {
        return @"Password does not match Confirm Password";
    }
    
    if (mobileNumber && (mobileNumber.length != 10 || ![self containsOnlyNumbers:mobileNumber])) {
        return @"Enter a valid mobile number";
    }
    
    return nil;
}

- (NSString *)loginValidationWithEmail:(NSString *)email password:(NSString *)password {
    
    if (!email || !password || [email isEqualToString:@""] || [password isEqualToString:@""]) {
        return @"Please fill the required fields";
    }
    
    if (email && ![self validateEmail:email]) {
        return @"Enter a valid email id";
    }
    
    if (password.length < 2 || ![self containsOnlyAllowedCharacters:password] || ![self containsOneNumberAndOneSpecialChar:password]) {
        return @"Enter a valid password";
    }
    
    return nil;
}

- (NSString *)resetPassValidationWithOldPass:(NSString *)oldPass newPass:(NSString *)newPass confirmPass:(NSString *)confirmPass {
    
    if (!oldPass || !newPass || !confirmPass || [oldPass isEqualToString:@""] || [newPass isEqualToString:@""] || [confirmPass isEqualToString:@""]) {
        return @"Please fill the required fields";
    }
    
    if (newPass.length < 2 || ![self containsOnlyAllowedCharacters:newPass] || ![self containsOneNumberAndOneSpecialChar:newPass]) {
        return @"Enter a valid password";
    }
    
    if (![newPass isEqualToString:confirmPass]) {
        return @"Password does not match Confirm Password";
    }
    
    return nil;
}

- (NSString *)updateUserValidationWithFname:(NSString *)fname lname:(NSString *)lname email:(NSString *)email dob:(NSString *)dob profilePic:(NSString *)profilePic phone:(NSString *)phone {
    if ([fname isEqualToString:@""] || [lname isEqualToString:@""] || [email isEqualToString:@""] || [dob isEqualToString:@""] || [profilePic isEqualToString:@""] || [phone isEqualToString:@""]) {
        return @"Please fill the required fields";
    }
    
    if ([fname length] <= 3 || ![self containsOnlyCharacters:fname]) {
        return @"Enter a valid first name";
    }
    
    if ([lname length] <= 3 || ![self containsOnlyCharacters:lname]) {
        return @"Enter a valid last name";
    }
    
    if (![email isEqualToString:@""] && ![self validateEmail:email]) {
        return @"Enter a valid email id";
    }
    
    if (![phone isEqualToString:@""] && ([phone length] != 10 || ![self containsOnlyNumbers:phone])) {
        return @"Enter a valid mobile number";
    }
    return nil;
}


- (BOOL)containsOnlyCharacters:(NSString *)input {
    NSCharacterSet *characterSet = [NSCharacterSet letterCharacterSet];
    return [input rangeOfCharacterFromSet:[characterSet invertedSet]].location == NSNotFound;
}

- (BOOL)containsOnlyAllowedCharacters:(NSString *)input {
    NSCharacterSet *allowedCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*()_+"];
    NSCharacterSet *inputCharacterSet = [NSCharacterSet characterSetWithCharactersInString:input];
    return [allowedCharacterSet isSupersetOfSet:inputCharacterSet];
}

- (BOOL)containsOneNumberAndOneSpecialChar:(NSString *)input {
    NSPredicate *numberPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @".*\\d.*"];
    NSPredicate *specialCharPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @".*[^A-Za-z0-9].*"];
    
    BOOL containsNumber = [numberPredicate evaluateWithObject:input];
    BOOL containsSpecialChar = [specialCharPredicate evaluateWithObject:input];
    
    return containsNumber && containsSpecialChar;
}

- (BOOL)containsOnlyNumbers:(NSString *)input {
    NSCharacterSet *numericCharacterSet = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *inputCharacterSet = [NSCharacterSet characterSetWithCharactersInString:input];
    return [numericCharacterSet isSupersetOfSet:inputCharacterSet];
}

- (BOOL)validateEmail:(NSString *)input {
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    return [emailTest evaluateWithObject:input];
}

@end
