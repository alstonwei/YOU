//
//  UINavigationItem+Spacing.m
//  Epailive_Iphone
//
//  Created by Shouqiang Wei on 16/1/18.
//  Copyright © 2016年 易拍全球（北京）科贸有限公司. All rights reserved.
//

#import "UINavigationItem+Spacing.h"
#import "UIBarButtonItem+Custom.h"


@implementation UINavigationItem (Spacing)


-(NSArray*)setLeftBarButtonItemsWithImageName:(NSString*)imageName target:(id)target selector:(SEL)selector
{
    UIBarButtonItem *negativeSpacer = [[ UIBarButtonItem alloc ] initWithBarButtonSystemItem : UIBarButtonSystemItemFixedSpace
                                                                                      target : nil action : nil ];
    negativeSpacer.width =- 10 ;
    
    UIBarButtonItem* leftBarButtonItem =[UIBarButtonItem leftBarButtonItemWithImageName:imageName target:target selector:selector];
    NSArray* arr = @[negativeSpacer,leftBarButtonItem];
    self.leftBarButtonItems = arr;
    return arr;
}


-(NSArray*)setRightBarButtonItemsWithImageName:(NSString*)imageName target:(id)target selector:(SEL)selector
{
    UIBarButtonItem *negativeSpacer = [[ UIBarButtonItem alloc ] initWithBarButtonSystemItem : UIBarButtonSystemItemFixedSpace
                                                                                      target : nil action : nil ];
    negativeSpacer.width =-10 ;
    
    UIBarButtonItem* leftBarButtonItem =[UIBarButtonItem leftBarButtonItemWithImageName:imageName target:target selector:selector];
    NSArray* arr = @[negativeSpacer,leftBarButtonItem];
    self.rightBarButtonItems = arr;
    return arr;
}



-(NSArray*)setRightBarButtonItemsWithTitle:(NSString*)title target:(id)target selector:(SEL)selector button:(UIButton* __autoreleasing *)btn
{
    UIBarButtonItem *negativeSpacer = [[ UIBarButtonItem alloc ] initWithBarButtonSystemItem : UIBarButtonSystemItemFixedSpace
                                                                                      target : nil action : nil ];
    negativeSpacer.width =-10 ;
    
    UIBarButtonItem* leftBarButtonItem =[UIBarButtonItem barButtonItemWithTitle:title target:target selector:selector btn:btn];
    NSArray* arr = @[negativeSpacer,leftBarButtonItem];
    self.rightBarButtonItems = arr;
    return arr;
}



-(NSArray*)setRightBarButtonWithItems:(NSArray*)items
{
    UIBarButtonItem *negativeSpacer = [[ UIBarButtonItem alloc ] initWithBarButtonSystemItem : UIBarButtonSystemItemFixedSpace
                                                                                      target : nil action : nil ];
    negativeSpacer.width =-10 ;
    NSMutableArray* arr = [NSMutableArray arrayWithObject:negativeSpacer];
    [arr addObjectsFromArray:items];
    self.rightBarButtonItems = arr;
    return arr;
}


@end
