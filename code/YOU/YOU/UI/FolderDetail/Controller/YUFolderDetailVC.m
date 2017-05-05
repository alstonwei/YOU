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
#import "YUDetailDesCell.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "UINavigationBar+Awesome.h"
#import "YUNavgationBar.h"

#define NAVBAR_CHANGE_POINT 50

@interface YUFolderDetailVC ()
{
    YUBasicViewController* baseVC;
    YUDetailHeaderView* _headerView;
    UIImageView* _headerImageView;
}
@property (copy, nonatomic)NSString* key;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
@property (nonatomic,strong) YUNavgationBar* topBar;
@property (weak, nonatomic) IBOutlet UIButton *btnBack;
@property (weak, nonatomic) IBOutlet UIButton *btnEdit;
- (IBAction)btnAddClicked:(id)sender;

- (IBAction)btnLookMessageClicked:(id)sender;
@end

@implementation YUFolderDetailVC


- (void)dealloc
{
    [self.tableView  removeObserver:self forKeyPath:@"contentOffset"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = self.collectionModel.name;
    //[self.navigationItem setRightBarButtonItemsWithImageName:@"setting-white32" target:self selector:@selector(editCollection:)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self setupHeadView];
    [self regisreCell];
    self.fd_prefersNavigationBarHidden = YES;
    [self setupCustomNavBar];
}

-(void)setupCustomNavBar
{
    
    self.topBar = [[YUNavgationBar alloc] initWithFrame:CGRectMake(0, 0,CGRectGetWidth(self.view.bounds), 64)];
    [self.navigationController.view addSubview:self.topBar];
    self.topBar.barTintColor = [UIColor clearColor];
    [self.topBar setBackgroundColor:[UIColor clearColor]];
    [self.topBar lt_setBackgroundColor:[UIColor clearColor]];
    [self.topBar.btnLeft addTarget:self action:@selector(btnNavClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.topBar.btnLeft addTarget:self action:@selector(btnNavClicked:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btnNavClicked:(id)btn{
    if (btn == self.topBar.btnLeft) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (btn == self.topBar.btnRight){
        [self editCollection:btn];
    }
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.tableView.delegate = self;
    [self scrollViewDidScroll:self.tableView];
    [self.topBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
    [self.topBar lt_reset];
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor * color = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_CHANGE_POINT) {
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
        [self.topBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.topBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
}

-(void)setupHeadView
{
    _headerView = [YUDetailHeaderView YU_LoadFromNib];
    [_headerView setBackgroundColor:[UIColor clearColor]];
    self.tableView.tableHeaderView = _headerView;

    _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 300)];
    _headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    //_headerImageView.clipsToBounds =  YES;
    [_headerImageView setImage:[UIImage imageNamed:@"liuyan-1"]];
    [self.view insertSubview:_headerImageView atIndex:0];
    
    UIView* v  = [[UIView alloc] initWithFrame:CGRectMake(0, 280, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    [v setBackgroundColor:[UIColor whiteColor]];
    [self.view insertSubview:v atIndex:1];
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
}

-(void)regisreCell
{
    UINib* nib = [UINib nibWithNibName:YUDetailDesCellResueIdentier bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:YUDetailDesCellResueIdentier];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        
        //CGFloat imageH = _headerImageView.frame.size.height;
        CGFloat offsetY = self.tableView.contentOffset.y;
        if (offsetY<=0) {
            // 实现下拉放大顶部图片效果
            CGFloat scale = 1 - (offsetY / 500);
            //scale = (scale >= 1.5) ? 1.5 : scale;
            NSLog(@"offsetY : %f scale:%f",offsetY,scale);
            CGAffineTransform translationTransform = CGAffineTransformMakeTranslation(0, offsetY - offsetY*0.2);
            CGAffineTransform scaleTransform = CGAffineTransformMakeScale(scale, scale);
            CGAffineTransform concatTransform = CGAffineTransformConcat(scaleTransform, translationTransform);
            _headerImageView.transform = concatTransform;
            
        }
        else
        {
            _headerImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 300);
            _headerImageView.transform = CGAffineTransformIdentity;
        }
       

    }
    else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
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



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YUDetailDesCell* cell = [tableView dequeueReusableCellWithIdentifier:YUDetailDesCellResueIdentier];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}



@end
