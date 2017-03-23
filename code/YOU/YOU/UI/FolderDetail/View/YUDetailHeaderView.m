//
//  YUDetailHeaderView.m
//  YOU
//
//  Created by epailive on 17/3/22.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import "YUDetailHeaderView.h"
@interface YUDetailHeaderView()
{
    CAShapeLayer* _layer1;
    CAShapeLayer* _layer2;
    CAShapeLayer* _layer3;
    CAShapeLayer* _layer4;
    __block NSInteger _direction;//1 up ,2 down
}

@end

@implementation YUDetailHeaderView

- (void)awakeFromNib
{
    
    [super awakeFromNib];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self startAnimate:60];
//    CGFloat pw = self.bottomView.bounds.size.width;
//    CGFloat ph = self.bottomView.bounds.size.height;
    
//    CGPoint centerpoint = CGPointMake(pw*0.5, ph+100);
//    UIBezierPath *path2 = [UIBezierPath bezierPath];
//    [path2 addArcWithCenter:centerpoint radius:ph+point2 startAngle:point1 endAngle:30 clockwise:YES];
//    [path2 closePath];
//    
//    CAShapeLayer* layer2 = [self createLayer];
//    layer2.path = path2.CGPath;
//    [self.bottomView.layer addSublayer:layer2];
//    CGFloat point1 = 60;
//    CGFloat point2 = point1+40;
//    CGFloat point3 = point1-40;
//    CGFloat x = 0;
//    CGFloat controlPonitY = -2;
//    CGFloat subW = pw*0.5;
//    ///*
//    UIBezierPath* path1= [UIBezierPath bezierPath];
//    [path1 moveToPoint:CGPointMake(x, point1)];
//    [path1 addLineToPoint:CGPointMake(x, ph)];
//    [path1 addLineToPoint:CGPointMake(subW, ph)];
//    [path1 addLineToPoint:CGPointMake(subW, 0)];
//    [path1 addQuadCurveToPoint:CGPointMake(x, point1) controlPoint:CGPointMake(pw*0.25, controlPonitY)];
//    [path1 closePath];
//    
//    CAShapeLayer* layer2 = [self createLayerWithColor:[UIColor colorWithRed:184/255.0f green:186/255.0f blue:241/255.0f alpha:1]];
//    layer2.path = path1.CGPath;
//    [self.leftView.layer addSublayer:layer2];
//    
//    UIBezierPath* path2 = [UIBezierPath bezierPath];
//    [path2 moveToPoint:CGPointMake(x, point2)];
//    [path2 addLineToPoint:CGPointMake(x, ph)];
//    [path2 addLineToPoint:CGPointMake(subW, ph)];
//    [path2 addLineToPoint:CGPointMake(subW, 0)];
//    [path2 addQuadCurveToPoint:CGPointMake(x, point2) controlPoint:CGPointMake(pw*0.25, controlPonitY)];
//    [path2 closePath];
//    
//    layer2 = [self createLayerWithColor:[UIColor whiteColor]];
//    layer2.path = path2.CGPath;
//    [self.leftView.layer addSublayer:layer2];
//    
//   
//    UIBezierPath* path3 = [UIBezierPath bezierPath];
//    [path3 moveToPoint:CGPointMake(0, 0)];
//    [path3 addLineToPoint:CGPointMake(x, ph)];
//    [path3 addLineToPoint:CGPointMake(subW, ph)];
//    [path3 addLineToPoint:CGPointMake(subW, point3)];
//    [path3 addQuadCurveToPoint:CGPointMake(0, 0) controlPoint:CGPointMake(pw*0.25, controlPonitY)];
//    [path3 closePath];
//    layer2 = [self createLayerWithColor:[UIColor colorWithRed:184/255.0f green:186/255.0f blue:241/255.0f alpha:0.2]];
//    layer2.path = path3.CGPath;
//    [self.rightView.layer addSublayer:layer2];
//
//    
//    UIBezierPath* path4 = [UIBezierPath bezierPath];
//    [path4 moveToPoint:CGPointMake(0, 0)];
//    [path4 addLineToPoint:CGPointMake(0, ph)];
//    [path4 addLineToPoint:CGPointMake(subW, ph)];
//    [path4 addLineToPoint:CGPointMake(subW, point1)];
//    [path4 addQuadCurveToPoint:CGPointMake(0, 0) controlPoint:CGPointMake(pw*0.25, controlPonitY)];
//    [path4 closePath];
//    layer2 = [self createLayerWithColor:[UIColor whiteColor]];
//    layer2.path = path4.CGPath;
//    [self.rightView.layer addSublayer:layer2];
    //*/
    
    /*
    UIBezierPath* path5 = [UIBezierPath bezierPath];
    [path5 moveToPoint:CGPointMake(x, point1)];
    [path5 addLineToPoint:CGPointMake(x, ph)];
    [path5 addLineToPoint:CGPointMake(pw, ph)];
    [path5 addLineToPoint:CGPointMake(pw, point3)];
    [path5 addQuadCurveToPoint:CGPointMake(pw*0.5, 0) controlPoint:CGPointMake(pw*0.75, controlPonitY)];
    [path5 addQuadCurveToPoint:CGPointMake(x, point1) controlPoint:CGPointMake(pw*0.25, controlPonitY)];
    CAShapeLayer* layer5 = [self createLayerWithColor:[UIColor colorWithRed:184/255.0f green:186/255.0f blue:241/255.0f alpha:1]];
    layer5.path = path5.CGPath;
    [self.bottomView.layer addSublayer:layer5];
    
    
    UIBezierPath* path6 = [UIBezierPath bezierPath];
    [path6 moveToPoint:CGPointMake(x, point2)];
    [path6 addLineToPoint:CGPointMake(x, ph)];
    [path6 addLineToPoint:CGPointMake(pw, ph)];
    [path6 addLineToPoint:CGPointMake(pw, point1)];
    [path6 addQuadCurveToPoint:CGPointMake(pw*0.5, 0) controlPoint:CGPointMake(pw*0.75, controlPonitY)];
    [path6 addQuadCurveToPoint:CGPointMake(x, point2) controlPoint:CGPointMake(pw*0.25, controlPonitY)];
    CAShapeLayer* layer6 = [self createLayerWithColor:[UIColor whiteColor]];
    layer6.path = path6.CGPath;
    [self.bottomView.layer addSublayer:layer6];

    */
}

