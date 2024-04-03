//
//  HomeViewModel.h
//  ObjcDemo Project
//
//  Created by Neosoft on 03/04/24.
//

#import <Foundation/Foundation.h>
#import "Products.h"
#import "Protocols.h"

NS_ASSUME_NONNULL_BEGIN

//MARK: - HomeViewModel
@interface HomeViewModel : NSObject

@property (strong,nonatomic) NSMutableDictionary *categoryDict;
@property (weak,nonatomic) id<ResultMessageDelegate> resultMessageDelegate;
@property (strong, nonatomic) NSMutableArray *categoryProductList;

- (void) getProductListForCategoryId: (NSNumber*) categoryId;
- (void) updatingDictionaryWithCategory: (NSInteger) categoryId products: (Products *) productList;

@end

NS_ASSUME_NONNULL_END
