//
//  LoginViewModel.h
//  ObjcDemo Project
//
//  Created by Neosoft on 01/03/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//MARK: - LoginViewModelDelegate
@protocol LoginViewModelDelegate <NSObject>
- (void) validationResultWithMessage: (NSString *)resultMsg;
@end

//MARK: - LoginViewModel
@interface LoginViewModel : NSObject

@property (weak,nonatomic) id<LoginViewModelDelegate> loginViewModelDelegate;

- (void)validateLoginCredentailsWithEmail: (NSString *)email password:(NSString *)password;

@end



NS_ASSUME_NONNULL_END
