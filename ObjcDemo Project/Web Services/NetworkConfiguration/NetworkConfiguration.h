//
//  NetworkConfiguration.h
//  ObjcDemo Project
//
//  Created by Neosoft on 04/03/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkConfiguration : NSObject

typedef NS_ENUM(NSInteger, NetworkEnvironment) {
    NetworkEnvironmentDev,
    NetworkEnvironmentProd
};

@property (class, nonatomic, readonly) NSString *baseURL;
@property (class) NetworkEnvironment networkEnvironment;

@end

NS_ASSUME_NONNULL_END
