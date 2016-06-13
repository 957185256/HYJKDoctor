//
//  CTCache.h
//  sexduoduo
//
//  Created by shown on 16/3/15.
//  Copyright © 2016年 dbCode. All rights reserved.
//  缓存

#import <Foundation/Foundation.h>

@interface CTCache : NSObject
/**
 *  添加缓存
 *
 *  @param obj  缓存对象
 *  @param fileName 缓存文件名称
 */
+ (void)setCache:(id)obj FileName:(NSString *)fileName;
/**
 *  获取缓存
 *
 *  @return
 */
+ (id)getCache:(NSString *)fileName;

@end
