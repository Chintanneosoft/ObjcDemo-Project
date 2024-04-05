//
//  HomeService.m
//  ObjcDemo Project
//
//  Created by Neosoft on 03/04/24.
//

#import "HomeService.h"
#import "API Services.h"
#import "API Manager.h"

@implementation HomeService

+ (void)fetchProductsListWithProductCategoryId:(NSNumber *)productCategoryId completion:(void (^)(Products *products, NSError *error))completion {
    NSDictionary *params = @{@"product_category_id": productCategoryId};
    
    APIServices *apiService = [[APIServices alloc] initWithService:APIServiceFetchProductsList param:params];
    
    [[APIManager sharedInstance] callRequestWithAPICallType:apiService completion:^(id response, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            NSError *jsonError;
            Products *products = [[Products alloc] initWithData:response error:nil] ;
            if (jsonError) {
                completion(nil, jsonError);
            } else {
                completion(products, nil);
            }
        }
    }];
}


@end
