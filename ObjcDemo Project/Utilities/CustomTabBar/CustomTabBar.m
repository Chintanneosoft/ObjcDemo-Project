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
    sizeThatFits.height = 100;
    return sizeThatFits;
}

@end
