//
//  RatingCollectionViewCell.m
//  ObjcDemo Project
//
//  Created by Neosoft on 05/04/24.
//

#import "RatingCollectionViewCell.h"
//MARK: - RatingCollectionViewCell
@implementation RatingCollectionViewCell
//lifeCycle
- (void)awakeFromNib {
    [super awakeFromNib];
}

//Configure with cell
- (void) configureCellWithSelection: (BOOL) isSelected{
    if (isSelected){
        [self.btnRating setSelected:YES];
    } else {
        [self.btnRating setSelected:NO];
    }
}

@end
