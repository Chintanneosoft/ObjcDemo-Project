//
//  BaseVC.m
//  ObjcDemo Project
//
//  Created by Neosoft on 01/04/24.
//

#import "BaseVC.h"
#import "ObjcDemo_Project-Swift.h"


@implementation BaseVC
NVActivityIndicatorView *activityIndicatorView;
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) setLoaderWithContainerView: (UIView*)containerView{
    activityIndicatorView = [[NVActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 60, 60) color:[UIColor whiteColor] padding:(CGFloat)10];
    activityIndicatorView.backgroundColor = [UIColor colorNamed:@"secondary"];
    activityIndicatorView.layer.cornerRadius = 10;
    [containerView addSubview:activityIndicatorView];
    activityIndicatorView.center = containerView.center;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    [self setNavBar];
}

- (void)showLoader {
    [activityIndicatorView startAnimating];
}

- (void)hideLoader{
    [activityIndicatorView stopAnimating];
}

- (void)setNavBar {
    self.navigationItem.backButtonTitle = @"";
    self.navigationController.navigationBar.tintColor = UIColor.whiteColor;
}

- (void)showAlertWithTitle: (NSString *)title message: (NSString *)message completion:(void (^)(void))completion {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * action) {
                                                         if (completion) {
                                                             completion();
                                                         }
                                                     }];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}
@end
