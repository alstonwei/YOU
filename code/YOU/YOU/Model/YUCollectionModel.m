//
//  YUCollectionModel.m
//  YOU
//
//  Created by epailive on 17/3/20.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import "YUCollectionModel.h"

@implementation YUCollectionModel


- (NSString *)cover
{
    if (!_cover) {
       return @"cover";
    }
    return _cover;
}
+(YUCollectionModel*)collectionModelWithName:(NSString*)name
                                         pwd:(NSString*)pwd
{
    YUCollectionModel* m = [YUCollectionModel new];
    m.name = name;
    m.pwd = pwd;
    m.date = [[NSDate new] description];
    m.modifyDate = m.date;
    m.enterDetailUsePwd = 0;
    m.showCollectionUsePwd = 1;

    return m;
}


@end
