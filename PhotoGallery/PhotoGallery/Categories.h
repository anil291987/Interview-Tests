//
//  Categories.h
//  PhotoGallery
//
//  Created by datta on 23/11/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Categories : NSObject
@property(nonatomic,strong)NSMutableArray *categories;
-(NSArray *)getCategoryByCategoryFlag:(NSString *)categoryFlag;
@end
