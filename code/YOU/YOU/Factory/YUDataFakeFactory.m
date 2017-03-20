//
//  YUDataFakeFactory.m
//  YOU
//
//  Created by epailive on 17/3/20.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import "YUDataFakeFactory.h"
#import "YUCollectionModel.h"

@implementation YUDataFakeFactory


/**
 

 @return
 */
+(NSMutableArray*)fakeCollectionModelArray
{
    NSMutableArray* arr = [NSMutableArray array];
    [arr addObject:[YUCollectionModel collectionModelWithName:@"重庆" pwd:@"1234"]];
    [arr addObject:[YUCollectionModel collectionModelWithName:@"南京" pwd:@"1234"]];
    [arr addObject:[YUCollectionModel collectionModelWithName:@"美女" pwd:@"1234"]];
    [arr addObject:[YUCollectionModel collectionModelWithName:@"武汉" pwd:@"1234"]];
    [arr addObject:[YUCollectionModel collectionModelWithName:@"学生时代" pwd:@"1234"]];
    [arr addObject:[YUCollectionModel collectionModelWithName:@"休息时刻" pwd:@"1234"]];
    [arr addObject:[YUCollectionModel collectionModelWithName:@"随想" pwd:@"1234"]];
    [arr addObject:[YUCollectionModel collectionModelWithName:@"武汉" pwd:@"1234"]];
    [arr addObject:[YUCollectionModel collectionModelWithName:@"学生时代" pwd:@"1234"]];
    [arr addObject:[YUCollectionModel collectionModelWithName:@"休息时刻" pwd:@"1234"]];
    [arr addObject:[YUCollectionModel collectionModelWithName:@"随想" pwd:@"1234"]];
    [arr addObject:[YUCollectionModel collectionModelWithName:@"武汉" pwd:@"1234"]];
    [arr addObject:[YUCollectionModel collectionModelWithName:@"学生时代" pwd:@"1234"]];
    [arr addObject:[YUCollectionModel collectionModelWithName:@"休息时刻" pwd:@"1234"]];
    [arr addObject:[YUCollectionModel collectionModelWithName:@"随想" pwd:@"1234"]];
    [arr addObject:[YUCollectionModel collectionModelWithName:@"武汉" pwd:@"1234"]];
    [arr addObject:[YUCollectionModel collectionModelWithName:@"学生时代" pwd:@"1234"]];
    [arr addObject:[YUCollectionModel collectionModelWithName:@"休息时刻" pwd:@"1234"]];
    [arr addObject:[YUCollectionModel collectionModelWithName:@"随想" pwd:@"1234"]];
    return arr;
}

@end
