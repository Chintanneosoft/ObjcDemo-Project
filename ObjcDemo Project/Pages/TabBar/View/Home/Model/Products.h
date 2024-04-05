//
//  Product.h
//  ObjcDemo Project
//
//  Created by Neosoft on 03/04/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//MARK: - ProductsData
@interface ProductsData : NSObject

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSNumber *productCategoryID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *producer;
@property (nonatomic, strong) NSString *datumDescription;
@property (nonatomic, strong) NSNumber *rating;
@property (nonatomic, strong) NSNumber *viewCount;
@property (nonatomic, strong) NSString *created;
@property (nonatomic, strong) NSString *modified;
@property (nonatomic, strong) NSString *productImages;
@property (nonatomic, strong) NSNumber *cost;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end

//MARK: - Products
@interface Products : NSObject

@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, strong) NSArray<ProductsData *> *data;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *userMsg;

- (instancetype)initWithData:(NSData *)data error:(NSError **)error;
@end




NS_ASSUME_NONNULL_END
