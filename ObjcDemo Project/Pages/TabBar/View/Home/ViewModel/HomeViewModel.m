//
//  HomeViewModel.m
//  ObjcDemo Project
//
//  Created by Neosoft on 03/04/24.
//

#import "HomeViewModel.h"
#import "HomeService.h"

@implementation HomeViewModel

Products *productList;

- (void) getProductListForCategoryId: (NSNumber*) categoryId{
    [HomeService fetchProductsListWithProductCategoryId:categoryId completion:^(Products* products, NSError* error) {
            if (products) {
                [self updatingDictionaryWithCategory:(NSInteger)categoryId products:products];
            
                [self.resultMessageDelegate resultWithMessage:@"Products Fetched SuccessFully"];
            } else if (error) {
                NSLog(@"%@", error.localizedDescription);
                [self.resultMessageDelegate resultWithMessage:error.localizedDescription];
            }
    }];
}

- (void) updatingDictionaryWithCategory: (NSInteger) categoryId products: (Products *) productList{
    NSMutableDictionary *categoryDict = [[NSMutableDictionary alloc] init];
    switch (categoryId) {
        case 0:
            [categoryDict setValue:@"0" forKey:@"CategoryId"];
            [categoryDict setObject:@"Table" forKey:@"CategoryName"];
            [categoryDict setObject:productList forKey:@"CategoryProducts"];
            break;
        case 1:
            [categoryDict setValue:@"1" forKey:@"CategoryId"];
            [categoryDict setObject:@"Sofa" forKey:@"CategoryName"];
            [categoryDict setObject:productList forKey:@"CategoryProducts"];
            break;
        case 2:
            [categoryDict setValue:@"2" forKey:@"CategoryId"];
            [categoryDict setObject:@"Chair" forKey:@"CategoryName"];
            [categoryDict setObject:productList forKey:@"CategoryProducts"];
            break;
        case 3:
            [categoryDict setValue:@"3" forKey:@"CategoryId"];
            [categoryDict setObject:@"Cupboard" forKey:@"CategoryName"];
            [categoryDict setObject:productList forKey:@"CategoryProducts"];
            break;
        default:
            break;
    }
    self.categoryProductList = [[NSMutableArray alloc] init];
    [self.categoryProductList addObject:categoryDict];
}

@end
