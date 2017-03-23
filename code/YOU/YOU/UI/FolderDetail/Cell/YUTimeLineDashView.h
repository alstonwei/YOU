//
//  YUTimeLineDashView.h
//  YOU
//
//  Created by epailive on 17/3/23.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YUTimeLineDashView : UIView

@property (assign, nonatomic) IBInspectable CGFloat pointRadius;//黑点的半径
@property (assign, nonatomic) IBInspectable CGFloat whitePointRadius;//黑点的半径
@property (strong, nonatomic) IBInspectable UIColor *pointColor;//黑点的颜色
@property (strong, nonatomic) IBInspectable UIColor *lineColor;//边框的颜色
@property (assign, nonatomic) IBInspectable CGFloat lineWidth;//线颜色
@property (assign, nonatomic) IBInspectable CGFloat topSpacing;//顶部边距
@property (assign, nonatomic) IBInspectable CGFloat lineSpacing;//线边距
@end
