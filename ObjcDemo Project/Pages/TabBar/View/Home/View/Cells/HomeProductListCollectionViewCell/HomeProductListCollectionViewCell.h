//
//  HomeProductListCollectionViewCell.h
//  ObjcDemo Project
//
//  Created by Neosoft on 03/04/24.
//

#import <UIKit/UIKit.h>
#import "Products.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeProductListCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *productImg;
@property (weak, nonatomic) IBOutlet UILabel *lblProductPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblProductName;

- (void) configureCellWithProductData: (ProductsData*) productData;
@end

NS_ASSUME_NONNULL_END
