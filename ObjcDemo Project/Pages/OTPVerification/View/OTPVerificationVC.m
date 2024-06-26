//
//  OTPVerificationVC.m
//  ObjcDemo Project
//
//  Created by Neosoft on 26/03/24.
//

#import "OTPVerificationVC.h"

@implementation OTPVerificationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTextFields];
}

- (void)setTextFields {
    for (UITextField *txt in self.txtOTPCollection) {
        txt.delegate = self;
        txt.textAlignment = NSTextAlignmentCenter;
        txt.textColor = [UIColor whiteColor];
        txt.keyboardType = UIKeyboardTypeNumberPad;
        txt.tintColor = UIColor.clearColor;
    }
}
- (IBAction)btnVerifyOTPTapped:(id)sender {
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    textField.text = string;
    if (range.length == 0) {
        NSUInteger currentIndex = [self.txtOTPCollection indexOfObject:textField];
        if (currentIndex < self.txtOTPCollection.count - 1) {
           
            UITextField *nextTextField = self.txtOTPCollection[currentIndex + 1];
            [nextTextField becomeFirstResponder];
        } else {
            [textField resignFirstResponder];
        }
    } else {
        NSUInteger currentIndex = [self.txtOTPCollection indexOfObject:textField];
         if (currentIndex != 0) {
                UITextField *prevTextField = self.txtOTPCollection[currentIndex - 1];
                if (prevTextField.text.length == 1) {
                    [textField resignFirstResponder];
                    [prevTextField becomeFirstResponder];
                }

            }
    }
    return NO;
}


@end
