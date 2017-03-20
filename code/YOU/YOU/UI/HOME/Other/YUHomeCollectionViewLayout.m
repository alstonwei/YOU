//
//  YUHomeCollectionViewLayout.m
//  YOU
//
//  Created by epailive on 17/3/20.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import "YUHomeCollectionViewLayout.h"

@implementation YUHomeCollectionViewLayout


- (void)prepareLayout
{
    [super prepareLayout];
    CGFloat pw = CGRectGetWidth(self.collectionView.bounds);
    //CGFloat ph = CGRectGetHeight(self.collectionView.bounds);
    
    CGFloat spacing = 20;
    NSInteger coloumn = 2;
    
    CGFloat itemW = (pw - spacing*(coloumn+1))/coloumn;
    self.itemSize = CGSizeMake(itemW, itemW);
    self.sectionInset = UIEdgeInsetsMake(spacing, spacing, spacing, spacing);
    self.minimumLineSpacing = spacing;
    self.minimumInteritemSpacing = spacing;

}

@end
