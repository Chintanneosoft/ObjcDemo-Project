//
//  User.m
//  ObjcDemo Project
//
//  Created by Neosoft on 04/03/24.
//

#import <Foundation/Foundation.h>
#import "User.h"

@implementation User

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
        _user_msg = json[@"user_msg"];

        // For the 'data' property, we need to create a UserData object.
        NSDictionary *userDataDict = json[@"data"];
        if (userDataDict) {
            _data = [[UserData alloc] initWithDictionary:userDataDict];
        }
    }
    return self;
}

@end

// UserData.m
@implementation UserData

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _id = dict[@"id"];
        _role_id = dict[@"role_id"];
        _first_name = dict[@"first_name"];
        _last_name = dict[@"last_name"];
        _email = dict[@"email"];
        _username = dict[@"username"];
        _gender = dict[@"gender"];
        _phone_no = dict[@"phone_no"];
        _is_active = [dict[@"is_active"] boolValue];
        _created = dict[@"created"];
        _modified = dict[@"modified"];
        _access_token = dict[@"access_token"];
        _country_id = dict[@"country_id"];
        _dob = dict[@"dob"];
        _profile_pic = dict[@"profile_pic"];
    }
    return self;
}

@end


@implementation UserFailure

- (instancetype)initWithData:(NSData *)data error:(NSError **)error {
    self = [super init];
    if (self) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:error];
        if (json && *error == nil) {
            _status = json[@"status"];
            _message = json[@"message"];
            _user_msg = json[@"user_msg"];
            
            id dataObject = json[@"data"];
            if ([dataObject isKindOfClass:[NSNumber class]]) {
                _data = [dataObject boolValue];
            } else {
                // Handle the case where dataObject is not a number
                // You might want to set _data to NO, or set an error
            }
        }
    }
    return self;
}


@end
