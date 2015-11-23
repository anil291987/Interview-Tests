//
//  CategoryCollectionViewCell.m
//  PhotoGallery
//
//  Created by datta on 23/11/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#import "CategoryCollectionViewCell.h"

@implementation CategoryCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    _imgCategory.layer.cornerRadius = 15.0;
    _imgCategory.backgroundColor = [UIColor grayColor];
    _imgCategory.layer.masksToBounds = YES;
}

@end
