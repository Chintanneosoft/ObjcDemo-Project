//
//  RatingCollectionViewCell.m
//  ObjcDemo Project
//
//  Created by Neosoft on 05/04/24.
//

#import "RatingCollectionViewCell.h"

@implementation RatingCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void) configureCellWithSelection: (BOOL) isSelected{
    if (isSelected){
        [self.btnRating setSelected:YES];
    } else {
        [self.btnRating setSelected:NO];
    }
}

@end
