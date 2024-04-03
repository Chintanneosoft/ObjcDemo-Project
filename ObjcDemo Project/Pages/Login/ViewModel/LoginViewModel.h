//
//  LoginViewModel.h
//  ObjcDemo Project
//
//  Created by Neosoft on 01/03/24.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

NS_ASSUME_NONNULL_BEGIN

//MARK: - LoginViewModelDelegate


//MARK: - LoginViewModel
@interface LoginViewModel : NSObject

@property (weak,nonatomic) id<ResultMessageDelegate> resultMessageDelegate;

- (void)validateLoginCredentailsWithEmail: (NSString *)email password:(NSString *)password;

@end



NS_ASSUME_NONNULL_END
