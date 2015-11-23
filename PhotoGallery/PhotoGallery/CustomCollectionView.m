//
//  CustomCollectionView.m
//  PhotoGallery
//
//  Created by datta on 23/11/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#import "CustomCollectionView.h"
#import "CategoryCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "CategoryData.h"
#import "WebClient.h"

@interface CustomCollectionView()<UICollectionViewDataSource,UICollectionViewDelegate>{
    
}
@property(nonatomic,weak)IBOutlet UICollectionView *categoryCollectionView;
@property(nonatomic,strong)NSArray *collectionData;
@end
static NSString *cellIdentifier =  @"CategoryCollectionViewCell";
@implementation CustomCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib{
    _categoryCollectionView.backgroundColor = [UIColor clearColor];
    UICollectionViewFlowLayout *categoryCollectionFlowLayout = [[UICollectionViewFlowLayout alloc]init];
    [categoryCollectionFlowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [categoryCollectionFlowLayout setItemSize:CGSizeMake(150, 150)];
    [_categoryCollectionView setCollectionViewLayout:categoryCollectionFlowLayout];
    [_categoryCollectionView registerNib:[UINib nibWithNibName:@"CategoryCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CategoryCollectionViewCell"];
}
-(void)setCollectionData:(NSArray *)collectionData {
    _collectionData = collectionData;
    [_categoryCollectionView setContentOffset:CGPointZero animated:NO];
//    [_categoryCollectionView registerNib:[UINib nibWithNibName:@"CategoryCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CategoryCollectionViewCell"];

    [_categoryCollectionView reloadData];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.collectionData count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CategoryCollectionViewCell *categoryCollectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    CategoryData *category = [self.collectionData objectAtIndex:[indexPath row]];
    if (category.imageUrl) {
        [categoryCollectionCell.imgCategory  setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",BASEURL,category.imageUrl]]];
    }
    return categoryCollectionCell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CategoryData *selectedCat = [self.collectionData objectAtIndex:[indexPath row]];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"didSelectItemFromCollectionView" object:selectedCat];
}
@end
