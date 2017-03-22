//
//  YUHomeFolderCell.m
//  YOU
//
//  Created by epailive on 17/3/20.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import "YUHomeFolderCell.h"

@implementation YUHomeFolderCell

- (void)awakeFromNib{
    [super awakeFromNib];
    self.contentView.layer.cornerRadius = 10;
    self.contentView.clipsToBounds = YES;
}

- (IBAction)btnEyeClicked:(id)sender {
    if (self.actionBlock) {
        self.actionBlock(self,sender);
    }
}

- (void)setCollectionModel:(YUCollectionModel *)collectionModel{
    _collectionModel = collectionModel;
    self.lblName.text = _collectionModel.name;
    if (_collectionModel.cover) {
         self.imgCover.image = [UIImage imageNamed:_collectionModel.cover];
    }
   
}

@end
