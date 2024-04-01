//
//  SubmitButtonTableViewCell.h
//  ObjcDemo Project
//
//  Created by Neosoft on 20/03/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SubmitButtonTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *tableViewBtn;
@property (nonatomic, copy) void (^submitButtonTapHandler)(SubmitButtonTableViewCell *cell);
- (IBAction)submitBtnTapped:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