-(void)startAnimate:(CGFloat) point
{
 
    CGFloat pw = self.bottomView.bounds.size.width;
    CGFloat ph = self.bottomView.bounds.size.height;
    CGFloat point1 = point;
    CGFloat point2 = point1+40;
    CGFloat point3 = point1-40;
    CGFloat x = 0;
    CGFloat controlPonitY = -2;
    CGFloat subW = pw*0.5;
    ///*
    UIBezierPath* path1= [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(x, point1)];
    [path1 addLineToPoint:CGPointMake(x, ph)];
    [path1 addLineToPoint:CGPointMake(subW, ph)];
    [path1 addLineToPoint:CGPointMake(subW, 0)];
    [path1 addQuadCurveToPoint:CGPointMake(x, point1) controlPoint:CGPointMake(pw*0.25, controlPonitY)];
    [path1 closePath];
    
    if (!_layer1) {
        _layer1 = [self createLayerWithColor:[UIColor colorWithRed:184/255.0f green:186/255.0f blue:241/255.0f alpha:1]];
    }
    _layer1.path = path1.CGPath;
    [self.leftView.layer addSublayer:_layer1];
    
    UIBezierPath* path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(x, point2)];
    [path2 addLineToPoint:CGPointMake(x, ph)];
    [path2 addLineToPoint:CGPointMake(subW, ph)];
    [path2 addLineToPoint:CGPointMake(subW, 0)];
    [path2 addQuadCurveToPoint:CGPointMake(x, point2) controlPoint:CGPointMake(pw*0.25, controlPonitY)];
    [path2 closePath];
    if (!_layer2) {
        _layer2 = [self createLayerWithColor:[UIColor whiteColor]];
    }
    _layer2.path = path2.CGPath;
    [self.leftView.layer addSublayer:_layer2];
    
    
    UIBezierPath* path3 = [UIBezierPath bezierPath];
    [path3 moveToPoint:CGPointMake(0, 0)];
    [path3 addLineToPoint:CGPointMake(x, ph)];
    [path3 addLineToPoint:CGPointMake(subW, ph)];
    [path3 addLineToPoint:CGPointMake(subW, point3)];
    [path3 addQuadCurveToPoint:CGPointMake(0, 0) controlPoint:CGPointMake(pw*0.25, controlPonitY)];
    [path3 closePath];
    if (!_layer3) {
        _layer3 = [self createLayerWithColor:[UIColor colorWithRed:184/255.0f green:186/255.0f blue:241/255.0f alpha:0.2]];
    }
    _layer3.path = path3.CGPath;
    [self.rightView.layer addSublayer:_layer3];
    
    
    UIBezierPath* path4 = [UIBezierPath bezierPath];
    [path4 moveToPoint:CGPointMake(0, 0)];
    [path4 addLineToPoint:CGPointMake(0, ph)];
    [path4 addLineToPoint:CGPointMake(subW, ph)];
    [path4 addLineToPoint:CGPointMake(subW, point1)];
    [path4 addQuadCurveToPoint:CGPointMake(0, 0) controlPoint:CGPointMake(pw*0.25, controlPonitY)];
    [path4 closePath];
    if (!_layer4) {
        _layer4 = [self createLayerWithColor:[UIColor whiteColor]];
    }
    _layer4.path = path4.CGPath;
    [self.rightView.layer addSublayer:_layer4];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CGFloat t = point;
        if (t==50) {
            _direction = 2;
        }
        
        if (t == 60) {
            _direction = 1;
        }
        
        if (_direction == 1) {
            t = t-1;
        }
        else
        {
            t = t+1;
        }
        
        [self startAnimate:t];
    });
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
