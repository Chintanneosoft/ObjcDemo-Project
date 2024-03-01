//
//  TextFieldTableViewCell.h
//  ObjcDemo Project
//
//  Created by Neosoft on 01/03/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TextFieldTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *txtTextFieldCell;
@property (weak, nonatomic) IBOutlet UIImageView *imgTextfieldCell;

@end

NS_ASSUME_NONNULL_END
