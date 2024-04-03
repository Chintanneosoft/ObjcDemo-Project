//
//  CommonFunctions.m
//  ObjcDemo Project
//
//  Created by Neosoft on 03/04/24.
//

#import "CommonFunctions.h"
//MARK: - CommonFunctions
@implementation CommonFunctions

BOOL isiPhoneSE (void) {
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    return screenSize.height < 700;
}


@end
