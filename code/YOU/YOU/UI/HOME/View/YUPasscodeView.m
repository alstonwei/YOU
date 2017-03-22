//
//  YUPasscodeView.m
//  YOU
//
//  Created by epailive on 17/3/21.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import "YUPasscodeView.h"

@implementation YUPasscodeView

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameChanged:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameChanged:) name:UIKeyboardWillHideNotification object:nil];
}


/**
 *  键盘监听事件。用来处理分享试图的frame。
 *
 *  @param sender
 */
-(void)keyboardFrameChanged:(NSNotification *)sender
{
    // 0.取出键盘动画的时间
    CGFloat duration = [sender.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    // 1.取得键盘最后的frame
    CGRect keyboardFrame = [sender.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 2.计算控制器的view需要平移的距离
    CGFloat keyboardHeight = CGRectGetHeight(keyboardFrame);
    CGFloat transformY = - keyboardHeight;
    
    
    if (sender.name == UIKeyboardWillShowNotification)// 键盘出现是 view 上移。
    {
        UIWindow* keyWindow = [UIApplication sharedApplication].keyWindow;
        CGPoint point = CGPointMake(CGRectGetMinX(self.passcodeInputView.frame), self.passcodeInputView.frame.origin.y+ CGRectGetHeight(self.passcodeInputView.frame));
        CGPoint convertPoint = [self.passcodeInputView.superview convertPoint:point toView:keyWindow];
        CGFloat windowHeight = CGRectGetHeight(keyWindow.bounds);
        if ((windowHeight - convertPoint.y) < keyboardHeight) {
            transformY = (windowHeight - convertPoint.y) -keyboardHeight;
        }
        else
        {
            transformY = 0;
        }
        
        transformY = - keyboardHeight*0.5;
        
        // 3.执行动画
        [UIView animateWithDuration:duration animations:^{
            self.superview.superview.transform = CGAffineTransformMakeTranslation(0, transformY);
        }];
    }
    else if(sender.name == UIKeyboardWillHideNotification)//键盘消失时view 恢复原样。
    {
        //[self checkALLSegmentInput];
        // 3.执行动画
        [UIView animateWithDuration:duration animations:^{
            self.superview.superview.transform = CGAffineTransformIdentity;
        }];
    }
    
}

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
    [self endEditing:YES];
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


//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    return [super hitTest:point withEvent:event];
//}
@end
