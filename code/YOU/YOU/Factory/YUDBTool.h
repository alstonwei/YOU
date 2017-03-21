//
//  YUDBTool.h
//  YOU
//
//  Created by epailive on 17/3/20.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SynthesizeSingleton.h"
#import "YUCollectionModel.h"

@interface YUDBTool : NSObject
DEFINE_SINGLETON_FOR_HEADER(YUDBTool);
-(void)createTable;

-(BOOL)updateCollection:(YUCollectionModel*)collection;
-(BOOL)insertCollection:(YUCollectionModel*)collection;
-(NSMutableArray*)queryCollections;
@end
