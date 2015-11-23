//
//  CategoryTableViewCell.m
//  PhotoGallery
//
//  Created by datta on 23/11/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#import "CategoryTableViewCell.h"

@implementation CategoryTableViewCell

- (void)awakeFromNib {
    // Initialization code
    if (![self.contentView viewWithTag:788]) {
        _objCollectionView = [[NSBundle mainBundle] loadNibNamed:@"CustomCollectionView" owner:self options:nil][0];
        _objCollectionView.frame = CGRectMake(00, 00, [[UIScreen mainScreen]bounds].size.width, 100);
        _objCollectionView.tag = 788;
        _objCollectionView.backgroundColor = [UIColor darkGrayColor];
        [self.contentView addSubview:_objCollectionView];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setCollectionData:(NSArray *)collectionData {
    [_objCollectionView setCollectionData:collectionData];
}
@end
