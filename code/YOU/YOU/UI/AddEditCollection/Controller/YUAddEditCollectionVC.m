//
//  YUAddEditCollectionVC.m
//  YOU
//
//  Created by epailive on 17/3/20.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import "YUAddEditCollectionVC.h"
#import "UIView+YULoad.h"
#import "YUSelectPhotoHeaderView.h"
#import "UINavigationItem+Spacing.h"
#import "XLForm.h"
#import "MWPhotoBrowser.h"
#import "DZNPhotoPickerController.h"
#import "MJExtension.h"
#import "YUDBTool.h"
#import "YUFolderDetailVC.h"

@interface YUAddEditCollectionVC()
{
    YUSelectPhotoHeaderView* _selectPhotoHeaderView;
    UIImage* _coverImage;
}

@end

@implementation YUAddEditCollectionVC

+ (void)initialize
{
    [DZNPhotoPickerController registerService:DZNPhotoPickerControllerService500px
                                  consumerKey:@"1"
                               consumerSecret:@"YOUR_500px_SECRET"
                                 subscription:DZNPhotoPickerControllerSubscriptionFree];
    
    [DZNPhotoPickerController registerService:DZNPhotoPickerControllerServiceFlickr
                                  consumerKey:@"2"
                               consumerSecret:@"YOUR_Flickr_SECRET"
                                 subscription:DZNPhotoPickerControllerSubscriptionFree];
    
    [DZNPhotoPickerController registerService:DZNPhotoPickerControllerServiceInstagram
                                  consumerKey:@"3"
                               consumerSecret:@"YOUR_Flickr_SECRET"
                                 subscription:DZNPhotoPickerControllerSubscriptionFree];
    
    [DZNPhotoPickerController registerService:DZNPhotoPickerControllerServiceGoogleImages
                                  consumerKey:@"4"
                               consumerSecret:@"YOUR_Flickr_SECRET"
                                 subscription:DZNPhotoPickerControllerSubscriptionFree];
    
    [DZNPhotoPickerController registerService:DZNPhotoPickerControllerServiceBingImages
                                  consumerKey:@"5"
                               consumerSecret:@"YOUR_Flickr_SECRET"
                                 subscription:DZNPhotoPickerControllerSubscriptionFree];
    
    [DZNPhotoPickerController registerService:DZNPhotoPickerControllerServiceGiphy
                                  consumerKey:@"6"
                               consumerSecret:@"YOUR_Flickr_SECRET"
                                 subscription:DZNPhotoPickerControllerSubscriptionFree];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //self.tableView.separatorStyle; ＝ UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor whiteColor];
    _selectPhotoHeaderView =  [YUSelectPhotoHeaderView YU_LoadFromNib];
    [_selectPhotoHeaderView.btnSelect addTarget:self action:@selector(btnSelectClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableHeaderView = _selectPhotoHeaderView;
    
    if (self.navigationController && self.navigationController.childViewControllers.count>1) {
        
    }
    else
    {
        [self.navigationItem setLeftBarButtonItemsWithImageName:@"x-dark32" target:self selector:@selector(dismiss:)];
         [self.navigationItem setRightBarButtonItemsWithImageName:@"sure-dark32" target:self selector:@selector(save:)];
        
    }
    
    XLFormDescriptor* form = [XLFormDescriptor formDescriptor];
    XLFormSectionDescriptor* section = [XLFormSectionDescriptor formSection];
    XLFormRowDescriptor* row = [XLFormRowDescriptor formRowDescriptorWithTag:@"name" rowType:XLFormRowDescriptorTypeText];
    //[row.cellConfig setValue:@(UITableViewCellSeparatorStyleNone) forKey:@""];
    row.height = 80.0f;
    if (self.editCollection) {
        row.value = self.editCollection.name;
    }
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"des" rowType:XLFormRowDescriptorTypeTextView];
    row.height = 300.0f;
    if (self.editCollection) {
        row.value = self.editCollection.des;
    }
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"usepwd" rowType:XLFormRowDescriptorTypeBooleanSwitch];
    row.value = @(false);
    if (self.editCollection && self.editCollection.pwd) {
        row.value = @(true);
    }
    row.title = @"是否使用密码";
    //[row.cellConfig setValue:@(UITableViewCellSeparatorStyleNone) forKey:@""];
    row.height = 50.0f;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"pwd" rowType:XLFormRowDescriptorTypeText];
    row.title = @"密码：";
    if (self.editCollection && self.editCollection.pwd) {
        row.value = self.editCollection.pwd;
    }
    //[row.cellConfig setValue:@(UITableViewCellSeparatorStyleNone) forKey:@""];
    row.height = 50.0f;
    row.hidden = [NSString stringWithFormat:@"$%@==0",@"usepwd"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"enterDetailUsePwd" rowType:XLFormRowDescriptorTypeBooleanSwitch];
    row.title = @"进入详情是否需要密码：";
    if (self.editCollection && self.editCollection.pwd) {
        row.value = @(self.editCollection.enterDetailUsePwd);
    }
    //[row.cellConfig setValue:@(UITableViewCellSeparatorStyleNone) forKey:@""];
    row.height = 50.0f;
    row.hidden = [NSString stringWithFormat:@"$%@==0",@"usepwd"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"showCollectionUsePwd" rowType:XLFormRowDescriptorTypeBooleanSwitch];
    row.title = @"显示集合是否需要密码：";
    if (self.editCollection && self.editCollection.pwd) {
        row.value = @(self.editCollection.showCollectionUsePwd);
    }
    //[row.cellConfig setValue:@(UITableViewCellSeparatorStyleNone) forKey:@""];
    row.height = 50.0f;
    row.hidden = [NSString stringWithFormat:@"$%@==0",@"usepwd"];
    [section addFormRow:row];
    
    [form addFormSection:section];
    self.form = form;
}

