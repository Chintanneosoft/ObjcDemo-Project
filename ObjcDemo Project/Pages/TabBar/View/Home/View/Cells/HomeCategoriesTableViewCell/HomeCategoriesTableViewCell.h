//
//  HomeCategoriesTableViewCell.h
//  ObjcDemo Project
//
//  Created by Neosoft on 03/04/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeCategoriesTableViewCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *homeProductListCollectionView;

- (void) setCollectionView;
@end

NS_ASSUME_NONNULL_END
