//
//  MXKVStorage.h
//  learnYapDatabase
//
//  Created by 谢鹏翔 on 16/8/15.
//  Copyright © 2016年 ime. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MXKVStorage : NSObject

+ (MXKVStorage *)sharedStorage;

- (void)setup;

@end

@interface MXKVStorage (Founction)

- (void)saveItem:(id)item forKey:(NSString *)key inCollecion:(NSString *)collection;

- (id)itemForKey:(NSString *)key inCollecion:(NSString *)collection;

@end