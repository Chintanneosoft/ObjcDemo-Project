//
//  Product.m
//  ObjcDemo Project
//
//  Created by Neosoft on 03/04/24.
//

#import "Products.h"
//MARK: - Products
@implementation Products
- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _status = dict[@"status"];
        _data = dict[@"data"]; // You need to convert each dictionary in this array to a ProductsData object
        _message = dict[@"message"];
        _userMsg = dict[@"user_msg"];
    }
    return self;
}
@end

//MARK: - ProductsData
@implementation ProductsData
- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _id = dict[@"id"];
        _productCategoryID = dict[@"product_category_id"];
        _name = dict[@"name"];
        _producer = dict[@"producer"];
        _datumDescription = dict[@"description"];
        _rating = dict[@"rating"];
        _viewCount = dict[@"view_count"];
        _created = dict[@"created"];
        _modified = dict[@"modified"];
        _productImages = dict[@"product_images"];
        _cost = dict[@"cost"];
    }
    return self;
}
@end