-(void)dismiss:(id)sender{
    [self.view endEditing:YES];
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)save:(id)sender{
    [self.view endEditing:YES];
    NSDictionary* dic = self.form.formValues;
    if (self.editCollection) {
        YUCollectionModel* collection = [YUCollectionModel mj_objectWithKeyValues:dic];
        [self.editCollection mj_setKeyValues:dic];
        BOOL saveResult = [[YUDBTool sharedYUDBTool] updateCollection:collection];
        if (self.resultBlock) {
            self.resultBlock(saveResult,collection);
        }
    }
    else
    {
        YUCollectionModel* collection = [YUCollectionModel mj_objectWithKeyValues:dic];
        BOOL saveResult = [[YUDBTool sharedYUDBTool] insertCollection:collection];
        if (saveResult) {
            if (self.resultBlock) {
                self.resultBlock(saveResult,collection);
            }
        }
        else{
            
        }
    }
    
}


-(void)btnSelectClicked:(UIButton*)btn{
    [self.view endEditing:YES];
    DZNPhotoPickerController *picker = [[DZNPhotoPickerController alloc] init];
    picker.supportedServices = DZNPhotoPickerControllerServiceInstagram;
    picker.allowsEditing = YES;
    //picker.delegate = self;
    picker.finalizationBlock = ^(DZNPhotoPickerController *picker, NSDictionary *info) {
        //Your implementation here
        [picker dismissViewControllerAnimated:YES completion:^{
            
        }];
    };
    
    picker.failureBlock = ^(DZNPhotoPickerController *picker, NSError *error) {
        //Your implementation here
        [picker dismissViewControllerAnimated:YES completion:^{
            
        }];
    };
    
    picker.cancellationBlock = ^(DZNPhotoPickerController *picker) {
        //Your implementation here
        [picker dismissViewControllerAnimated:YES completion:^{
            
        }];
    };
    [self presentViewController:picker animated:YES completion:nil];
}

@end
