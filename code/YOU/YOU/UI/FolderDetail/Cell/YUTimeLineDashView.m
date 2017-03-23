//
//  YUTimeLineDashView.m
//  YOU
//
//  Created by epailive on 17/3/23.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import "YUTimeLineDashView.h"

@implementation YUTimeLineDashView

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.lineWidth = 1;
        self.pointRadius = 6;
        self.whitePointRadius = 2;
        self.lineSpacing = 4*self.lineWidth;
        self.lineColor = [UIColor lightGrayColor];
        self.pointColor = [UIColor blueColor];
        [self becomeFirstResponder];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGFloat height = rect.size.height;
    CGFloat width = rect.size.width;
    self.pointRadius = self.pointRadius>width? width : self.pointRadius;
    CGFloat pointx = width*0.5;
    CGFloat pointy = self.topSpacing + self.pointRadius;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, self.pointColor.CGColor);
    //CGContextAddArc(CGContextRef cg_nullable c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)

    //画黑点
    CGContextAddArc(context,  pointx, pointy, self.pointRadius, 0, M_PI*2, YES);
    CGContextDrawPath(context, kCGPathFill);
    
    //画小白点。
    CGFloat whitex = pointx;
    CGFloat whitey = pointy;
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextAddArc(context,whitex, whitey, self.whitePointRadius, 0, M_PI*2, YES);
    CGContextDrawPath(context, kCGPathFill);

    CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
    CGFloat spacing = self.lineSpacing;
    CGFloat lineY = pointy + self.pointRadius + spacing;
    CGFloat lineX = width*0.5;
    CGFloat lineH = (height -lineY - spacing - spacing - self.lineWidth -spacing - spacing)*0.5;
    //画竖条
    CGContextSetLineWidth(context, self.lineWidth);
    CGContextMoveToPoint(context, lineX, lineY);
    CGContextAddLineToPoint(context, lineX, lineY + lineH);
    CGContextClosePath(context);
    
    
    CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
    CGFloat dotY = lineY+ lineH + spacing;
    CGContextMoveToPoint(context, lineX, dotY);
    CGContextAddLineToPoint(context, lineX, dotY + self.lineWidth);
    CGContextClosePath(context);
    
    lineY = lineY + lineH + spacing + self.lineWidth + spacing;
    CGContextMoveToPoint(context, lineX, 60);
    CGContextAddLineToPoint(context, lineX, lineY+lineH);
    CGContextClosePath(context);
    
    CGContextDrawPath(context, kCGPathFillStroke);
   
}
@end
