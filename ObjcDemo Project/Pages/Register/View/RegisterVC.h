//
//  RegisterVC.h
//  ObjcDemo Project
//
//  Created by Neosoft on 01/03/24.
//

#import <UIKit/UIKit.h>
#import "TextFieldTableViewCellDelegate.h"
#import "RegisterViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RegisterVC : UIViewController<UITableViewDelegate,UITableViewDataSource,TextFieldTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *registerTableView;

@property (strong, nonatomic) RegisterViewModel *VM;
- (void)sendForValidation;
@end

NS_ASSUME_NONNULL_END
