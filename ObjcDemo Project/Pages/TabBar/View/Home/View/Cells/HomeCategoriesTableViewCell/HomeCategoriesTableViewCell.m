//
//  HomeCategoriesTableViewCell.m
//  ObjcDemo Project
//
//  Created by Neosoft on 03/04/24.
//

#import "HomeCategoriesTableViewCell.h"
#import "HomeProductListCollectionViewCell.h"

//MARK: - HomeCategoriesTableViewCell
@implementation HomeCategoriesTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setCollectionView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void) setCollectionView{
    self.homeProductListCollectionView.delegate = self;
    self.homeProductListCollectionView.dataSource = self;
    
    [self.homeProductListCollectionView registerNib:[UINib nibWithNibName:@"HomeProductListCollectionViewCell" bundle:nil] forCellWithReuseIdentifier: @"HomeProductListCollectionViewCell"];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeProductListCollectionViewCell *productListCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeProductListCollectionViewCell" forIndexPath:indexPath];
    return productListCell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

@end
