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

@interface YUFolderDetailVC ()
{
    YUBasicViewController* baseVC;
}
@property (copy, nonatomic)NSString* key;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd;

- (IBAction)btnAddClicked:(id)sender;

- (IBAction)btnLookMessageClicked:(id)sender;
@end

@implementation YUFolderDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)btnLookMessageClicked:(id)sender{
    DemoMessagesViewController *vc = [DemoMessagesViewController messagesViewController];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)btnAddClicked:(id)sender {
    
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status){
        dispatch_async(dispatch_get_main_queue(), ^{
            
            baseVC = [[YUBasicViewController alloc] init];
            baseVC.folder = @"guochengyu";
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
