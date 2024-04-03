//
//  CustomTabBar.m
//  ObjcDemo Project
//
//  Created by Neosoft on 01/04/24.
//

#import "CustomTabBar.h"

@implementation CustomTabBar

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize sizeThatFits = [super sizeThatFits:size];
    if (!isiPhoneSE()){
        sizeThatFits.height = 85;
    }
    return sizeThatFits;
}

@end
