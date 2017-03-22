//
//  YUHomeVC.m
//  YOU
//
//  Created by epailive on 17/3/9.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import "YUFolderDetailVC.h"
#import "CTAssetsPickerController.h"
#import "DemoMessagesViewController.h"
#import "YUBasicViewController.h"
#import "UINavigationItem+Spacing.h"
#import "YUAddEditCollectionVC.h"
#import "YUNavigationController.h"
#import "YUDetailHeaderView.h"
#import "UIView+YULoad.h"


@interface YUFolderDetailVC ()
{
    YUBasicViewController* baseVC;
    YUDetailHeaderView* _headerView;
}
@property (copy, nonatomic)NSString* key;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd;

- (IBAction)btnAddClicked:(id)sender;

- (IBAction)btnLookMessageClicked:(id)sender;
@end

@implementation YUFolderDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _headerView = [YUDetailHeaderView YU_LoadFromNib];
    self.tableView.tableHeaderView = _headerView;
    
    self.title = self.collectionModel.name;
    [self.navigationItem setRightBarButtonItemsWithImageName:@"setting-white32" target:self selector:@selector(editCollection:)];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)editCollection:(id)sender{
    YUAddEditCollectionVC* add = [[YUAddEditCollectionVC alloc] init];
    add.editCollection = self.collectionModel;
    YUNavigationController* nav = [[YUNavigationController alloc] initWithRootViewController:add];
    add.resultBlock = ^(BOOL result,YUCollectionModel * collection){
        
        [self relaodData];
        [nav dismissViewControllerAnimated:YES completion:^{
            
        }];
        
    };
    [self.navigationController presentViewController:nav animated:YES completion:^{
    }];

}

-(void)relaodData{
    
}

- (IBAction)btnLookMessageClicked:(id)sender{
    DemoMessagesViewController *vc = [DemoMessagesViewController messagesViewController];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)btnAddClicked:(id)sender {
    
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status){
        dispatch_async(dispatch_get_main_queue(), ^{
            
            baseVC = [[YUBasicViewController alloc] init];
            baseVC.collectionModel = self.collectionModel;
            CTAssetsPickerController *picker = [[CTAssetsPickerController alloc] init];
            picker.delegate = baseVC;
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
                picker.modalPresentationStyle = UIModalPresentationFormSheet;

            [self presentViewController:picker animated:YES completion:^{
                [self.navigationController pushViewController:baseVC animated:NO];
            }];
        });
    }];
}

@end
