//
//  TextFieldTableViewCellDelegate.h
//  ObjcDemo Project
//
//  Created by Neosoft on 20/03/24.
//

#ifndef TextFieldTableViewCellDelegate_h
#define TextFieldTableViewCellDelegate_h

@protocol TextFieldTableViewCellDelegate <NSObject>
- (void)tableViewCellDidSubmitTextFieldValues:(NSString *)textFieldValue;
@end

#endif /* TextFieldTableViewCellDelegate_h */
