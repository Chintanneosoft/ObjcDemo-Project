//
//  SubmitButtonTableViewCell.m
//  ObjcDemo Project
//
//  Created by Neosoft on 20/03/24.
//

#import "SubmitButtonTableViewCell.h"

@implementation SubmitButtonTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)submitBtnTapped:(UIButton *)sender {
    if (self.submitButtonTapHandler) {
        self.submitButtonTapHandler(self);
    }
}
@end
