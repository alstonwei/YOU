//
//  UINavigationItem+Spacing.h
//  Epailive_Iphone
//
//  Created by Shouqiang Wei on 16/1/18.
//  Copyright © 2016年 易拍全球（北京）科贸有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (Spacing)



-(NSArray*)setLeftBarButtonItemsWithImageName:(NSString*)imageName target:(id)target selector:(SEL)selector;
-(NSArray*)setRightBarButtonItemsWithImageName:(NSString*)imageName target:(id)target selector:(SEL)selector;


-(NSArray*)setRightBarButtonItemsWithTitle:(NSString*)title
                                    target:(id)target
                                  selector:(SEL)selector
                                    button:(UIButton* __autoreleasing *)btn;

-(NSArray*)setRightBarButtonWithItems:(NSArray*)items;

@end
