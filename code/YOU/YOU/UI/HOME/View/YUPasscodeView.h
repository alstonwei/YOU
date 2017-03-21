//
//  YUPasscodeView.h
//  YOU
//
//  Created by epailive on 17/3/21.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WCLPassWordView.h"

typedef NS_ENUM(NSInteger,YUPasscodeViewResultType) {
    YUPasscodeViewResultTypeClose,
    YUPasscodeViewResultTypeCompleteInput,
};

@interface YUPasscodeView : UIView
@property (copy, nonatomic) void(^selectBlock)(void);
@property (copy, nonatomic) void(^resultBlock)(WCLPassWordView *passWord,YUPasscodeViewResultType type);
@property (weak, nonatomic) IBOutlet WCLPassWordView *passcodeInputView;

@property (weak, nonatomic) IBOutlet UIButton *btnClose;

- (IBAction)btnCloseClicked:(id)sender;

@end
