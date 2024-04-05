//
//  ProductDetails.m
//  ObjcDemo Project
//
//  Created by Neosoft on 05/04/24.
//

#import "ProductDetails.h"

// ProductDetails
@implementation ProductDetails
- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _status = dict[@"status"];
        _data = [[ProductDetailsData alloc] initWithDictionary:dict[@"data"]];
        _message = dict[@"message"];
        _userMsg = dict[@"user_msg"];
    }
    return self;
}
@end

// ProductDetail
@implementation ProductDetailsData
- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _id = dict[@"id"];
        _productCategoryID = dict[@"product_category_id"];
        _name = dict[@"name"];
        _producer = dict[@"producer"];
        _dataDescription = dict[@"description"];
        _cost = dict[@"cost"];
        _rating = dict[@"rating"];
        _viewCount = dict[@"view_count"];
        _created = dict[@"created"];
        _modified = dict[@"modified"];
        
        NSMutableArray<ProductImage *> *images = [NSMutableArray array];
        for (NSDictionary *imageDict in dict[@"product_images"]) {
            ProductImage *image = [[ProductImage alloc] initWithDictionary:imageDict];
            [images addObject:image];
        }
        _productImages = [images copy];
    }
    return self;
}
@end

// ProductImage
@implementation ProductImage
- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _id = dict[@"id"];
        _productID = dict[@"product_id"];
        _image = dict[@"image"];
        _created = dict[@"created"];
        _modified = dict[@"modified"];
    }
    return self;
}
@end

