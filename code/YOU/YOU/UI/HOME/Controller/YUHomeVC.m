//
//  YUHomeVC.m
//  YOU
//
//  Created by epailive on 17/3/9.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import "YUHomeVC.h"
#import "YUHomeFolderCell.h"
#import "YUDataFakeFactory.h"
#import "YUFolderDetailVC.h"
#import "YUDBTool.h"

@interface YUHomeVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)NSMutableArray* dataSource;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd;

- (IBAction)btnAddClicked:(id)sender;
@end

@implementation YUHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray* arr = [[YUDBTool sharedYUDBTool] queryCollections];
    [self.dataSource addObjectsFromArray:arr];
}

- (IBAction)btnAddClicked:(id)sender {
    
}


#pragma mark UICollectionViewDataSource <NSObject>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YUHomeFolderCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YUHomeFolderCell" forIndexPath:indexPath];
    YUCollectionModel* model = self.dataSource[indexPath.item];
    cell.collectionModel = model;
    
    return cell;
}

#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    YUCollectionModel* model = self.dataSource[indexPath.item];
    if (model.enterDetailUsePwd == 1) {
        return;
    }
    YUFolderDetailVC* detail = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"YUFolderDetailVC"];
    detail.collectionModel = model;
    [self.navigationController pushViewController:detail animated:YES];
}

-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}


@end
