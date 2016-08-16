//
//  MXKVStorage.m
//  learnYapDatabase
//
//  Created by 谢鹏翔 on 16/8/15.
//  Copyright © 2016年 ime. All rights reserved.
//

#import "MXKVStorage.h"
#import <YapDatabase/YapDatabase.h>

static MXKVStorage *sharedStorage = nil;

@interface MXKVStorage ()

@property (nonatomic, strong) YapDatabase *database;

@property (nonatomic, strong) YapDatabaseConnection *connnection;

@end

@implementation MXKVStorage

+ (MXKVStorage *)sharedStorage
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStorage = [[MXKVStorage alloc] init];
    });
    
    return sharedStorage;
}

- (void)setup
{
    YapDatabase *database = [[YapDatabase alloc] initWithPath:[self path]];
    
    _database = database;
    
    [self loadDatabaseConnection];
}

- (NSString *)path
{
    NSString *dbPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    dbPath = [[dbPath stringByAppendingPathComponent:@"kv"] stringByAppendingPathExtension:@"db"];
    
    return dbPath;
}

- (void)loadDatabaseConnection
{
    if (!_connnection) {
        _connnection = [_database newConnection];
    }
}

@end

@implementation MXKVStorage (Founction)

- (void)saveItem:(id)item forKey:(NSString *)key inCollecion:(NSString *)collection
{
    [[self connnection] readWriteWithBlock:^(YapDatabaseReadWriteTransaction * _Nonnull transaction) {
        
        [transaction setObject:item forKey:key inCollection:collection];
    }];
}

- (id)itemForKey:(NSString *)key inCollecion:(NSString *)collection
{
    __block id item = nil;
    
    [[self connnection] readWithBlock:^(YapDatabaseReadTransaction * _Nonnull transaction) {
        
        item = [transaction objectForKey:key inCollection:collection];
    }];
    
    return item;
}

@end





