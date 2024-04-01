//
//  OTPVerificationVC.h
//  ObjcDemo Project
//
//  Created by Neosoft on 26/03/24.
//

#import <UIKit/UIKit.h>
#import "BaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface OTPVerificationVC : BaseVC<UITextFieldDelegate>
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *txtOTPCollection;

@end

NS_ASSUME_NONNULL_END
