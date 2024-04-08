//
//  HomeProductListCollectionViewCell.m
//  ObjcDemo Project
//
//  Created by Neosoft on 03/04/24.
//

#import "HomeProductListCollectionViewCell.h"
#import "SDWebImage.h"
#import "RatingCollectionViewCell.h"

//MARK: - HomeProductListCollectionViewCell
@implementation HomeProductListCollectionViewCell

int productRating;

//Lifecycle
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setCollectionView];
}

- (void) setCollectionView{
    self.ratingCollectionView.delegate = self;
    self.ratingCollectionView.dataSource = self;
    
    [self.ratingCollectionView registerNib:[UINib nibWithNibName:@"RatingCollectionViewCell" bundle:nil] forCellWithReuseIdentifier: @"RatingCollectionViewCell"];
}

// Configure
- (void) configureCellWithProductData: (ProductsData*) productData{
    self.lblProductName.text = productData.name;
    self.lblProductPrice.text = [NSString stringWithFormat:@"Rs: %@", [productData.cost stringValue]];
    NSURL *imageUrl = [NSURL URLWithString: productData.productImages];
    [self.productImg sd_setImageWithURL: imageUrl
                 placeholderImage:[UIImage imageNamed:@"Neosoft logo"]];
    productRating = [productData.rating intValue];
    [self.ratingCollectionView reloadData];
}

//MARK: - Collection View
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RatingCollectionViewCell *ratingCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RatingCollectionViewCell" forIndexPath:indexPath];
    [ratingCell configureCellWithSelection:(indexPath.row < productRating)];
    return ratingCell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(collectionView.frame.size.width/5, collectionView.frame.size.width/5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

@end
