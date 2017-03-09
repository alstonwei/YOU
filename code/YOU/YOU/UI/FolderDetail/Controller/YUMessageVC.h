//
//  YUMessageVC.h
//  YOU
//
//  Created by epailive on 17/3/9.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import "JSQMessages.h"

#import "DemoModelData.h"
#import "NSUserDefaults+DemoSettings.h"


@class DemoMessagesViewController;

@protocol JSQDemoViewControllerDelegate <NSObject>

- (void)didDismissJSQDemoViewController:(DemoMessagesViewController *)vc;

@end




@interface YUMessageVC : JSQMessagesViewController <UIActionSheetDelegate, JSQMessagesComposerTextViewPasteDelegate>

@property (weak, nonatomic) id<JSQDemoViewControllerDelegate> delegateModal;

@property (strong, nonatomic) DemoModelData *demoData;

- (void)receiveMessagePressed:(UIBarButtonItem *)sender;

- (void)closePressed:(UIBarButtonItem *)sender;

@end
