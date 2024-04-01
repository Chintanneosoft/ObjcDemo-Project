//
//  TextFieldTableViewCell.m
//  ObjcDemo Project
//
//  Created by Neosoft on 01/03/24.
//

#import "TextFieldTableViewCell.h"

@implementation TextFieldTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.imgTextfieldCell setTintColor:[UIColor whiteColor]];
    self.txtTextFieldCell.delegate = self;
    self.imgTextfieldCell.layer.cornerRadius = self.imgTextfieldCell.frame.size.width/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void) configureCellwithPlaceholder: (NSString *)placeHolder image: (UIImage *)image{
    self.txtTextFieldCell.placeholder = placeHolder;
    self.imgTextfieldCell.image = image;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.delegate tableViewCellDidSubmitTextFieldValues:textField.text textFieldtag:textField.tag];
    return false;
}

@end
