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
#import "YUAddEditCollectionVC.h"
#import "YUNavigationController.h"
#import "YUPasscodeView.h"
#import "KLCPopup.h"
#import "UIView+YULoad.h"
#import "WCLPassWordView.h"

@interface YUHomeVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    KLCPopup* _popup;
}


- (IBAction)btnAddClicked:(id)sender;
@end

@implementation YUHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.subCollection) {
        [self.btnAdd setHidden:YES];
        [self.btnFetch setHidden:YES];
        self.title = @"结果";
    }
    else{
        self.title = @"YOU";
    }
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.subCollection) {
        [self.btnAdd setHidden:YES];
        [self.btnFetch setHidden:YES];
    }
    else{
        [self reloadCollectionByWhere:@""];
    }
}

-(void)reloadCollectionByWhere:(NSString*)where
{
    [self.dataSource removeAllObjects];
    NSMutableArray* arr = [[YUDBTool sharedYUDBTool] queryCollectionsByWhere:where];
    [self.dataSource addObjectsFromArray:arr];
    [self.dataSource addObjectsFromArray:self.fetchDataArray];
    [self.myCollectionView reloadData];
}

- (IBAction)btnAddClicked:(id)sender {
    YUAddEditCollectionVC* add = [[YUAddEditCollectionVC alloc] init];
    YUNavigationController* nav = [[YUNavigationController alloc] initWithRootViewController:add];
    add.resultBlock = ^(BOOL result,YUCollectionModel * collection){
        YUFolderDetailVC* detail = [[YUFolderDetailVC alloc] init];
        //YUFolderDetailVC* detail = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"YUFolderDetailVC"];
        detail.collectionModel = collection;
        [self.navigationController pushViewController:detail animated:YES];
        [nav dismissViewControllerAnimated:NO completion:^{
            
        }];
        
    };
    [self.navigationController presentViewController:nav animated:YES completion:^{
    }];
}



- (IBAction)btnFetchClicked:(id)sender {
    __weak typeof (self) weakSelf = self;
    YUPasscodeView* passcode = [YUPasscodeView YU_LoadFromNib];
    _popup = [KLCPopup popupWithContentView:passcode];
    _popup.shouldDismissOnBackgroundTouch = NO;
    __weak typeof (_popup) weakPopup = _popup;
    _popup.touchBackgroundCallBack = ^(){
        [passcode endEditing:YES];
    };
    passcode.selectBlock = ^(){
        [weakPopup dismiss:YES];
    };
    passcode.resultBlock = ^(WCLPassWordView *passWord,YUPasscodeViewResultType type){
        if (type == YUPasscodeViewResultTypeClose) {
            [weakPopup dismiss:YES];
        }
        else
        {
            NSString* where = [NSString stringWithFormat:@"pwd = '%@'",passWord.textStore];
            NSMutableArray* arr = [[YUDBTool sharedYUDBTool] queryCollectionsByWhere:where];
            if (arr && arr.count>0) {
                [passWord showSuccessType];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [weakPopup dismiss:NO];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [weakSelf goSubCollectionVC:arr];
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [weakSelf.fetchDataArray addObjectsFromArray:arr];
                        });
                        
                    });
                });
            }
            else{
                [passWord showErrorType];
            }
        }
    };
    [_popup showWithLayout:KLCPopupLayoutCenter];
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
    __weak typeof (self) weakSelf = self;
    cell.actionBlock = ^(YUHomeFolderCell* cell,id sender){
        [weakSelf.fetchDataArray removeObject:model];
        [weakSelf.dataSource removeObject:model];
        NSIndexPath* temp = [weakSelf.myCollectionView indexPathForCell:cell];
        [weakSelf.myCollectionView  deleteItemsAtIndexPaths:@[temp]];
        //[weakSelf.myCollectionView reloadData];
    };
    return cell;
}

#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    YUCollectionModel* model = self.dataSource[indexPath.item];
    if (!self.subCollection && model.enterDetailUsePwd == 1) {
        __weak typeof (self) weakSelf = self;
        YUPasscodeView* passcode = [YUPasscodeView YU_LoadFromNib];
        _popup = [KLCPopup popupWithContentView:passcode];
        _popup.shouldDismissOnBackgroundTouch = NO;
         __weak typeof (_popup) weakPopup = _popup;
        _popup.touchBackgroundCallBack = ^(){
            [passcode endEditing:YES];
        };
        passcode.selectBlock = ^(){
            [weakPopup dismiss:YES];
        };
        passcode.resultBlock = ^(WCLPassWordView *passWord,YUPasscodeViewResultType type){
            if (type == YUPasscodeViewResultTypeClose) {
                [weakPopup dismiss:YES];
            }
            else
            {
                if ([passWord.textStore isEqualToString:model.pwd]) {
                    
                    [passWord showSuccessType];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [weakPopup dismiss:NO];
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [weakSelf goCollectionDetail:model];
                        });
                    });
                }
                else{
                    [passWord showErrorType];
                }
            }
        };
        [_popup showWithLayout:KLCPopupLayoutCenter];
        return;
    }
    [self goCollectionDetail:model];
}

-(void)goCollectionDetail:(YUCollectionModel*)model{
    YUFolderDetailVC* detail = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"YUFolderDetailVC"];
    detail = [[YUFolderDetailVC alloc] init];
    detail.collectionModel = model;
    [self.navigationController pushViewController:detail animated:YES];
}

-(void)goSubCollectionVC:(NSMutableArray*)arr{
    YUHomeVC* detail = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"YUHomeVC"];
    detail.dataSource = arr;
    detail.subCollection = YES;
    [self.navigationController pushViewController:detail animated:YES];
}


-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

-(NSMutableArray *)fetchDataArray
{
    if (!_fetchDataArray) {
        _fetchDataArray = [NSMutableArray array];
    }
    return _fetchDataArray;
}




@end
