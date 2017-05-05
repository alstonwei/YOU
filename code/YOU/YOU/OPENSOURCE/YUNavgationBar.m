//
//  YUNavgationBar.m
//  YOU
//
//  Created by alston on 2017/5/5.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import "YUNavgationBar.h"

#define iPhone6_Plus                    ([UIScreen mainScreen].currentMode.size.width == 1242)

#define isIpad                          ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)

@implementation YUNavgationBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self  = [super initWithFrame:frame]) {
        self.translucent = NO;
        [self addSubview:self.btnLeft];
        [self addSubview:self.btnRight];
    }
    return self;
}

- (void)layoutSubviews {
    CGFloat adjust = isIpad ? -10.0 : (iPhone6_Plus ? 4.0 : 0.0);
    [self.topItem.leftBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *customView = obj.customView;
        if (customView && [customView isKindOfClass:[UIButton class]]) {
            customView.contentEdgeInsets = UIEdgeInsetsMake(0.0, -adjust, 0.0, adjust);
        }
    }];
    [self.topItem.rightBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *customView = obj.customView;
        if (customView && [customView isKindOfClass:[UIButton class]]) {
            customView.contentEdgeInsets = UIEdgeInsetsMake(0.0, adjust, 0.0, -adjust);
        }
    }];
    
    [super layoutSubviews];
    
    self.btnLeft.frame = CGRectMake(5, 25, 35, 35);
    CGFloat editX = CGRectGetWidth(self.bounds)-35-5;
    self.btnRight.frame = CGRectMake(editX, 25, 35, 35);
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect titleRect = CGRectMake(self.bounds.size.width/2.0, 0.0, 0.0, self.bounds.size.height);
    if (self.topItem.titleView) {
        titleRect = [self convertRect:self.topItem.titleView.bounds fromView:self.topItem.titleView];
        if (CGRectContainsPoint(titleRect, point)) {
            return [super hitTest:point withEvent:event];
        }
    }
    
    CGFloat adjust = isIpad ? -10.0 : (iPhone6_Plus ? 4.0 : 0.0);
    if (point.x < CGRectGetMinX(titleRect)) {
        point.x += adjust;
    } else if (point.x > CGRectGetMaxX(titleRect)) {
        point.x -= adjust;
    }
    
    return [super hitTest:point withEvent:event];
}

- (UIButton *)btnLeft
{
    if (!_btnLeft) {
        _btnLeft = [self createBtn];
    }
    return _btnLeft;
}

- (UIButton *)btnRight
{
    if (!_btnRight) {
        _btnRight = [self createBtn];
    }
    return _btnRight;
}

-(UIButton*)createBtn
{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 35, 35);
    [btn setImage:[UIImage imageNamed:@"setting-white32"] forState:UIControlStateNormal];
    return btn;
}



@end
