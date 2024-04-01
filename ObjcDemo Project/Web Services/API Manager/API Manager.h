//
//  API Manager.h
//  ObjcDemo Project
//
//  Created by Neosoft on 04/03/24.
//

#import <Foundation/Foundation.h>
#import "API Services.h"

NS_ASSUME_NONNULL_BEGIN

//MARK: - APIManager
@interface APIManager : NSObject

// Shared Instance
+ (instancetype)sharedInstance;

// Common Request Function
- (void)callRequestWithAPICallType:(APIServices *)apiCallType completion:(void (^)(NSData *data, NSError *error))completion;

//- (void)callRequestWithAPICallType:(APIServices *)apiCallType params:(NSDictionary *)params completion:(void (^)(NSData *data, NSError *error))completion;


@end
NS_ASSUME_NONNULL_END
