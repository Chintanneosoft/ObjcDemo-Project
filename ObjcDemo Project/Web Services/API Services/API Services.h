//
//  API Services.h
//  ObjcDemo Project
//
//  Created by Neosoft on 04/03/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface APIServices : NSObject

typedef NS_ENUM(NSInteger, APIService) {
    APIServiceUserRegister,
    APIServiceUserLogin,
    APIServiceUpdatePass,
    APIServiceForgotPass,
    APIServiceFetchUser,
    APIServiceUpdateUser,
    APIServiceFetchProductsList,
    APIServiceFetchProductsDetails,
    APIServiceSetRatings,
    APIServiceAddToCart,
    APIServiceGetCart,
    APIServiceUpdateCart,
    APIServiceDeleteCart,
    APIServicePlaceOrder,
    APIServiceGetOrderList,
    APIServiceGetOrderDetail
};

@property (nonatomic, assign) APIService service;
@property (nonatomic, strong) NSDictionary *param;

- (instancetype)initWithService:(APIService)service param:(NSDictionary *)param;
- (NSString *)path;
- (NSString *)httpMethod;
- (NSDictionary *)header;

//- (NSString *)contentValue;
//- (NSString *)contentKey;

@end

NS_ASSUME_NONNULL_END
