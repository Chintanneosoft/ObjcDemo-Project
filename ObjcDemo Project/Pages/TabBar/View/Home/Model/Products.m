//
//  Product.m
//  ObjcDemo Project
//
//  Created by Neosoft on 03/04/24.
//

#import "Products.h"
//MARK: - Products
@implementation Products
- (instancetype)initWithData:(NSData *)data error:(NSError **)error {
    self = [super init];
    if (self) {
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            *error = jsonError;
            return nil;
        }

        // Initialize the User object with values from the JSON object.
        _status = json[@"status"];
        _message = json[@"message"];
        _userMsg = json[@"user_msg"];

        // For the 'data' property, we need to create a UserData object.
        NSArray *userDataArray = json[@"data"];
        NSMutableArray *dataArray = [[NSMutableArray alloc] init];

        if (userDataArray) {
            for (NSDictionary *userDataDict in userDataArray) {
                ProductsData *productData = [[ProductsData alloc] initWithDictionary:userDataDict];
                [dataArray addObject:productData];
            }
        }

        _data = [dataArray copy];
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
