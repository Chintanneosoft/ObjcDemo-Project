//
//  HomeService.h
//  ObjcDemo Project
//
//  Created by Neosoft on 03/04/24.
//

#import <Foundation/Foundation.h>
#import "Products.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeService : NSObject

+ (void)fetchProductsListWithProductCategoryId:(NSNumber *)productCategoryId completion:(void (^)(Products *products, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
