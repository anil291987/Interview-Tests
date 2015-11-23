//
//  Categories.m
//  PhotoGallery
//
//  Created by datta on 23/11/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#import "Categories.h"
#import "CategoryData.h"
@implementation Categories

-(NSArray *)getCategoryByCategoryFlag:(NSString *)categoryFlag{
    NSPredicate *categoeyFlagPredicate = [NSPredicate predicateWithFormat:@"self.categoryFlag == %@",categoryFlag];
    return [_categories filteredArrayUsingPredicate:categoeyFlagPredicate];
}
-(void)setCategories:(NSDictionary *)categories{
    if (!_categories) {
        _categories = [[NSMutableArray alloc]init];
    }
    for (NSString *categoryName in categories.allKeys) {
        for (NSDictionary *categoryData in [categories valueForKey:categoryName]) {
            CategoryData *objcategory = [[CategoryData alloc]init];
            objcategory.name = [categoryData valueForKey:@"name"];
            objcategory.imageUrl = [categoryData valueForKey:@"imgURL"];
            objcategory.categoryFlag = categoryName;
            [_categories addObject:objcategory];
        }
    }
    NSLog(@"%@",_categories);
}
@end
