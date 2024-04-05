//
//  RegisterVC.h
//  ObjcDemo Project
//
//  Created by Neosoft on 01/03/24.
//

#import <UIKit/UIKit.h>
#import "TextFieldTableViewCellDelegate.h"
#import "RegisterViewModel.h"
#import "BaseVC.h"

NS_ASSUME_NONNULL_BEGIN
//MARK: - RegisterVC
@interface RegisterVC : BaseVC<UITableViewDelegate,UITableViewDataSource,TextFieldTableViewCellDelegate,ResultMessageDelegate>

@property (weak, nonatomic) IBOutlet UITableView *registerTableView;

@property (strong, nonatomic) RegisterViewModel *VM;
- (void)sendForValidation;
- (void)setTableView ;
@end

NS_ASSUME_NONNULL_END
