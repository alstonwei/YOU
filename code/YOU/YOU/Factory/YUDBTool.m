//
//  YUDBTool.m
//  YOU
//
//  Created by epailive on 17/3/20.
//  Copyright © 2017年 YOU: Say to yourself. All rights reserved.
//

#import "YUDBTool.h"
#import "FMDB.h"
#import "MJExtension.h"

NSString* const collection_table = @"collection";

@interface  YUDBTool()

@property (strong, nonatomic) FMDatabaseQueue * dbQueue;
@end
@implementation YUDBTool
DEFINE_SINGLETON_FOR_CLASS(YUDBTool);

-(void)createTable
{
     __block BOOL result = true;
    NSString* sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (collectionId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT NOT NULL,pwd TEXT NOT NULL,cover TEXT NOT NULL,date TEXT NOT NULL,modifyDate TEXT NOT NULL,enterDetailUsePwd Boolean NOT NULL,showCollectionUsePwd Boolean NOT NULL)",@"collection"];
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql];
    }];
    
    if (!result) {
        NSLog(@"ERROR, failed to insert/replace into table: %@", collection_table);
    }
}

- (FMDatabaseQueue *)dbQueue
{
    if(!_dbQueue)
    {
        NSString* dbPath =[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"you.sqllite"];
        _dbQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    }
    return _dbQueue;
}


-(void)insertCollection:(YUCollectionModel*)collection
{
    //NSDictionary* dic = [collection key];
    NSString* sql = [NSString stringWithFormat: @"insert INTO %@ (name,pwd,cover,date,modifyDate,enterDetailUsePwd,showCollectionUsePwd) values (?,?,?,?,?,?,?)",@"collection"];
    __block BOOL result;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql,collection.name,collection.pwd,collection.cover,collection.date,collection.date,@(collection.enterDetailUsePwd),@(collection.showCollectionUsePwd)];
    }];
    if (!result) {
        NSLog(@"ERROR, failed to insert/replace into table: %@", collection_table);
    }
}

-(NSMutableArray*)queryCollections
{
    NSString * sql = [NSString stringWithFormat:@"SELECT * from %@ where pwd = '1234'", collection_table];
    __block NSMutableArray * result = [NSMutableArray array];
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet * rs = [db executeQuery:sql];
        while ([rs next]) {
            NSDictionary* dic = [rs resultDictionary];
            [result addObject:dic];
        }
        [rs close];
    }];
    NSMutableArray* objs = [YUCollectionModel mj_objectArrayWithKeyValuesArray:result];
    return objs;
}
@end
