//
//  BaseVC.m
//  ObjcDemo Project
//
//  Created by Neosoft on 01/04/24.
//

#import "BaseVC.h"

@interface BaseVC ()

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavBar];
}

- (void)setNavBar {
    self.navigationItem.backButtonTitle = @"";
    self.navigationController.navigationBar.tintColor = UIColor.whiteColor;
    self.navigationController.navigationBar.backgroundColor = [UIColor colorNamed:@"secondary"];
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
