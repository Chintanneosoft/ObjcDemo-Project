//
//  LoginViewModel.h
//  ObjcDemo Project
//
//  Created by Neosoft on 01/03/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject

- (void)validateLoginCredentailsWithEmail: (NSString *)email password:(NSString *)password;

@end

NS_ASSUME_NONNULL_END
