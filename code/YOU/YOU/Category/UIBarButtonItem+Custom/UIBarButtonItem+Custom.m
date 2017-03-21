//
//  UIBarButtonItem+Custom.m
//  Epailive_Iphone
//
//  Created by on 16/1/18.
//  Copyright © 2016年 易拍全球（北京）科贸有限公司. All rights reserved.
//

#import "UIBarButtonItem+Custom.h"

@implementation UIBarButtonItem (Custom)



+ (UIBarButtonItem *)leftBarButtonItemWithImageName:(NSString *)imageName target:(id)target selector:(SEL)selector
{
    UIImage* image = [UIImage imageNamed:imageName];
    UIButton *barButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [barButton setFrame:CGRectMake(-20, 0, 35., 35.)];
    [barButton setImage:image forState:UIControlStateNormal];
    //[barButton setBackgroundColor:[UIColor whiteColor]];
    [barButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:barButton];
    
    return barButtonItem;
}

+ (UIBarButtonItem *)rightBarButtonItemWithImageName:(NSString *)imageName target:(id)target selector:(SEL)selector
{
    UIImage* image = [UIImage imageNamed:imageName];
    UIButton *barButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [barButton setFrame:CGRectMake(20, 0, 35., 35.)];
    [barButton setImage:image forState:UIControlStateNormal];
    [barButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:barButton];
    
    return barButtonItem;
}

+ (UIBarButtonItem *)barButtonItemWithImageName:(NSString *)imageName target:(id)target selector:(SEL)selector
{
    UIImage* image = [UIImage imageNamed:imageName];
    return  [self barButtonItemWithImage:image target:target selector:selector];
}

+ (UIBarButtonItem *)barButtonItemWithImageName:(NSString *)imageName target:(id)target selector:(SEL)selector btn:(UIButton* __autoreleasing *)btn
{
    UIImage* image = [UIImage imageNamed:imageName];
    return  [self BarButtonItemWithImage:image target:target selector:selector btn:btn];
}

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image target:(id)target selector:(SEL)selector
{
    UIButton *barButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [barButton setFrame:CGRectMake(0, 0, 35., 35.)];
    [barButton setImage:image forState:UIControlStateNormal];
    [barButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:barButton];
    
    return barButtonItem;
}

+ (UIBarButtonItem *)BarButtonItemWithImage:(UIImage *)image
                                     target:(id)target
                                   selector:(SEL)selector
                                        btn:(UIButton* __autoreleasing *)btn
{
    UIButton *barButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [barButton setFrame:CGRectMake(0, 0, 35., 35.)];
    [barButton setImage:image forState:UIControlStateNormal];
    [barButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:barButton];
     *btn = barButton;
    return barButtonItem;
}

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString*)title target:(id)target selector:(SEL)selector
{
    UIButton *barButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [barButton setFrame:CGRectMake(0, 0, 35., 35.)];
    [barButton setTitle:title forState:UIControlStateNormal];
    [barButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:barButton];
    
    return barButtonItem;
}



+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString*)title
                                     target:(id)target
                                   selector:(SEL)selector
                                        btn:(UIButton* __autoreleasing *)btn
{
    UIButton *barButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [barButton setFrame:CGRectMake(0, 0, 35., 35.)];
    [barButton setTitle:title forState:UIControlStateNormal];
    [barButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:barButton];
    *btn = barButton;
    return barButtonItem;
}
@end
