//
//  YUDetailHeaderView.h
//  YOU
//
//  Created by epailive on 17/3/22.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YUDetailHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
@property (weak, nonatomic) IBOutlet UIImageView *imgAchor;
@property(nonatomic,weak)UIScrollView* scrollView;
@end
