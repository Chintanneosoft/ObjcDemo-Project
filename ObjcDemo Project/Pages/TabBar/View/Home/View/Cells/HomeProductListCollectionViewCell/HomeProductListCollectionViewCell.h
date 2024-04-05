//
//  HomeProductListCollectionViewCell.h
//  ObjcDemo Project
//
//  Created by Neosoft on 03/04/24.
//

#import <UIKit/UIKit.h>
#import "Products.h"

NS_ASSUME_NONNULL_BEGIN
//MARK: - HomeProductListCollectionViewCell
@interface HomeProductListCollectionViewCell : UICollectionViewCell<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
//IBoutlets
@property (weak, nonatomic) IBOutlet UIImageView *productImg;
@property (weak, nonatomic) IBOutlet UILabel *lblProductPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblProductName;
@property (weak, nonatomic) IBOutlet UICollectionView *ratingCollectionView;

- (void) configureCellWithProductData: (ProductsData*) productData;
- (void) setCollectionView;
@end

NS_ASSUME_NONNULL_END
