//
//  BaseVC.h
//  ObjcDemo Project
//
//  Created by Neosoft on 01/04/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseVC : UIViewController

-(void) setNavBar;
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message completion:(void (^)(void))completion;

@end

NS_ASSUME_NONNULL_END
