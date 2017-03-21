//
//  YUPasscodeView.m
//  YOU
//
//  Created by epailive on 17/3/21.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import "YUPasscodeView.h"

@implementation YUPasscodeView


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    if (point.y > 93 && point.y < 144) {
        if (self.selectBlock) {
            self.selectBlock();
        }
    }
}


- (IBAction)btnCloseClicked:(id)sender {
    if (self.resultBlock) {
        self.resultBlock(nil,YUPasscodeViewResultTypeClose);
    }
}

/**
 *  监听输入的改变
 */
- (void)passWordDidChange:(WCLPassWordView *)passWord
{
    
}

/**
 *  监听输入的完成时
 */
- (void)passWordCompleteInput:(WCLPassWordView *)passWord{
    //__weak typeof (self) weakSelf = self;
    if (self.resultBlock) {
        self.resultBlock(passWord,YUPasscodeViewResultTypeCompleteInput);
    }
}

/**
 *  监听开始输入
 */
- (void)passWordBeginInput:(WCLPassWordView *)passWord{
    
}

@end
