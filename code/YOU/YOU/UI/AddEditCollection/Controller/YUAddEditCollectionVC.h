//
//  YUAddEditCollectionVC.h
//  YOU
//
//  Created by epailive on 17/3/20.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLFormViewController.h"
#import "YUCollectionModel.h"

typedef void(^YUSaveResultBlock)(BOOL result,YUCollectionModel * collection);
@interface YUAddEditCollectionVC : XLFormViewController

@property(nonatomic,copy) UIViewController* homeVC;
@property(nonatomic,copy)YUSaveResultBlock resultBlock;
@property(nonatomic,strong)YUCollectionModel* editCollection;
@end
