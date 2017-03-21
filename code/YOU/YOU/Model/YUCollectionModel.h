//
//  YUCollectionModel.h
//  YOU
//
//  Created by epailive on 17/3/20.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YUCollectionModel : NSObject
@property(nonatomic,assign)int collectionId;
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString* pwd;
@property(nonatomic,copy)NSString* cover;
@property(nonatomic,copy)NSString* date;
@property(nonatomic,copy)NSString* modifyDate;
//进入详情是否需要密码
@property(nonatomic,assign)BOOL enterDetailUsePwd;
//显示集合是否需要密码。
@property(nonatomic,assign)BOOL showCollectionUsePwd;

@property(nonatomic,copy)NSString* des;


+(YUCollectionModel*)collectionModelWithName:(NSString*)name
                                         pwd:(NSString*)pwd;
@end
