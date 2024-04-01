//
//  User.h
//  ObjcDemo Project
//
//  Created by Neosoft on 04/03/24.
//

#ifndef User_h
#define User_h


#endif /* User_h */

// UserData.h
@interface UserData : NSObject
@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSNumber *role_id;
@property (nonatomic, strong) NSString *first_name;
@property (nonatomic, strong) NSString *last_name;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *phone_no;
@property (nonatomic, assign) BOOL is_active;
@property (nonatomic, strong) NSString *created;
@property (nonatomic, strong) NSString *modified;
@property (nonatomic, strong) NSString *access_token;
@property (nonatomic, strong) NSString *country_id;
@property (nonatomic, strong) NSString *dob;
@property (nonatomic, strong) NSString *profile_pic;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end

// User.h
@interface User : NSObject
@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, strong) UserData *data;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *user_msg;

- (instancetype)initWithData:(NSData *)data error:(NSError **)error;

@end

// UserFailure.h
@interface UserFailure : NSObject
@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, assign) BOOL data;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *user_msg;

- (instancetype)initWithData:(NSData *)data error:(NSError **)error;
@end
