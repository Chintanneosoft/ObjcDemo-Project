//
//  RatingCollectionViewCell.h
//  ObjcDemo Project
//
//  Created by Neosoft on 05/04/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RatingCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *btnRating;

- (void) configureCellWithSelection: (BOOL) isSelected;
@end

NS_ASSUME_NONNULL_END
