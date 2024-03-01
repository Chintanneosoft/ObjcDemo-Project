//
//  RegisterVC.h
//  ObjcDemo Project
//
//  Created by Neosoft on 01/03/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RegisterVC : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *registerTableView;

@end

NS_ASSUME_NONNULL_END
