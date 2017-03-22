//
//  YUDetailHeaderView.m
//  YOU
//
//  Created by epailive on 17/3/22.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import "YUDetailHeaderView.h"

@implementation YUDetailHeaderView

- (void)awakeFromNib
{
    
    [super awakeFromNib];

    
}
/*
CAShapeLayer *layer1 = [[CAShapeLayer alloc] init];
UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 80, pw-40, ph-320) byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(4, 4)];
[layer1 setFillColor:[UIColor colorWithRed:0.851 green:0.3216 blue:0.2784 alpha:1.0].CGColor];
[layer1 setStrokeColor:[UIColor colorWithRed:0.9401 green:0.0 blue:0.0247 alpha:0.02].CGColor];
[layer1 setShadowColor:[UIColor blackColor].CGColor];
[layer1 setLineWidth:0.1];
[layer1 setShadowOffset:CGSizeMake(6, 6)];
[layer1 setShadowOpacity:0.2];
[layer1 setShadowOffset:CGSizeMake(1, 1)];
layer1.path = path1.CGPath;
[self.bottomView.layer addSublayer:layer1];
*/

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat pw = self.bottomView.bounds.size.width;
    CGFloat ph = self.bottomView.bounds.size.height;
    
//    CGPoint centerpoint = CGPointMake(pw*0.5, ph+100);
//    UIBezierPath *path2 = [UIBezierPath bezierPath];
//    [path2 addArcWithCenter:centerpoint radius:ph+80 startAngle:60 endAngle:30 clockwise:YES];
//    [path2 closePath];
//    
//    CAShapeLayer* layer2 = [self createLayer];
//    layer2.path = path2.CGPath;
//    [self.bottomView.layer addSublayer:layer2];
    
    
    UIBezierPath* path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(0, 60)];
    [path2 addLineToPoint:CGPointMake(0, ph)];
    [path2 addLineToPoint:CGPointMake(pw, ph)];
    [path2 addLineToPoint:CGPointMake(pw, 80)];
    [path2 addQuadCurveToPoint:CGPointMake(0, 60) controlPoint:CGPointMake(pw*0.5, -50)];
    [path2 closePath];
    
    CAShapeLayer* layer2 = [self createLayerWithColor:[UIColor greenColor]];
    layer2.path = path2.CGPath;
    [self.bottomView.layer addSublayer:layer2];
    
    
    path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(0, 80)];
    [path2 addLineToPoint:CGPointMake(0, ph)];
    [path2 addLineToPoint:CGPointMake(pw, ph)];
    [path2 addLineToPoint:CGPointMake(pw, 60)];
    [path2 addQuadCurveToPoint:CGPointMake(0, 80) controlPoint:CGPointMake(pw*0.5, -50)];
    [path2 closePath];
    
    layer2 = [self createLayerWithColor:[UIColor redColor]];
    layer2.path = path2.CGPath;
    [self.bottomView.layer addSublayer:layer2];
    
    
}

-(CAShapeLayer *)createLayerWithColor:(UIColor*)color
{
    CAShapeLayer *layer1 = [[CAShapeLayer alloc] init];
    [layer1 setFillColor:color.CGColor];
    [layer1 setStrokeColor:color.CGColor];
    [layer1 setShadowColor:[UIColor blackColor].CGColor];
    [layer1 setLineWidth:0.1];
    [layer1 setShadowOffset:CGSizeMake(6, 6)];
    [layer1 setShadowOpacity:0.2];
    [layer1 setShadowOffset:CGSizeMake(1, 1)];
    return layer1;
}
@end
