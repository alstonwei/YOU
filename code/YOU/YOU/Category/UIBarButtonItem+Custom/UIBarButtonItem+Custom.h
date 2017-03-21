//
//  UIBarButtonItem+Custom.h
//  Epailive_Iphone
//
//  Created by  on 16/1/18.
//  Copyright © 2016年 易拍全球（北京）科贸有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Custom)



+ (UIBarButtonItem *)leftBarButtonItemWithImageName:(NSString *)imageName
                                             target:(id)target
                                           selector:(SEL)selector;

+ (UIBarButtonItem *)rightBarButtonItemWithImageName:(NSString *)imageName
                                              target:(id)target
                                            selector:(SEL)selector;

+ (UIBarButtonItem *)barButtonItemWithImageName:(NSString *)imageName
                                         target:(id)target
                                       selector:(SEL)selector;

+ (UIBarButtonItem *)barButtonItemWithImageName:(NSString *)imageName
                                         target:(id)target
                                       selector:(SEL)selector
                                            btn:(UIButton* __autoreleasing *)btn;

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image
                                     target:(id)target
                                   selector:(SEL)selector;

+ (UIBarButtonItem *)BarButtonItemWithImage:(UIImage *)image
                                     target:(id)target
                                   selector:(SEL)selector
                                        btn:(UIButton* __autoreleasing *)btn;

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString*)title
                                     target:(id)target
                                   selector:(SEL)selector;

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString*)title
                                     target:(id)target
                                   selector:(SEL)selector
                                        btn:(UIButton* __autoreleasing*)btn;

@end
