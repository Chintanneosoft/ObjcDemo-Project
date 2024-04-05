//
//  RegisterViewModel.h
//  ObjcDemo Project
//
//  Created by Neosoft on 21/03/24.
//

#import <Foundation/Foundation.h>
#import "Validation.h"
#import "RegisterService.h"
#import "Protocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface RegisterViewModel : NSObject
@property (nonatomic,strong) NSMutableDictionary *registerInputData;
@property (weak,nonatomic) id<ResultMessageDelegate> resultMessageDelegate;
- (void)callValidations;
@end

NS_ASSUME_NONNULL_END
