//
//  RegisterHeaderView.h
//  ObjcDemo Project
//
//  Created by Neosoft on 06/03/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RegisterHeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *lblRegister;

- (void) setLabelText:(NSString *)lblText;
@end

NS_ASSUME_NONNULL_END
