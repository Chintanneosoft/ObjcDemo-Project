//
//  API Manager.m
//  ObjcDemo Project
//
//  Created by Neosoft on 04/03/24.
//

#import <Foundation/Foundation.h>
#import "API Manager.h"
#import "API Services.h"

@implementation APIManager

+ (instancetype)sharedInstance {
    static APIManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)callRequestWithAPICallType:(APIServices *)apiCallType completion:(void (^)(NSData *data, NSError *error))completion {
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:apiCallType.path]];
    
    request.HTTPMethod = apiCallType.httpMethod;
    
    if (apiCallType.param) {
        
        if ([apiCallType.httpMethod isEqualToString:@"POST"]) {
            NSURLComponents *requestBodyComponents = [[NSURLComponents alloc] init];
            NSMutableArray<NSURLQueryItem *> *queryItems = [NSMutableArray array];
            for (NSString *key in apiCallType.param) {
                [queryItems addObject:[NSURLQueryItem queryItemWithName:key value:[apiCallType.param[key] description]]];
            }
            requestBodyComponents.queryItems = queryItems;
            request.HTTPBody = [requestBodyComponents.query dataUsingEncoding:NSUTF8StringEncoding];
        }
        else {
            NSURLComponents *urlComponents = [NSURLComponents componentsWithString:apiCallType.path];
            NSMutableArray<NSURLQueryItem *> *queryItems = [NSMutableArray array];
            for (NSString *key in apiCallType.param) {
                [queryItems addObject:[NSURLQueryItem queryItemWithName:key value:[apiCallType.param[key] description]]];
            }
            urlComponents.queryItems = queryItems;
            request.URL = urlComponents.URL;
        }
    }
    
    request.allHTTPHeaderFields = apiCallType.header;
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completion(nil, error);
            return;
        }
        if (!data) {
            completion(nil, error);
            return;
        }
        
        if (![NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil]) {
            NSLog(@"Not containing JSON");
            NSLog(@"Response Content: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            return;
        }
        completion(data, nil);
    }];
    [task resume];
}

@end
