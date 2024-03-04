//
//  NetworkConfiguration.m
//  ObjcDemo Project
//
//  Created by Neosoft on 04/03/24.
//

#import "NetworkConfiguration.h"

@implementation NetworkConfiguration

static NSString * const Dev_Root_Point = @"http://staging.php-dev.in:8844/trainingapp";
static NSString * const Prod_Root_Point = @"";

+ (NetworkEnvironment)networkEnvironment {
    return NetworkEnvironmentDev; // default value
}

+ (void)setNetworkEnvironment:(NetworkEnvironment)networkEnvironment {
    
}

+ (NSString *)baseURL {
    switch (self.networkEnvironment) {
        case NetworkEnvironmentDev:
            return Dev_Root_Point;
        case NetworkEnvironmentProd:
            return Prod_Root_Point;
    }
}

@end
