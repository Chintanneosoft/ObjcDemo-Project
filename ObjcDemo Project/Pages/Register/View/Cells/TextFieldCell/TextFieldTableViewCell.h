//
//  TextFieldTableViewCell.h
//  ObjcDemo Project
//
//  Created by Neosoft on 01/03/24.
//

#import <UIKit/UIKit.h>
#import "TextFieldTableViewCellDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface TextFieldTableViewCell : UITableViewCell<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtTextFieldCell;
@property (weak, nonatomic) IBOutlet UIImageView *imgTextfieldCell;

- (void) configureCellwithPlaceholder: (NSString *)placeHolder image: (UIImage *)image;

- (BOOL)textFieldShouldReturn:(UITextField *)textField;

@property (nonatomic, weak) id<TextFieldTableViewCellDelegate> delegate;
@end


NS_ASSUME_NONNULL_END
