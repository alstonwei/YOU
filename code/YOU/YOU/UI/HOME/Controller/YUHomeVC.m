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
#import "BKPasscodeViewController.h"
#import "YUPasscodeView.h"
#import "KLCPopup.h"
#import "UIView+YULoad.h"
#import "WCLPassWordView.h"

@interface YUHomeVC ()<UICollectionViewDelegate,UICollectionViewDataSource,BKPasscodeViewControllerDelegate>

{
    UINavigationController *_pwdNavController;
    KLCPopup* _popup;
}
@property(nonatomic,strong)NSMutableArray* dataSource;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd;

- (IBAction)btnAddClicked:(id)sender;
@end

@implementation YUHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"YOU";
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.dataSource removeAllObjects];
    NSMutableArray* arr = [[YUDBTool sharedYUDBTool] queryCollections];
    [self.dataSource addObjectsFromArray:arr];
    [self.myCollectionView reloadData];
}

- (IBAction)btnAddClicked:(id)sender {
    YUAddEditCollectionVC* add = [[YUAddEditCollectionVC alloc] init];
    YUNavigationController* nav = [[YUNavigationController alloc] initWithRootViewController:add];
    add.resultBlock = ^(BOOL result,YUCollectionModel * collection){
        YUFolderDetailVC* detail = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"YUFolderDetailVC"];
        detail.collectionModel = collection;
        [self.navigationController pushViewController:detail animated:YES];
        [nav dismissViewControllerAnimated:NO completion:^{
            
        }];
        
    };
    [self.navigationController presentViewController:nav animated:YES completion:^{
    }];
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
        __weak typeof (self) weakSelf = self;
        YUPasscodeView* passcode = [YUPasscodeView YU_LoadFromNib];
        _popup = [KLCPopup popupWithContentView:passcode];
        _popup.shouldDismissOnBackgroundTouch = NO;
         __weak typeof (_popup) weakPopup = _popup;
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
                      [weakPopup dismiss:NO];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                       [weakSelf goCollectionDetail:model];
                    });
                    
                }
                else{
                    //passWord.textStore = @"";
                }
            }
        };
        [_popup showWithLayout:KLCPopupLayoutCenter];
        
//        BKPasscodeViewController *viewController = [[BKPasscodeViewController alloc] initWithNibName:nil bundle:nil];
//        viewController.delegate = self;
//        viewController.type = BKPasscodeViewControllerNewPasscodeType;
//        // viewController.type = BKPasscodeViewControllerChangePasscodeType;    // for change
//        // viewController.type = BKPasscodeViewControllerCheckPasscodeType;   // for authentication
//        
//        viewController.passcodeStyle = BKPasscodeInputViewNumericPasscodeStyle;
//        // viewController.passcodeStyle = BKPasscodeInputViewNormalPasscodeStyle;    // for ASCII style passcode.
//        
//        // To supports Touch ID feature, set BKTouchIDManager instance to view controller.
//        // It only supports iOS 8 or greater.
//        viewController.touchIDManager = [[BKTouchIDManager alloc] initWithKeychainServiceName:@"kkk"];
//        viewController.touchIDManager.promptText = @"Scan fingerprint to authenticate";   // You can set prompt text.
//        
//        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
//        [self presentViewController:navController animated:YES completion:nil];
        return;
    }
    [self goCollectionDetail:model];
}

-(void)goCollectionDetail:(YUCollectionModel*)model{
    YUFolderDetailVC* detail = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"YUFolderDetailVC"];
    detail.collectionModel = model;
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark BKPasscodeViewControllerDelegate
- (void)passcodeViewController:(BKPasscodeViewController *)aViewController didFinishWithPasscode:(NSString *)aPasscode
{
    [_pwdNavController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}




@end
