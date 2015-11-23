//
//  CategoryTableViewCell.h
//  PhotoGallery
//
//  Created by datta on 23/11/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCollectionView.h"

@interface CategoryTableViewCell : UITableViewCell
@property(nonatomic,strong)CustomCollectionView *objCollectionView;
-(void)setCollectionData:(NSArray *)collectionData;

@end
