//
//  HomeProductListCollectionViewCell.m
//  ObjcDemo Project
//
//  Created by Neosoft on 03/04/24.
//

#import "HomeProductListCollectionViewCell.h"
#import "SDWebImage.h"
//MARK: - HomeProductListCollectionViewCell
@implementation HomeProductListCollectionViewCell
//Lifecycle
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void) configureCellWithProductData: (ProductsData*) productData{
    self.lblProductName.text = productData.name;
    self.lblProductPrice.text = [NSString stringWithFormat:@"Rs: %@", [productData.cost stringValue]];
    NSURL *imageUrl = [NSURL URLWithString: productData.productImages];
    [self.productImg sd_setImageWithURL: imageUrl
                 placeholderImage:[UIImage imageNamed:@"Neosoft logo"]];
}

@end
