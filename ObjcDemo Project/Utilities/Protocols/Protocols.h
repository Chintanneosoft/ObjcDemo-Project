//
//  Protocols.h
//  ObjcDemo Project
//
//  Created by Neosoft on 03/04/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ResultMessageDelegate <NSObject>
- (void) resultWithMessage: (NSString *)resultMsg;
@end


NS_ASSUME_NONNULL_END
