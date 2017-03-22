//
//  YUHomeFolderCell.h
//  YOU
//
//  Created by epailive on 17/3/20.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YUCollectionModel.h"

@interface YUHomeFolderCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgCover;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIButton *btnEye;

- (IBAction)btnEyeClicked:(id)sender;



@property(nonatomic,strong)YUCollectionModel* collectionModel;
@property(nonatomic,copy)void(^actionBlock)(YUHomeFolderCell* cell,id sender);
@end
