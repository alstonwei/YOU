//
//  YUHomeVC.h
//  YOU
//
//  Created by epailive on 17/3/9.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YUHomeVC : UIViewController
@property(nonatomic,assign)BOOL subCollection;
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property(nonatomic,strong)NSMutableArray* dataSource;
@property(nonatomic,strong)NSMutableArray* fetchDataArray;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
@property (weak, nonatomic) IBOutlet UIButton *btnFetch;
- (IBAction)btnFetchClicked:(id)sender;

@end
