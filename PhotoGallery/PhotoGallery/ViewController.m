//
//  ViewController.m
//  PhotoGallery
//
//  Created by Sachin Patil on 24/08/15.
//  Copyright (c) 2015 Cuelogic Technologies. All rights reserved.
//

#import "ViewController.h"
#import "CategoryTableViewCell.h"
#import "Categories.h"
#import "CategoryData.h"
#import "WebClient.h"
#import "UIImageView+AFNetworking.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)Categories *categories;
@property(nonatomic,strong)NSArray *categoryNames;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tblCategories registerNib:[UINib nibWithNibName:@"CategoryTableViewCell" bundle:nil] forCellReuseIdentifier:@"CategoryTableViewCell"];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didSelectItemFromCollectionView:) name:@"didSelectItemFromCollectionView" object:nil];
    [self callDataFromServer];
}
-(void)didSelectItemFromCollectionView:(NSNotification *)noti{
    NSLog(@"%@",noti.object);
    CategoryData *objCategory = (CategoryData *)[noti object];
    [_imgPreview setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",BASEURL,objCategory.imageUrl]]];
}
-(void)callDataFromServer{
    WebClient *objClient = [[WebClient alloc]init];
    [objClient callWebServiceUrl:@"imageData.php" withCompletionBlock:^(id ResponseObject, NSError *error) {
        if (!error) {
            _categories = [[Categories alloc]init];
            [_categories setCategories:ResponseObject];
            _categoryNames = [ResponseObject allKeys];
            [_tblCategories reloadData];
        }else{
            UIAlertController *objAlertControler = [[UIAlertController alloc]init];
            UIAlertAction *okaction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
            [objAlertControler addAction:okaction];
            [self presentViewController:objAlertControler animated:true completion:nil];
        }
       
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_categoryNames count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CategoryTableViewCell *objCatCell = [tableView dequeueReusableCellWithIdentifier:@"CategoryTableViewCell"];
//    if (indexPath.section == 0) {
        [objCatCell setCollectionData:[_categories getCategoryByCategoryFlag:[_categoryNames objectAtIndex:indexPath.section]]];
//    }
    return objCatCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionview = [[UIView alloc]initWithFrame:CGRectMake(0, 0,[[UIScreen mainScreen]bounds].size.width, 30)];

    UILabel *lblSectionHeader = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, [[UIScreen mainScreen]bounds].size.width, 30)];
    [lblSectionHeader setTextColor:[UIColor grayColor]];
    [lblSectionHeader setFont:[UIFont systemFontOfSize:20]];
    lblSectionHeader.text = [[_categoryNames objectAtIndex:section]uppercaseString];
    [sectionview addSubview:lblSectionHeader];
    return sectionview;
}

@end
