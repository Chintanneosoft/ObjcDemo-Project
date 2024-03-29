//
//  API Service.m
//  ObjcDemo Project
//
//  Created by Neosoft on 04/03/24.
//

#import <Foundation/Foundation.h>
#import "NetworkConfiguration.h"
#import "API Services.h"

@implementation APIServices

NSString *contentValue = @"application/x-www-form-urlencoded";
NSString *contentKey = @"Content-Type";

- (instancetype)initWithService:(APIService)service param:(NSDictionary *)param {
    self = [super init];
    if (self) {
        _service = service;
        _param = param;
    }
    return self;
}

- (NSString *)path {
    NSString *apiDomain = @"/api/";
    NSString *urlPath = @"";
    switch (self.service) {
        case APIServiceUserRegister:
            urlPath = @"users/register";
            break;
        case APIServiceUserLogin:
            urlPath = @"users/login";
        default:
            break;
    }
    return [NSString stringWithFormat:@"%@%@%@", NetworkConfiguration.baseURL, apiDomain, urlPath];
}

- (NSString *)httpMethod {
    switch (self.service) {
        case APIServiceUserLogin:
        case APIServiceUserRegister:
        case APIServiceUpdateUser:
        case APIServiceSetRatings:
        case APIServiceAddToCart:
        case APIServiceUpdateCart:
        case APIServiceDeleteCart:
        case APIServicePlaceOrder:
        case APIServiceUpdatePass:
        case APIServiceForgotPass:
            return @"POST";
        default:
            return @"GET";
    }
}

- (NSDictionary *)header {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:contentValue forKey:contentKey];
    NSString *accessToken = [[NSUserDefaults standardUserDefaults] stringForKey:@"accessToken"];
    if (accessToken) {
        [dict setObject:accessToken forKey:@"access_token"];
    }
    return dict.copy;
}

@end
