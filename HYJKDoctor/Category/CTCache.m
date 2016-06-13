//
//  CTCache.m
//  sexduoduo
//
//  Created by shown on 16/3/15.
//  Copyright © 2016年 dbCode. All rights reserved.
//  缓存

#import "CTCache.h"

@implementation CTCache

+ (void)setCache:(id)obj FileName:(NSString *)fileName
{
    // 2.归档模型对象
    // 2.1.获得Documents的全路径
//    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *docPath = [NSString stringWithFormat:@"%@/Documents/",NSHomeDirectory()];
    
    // 2.2.获得文件的全路径
    NSString *filePath = [docPath stringByAppendingString:fileName];
    
    // 2.3.将对象归档
    [NSKeyedArchiver archiveRootObject:obj toFile:filePath];
}

+(id)getCache:(NSString *)fileName
{
    // 2.1.获得Documents的全路径
    NSString *docPath = [NSString stringWithFormat:@"%@/Documents/",NSHomeDirectory()];
    
    // 2.2.获得文件的全路径
    NSString *filePath = [docPath stringByAppendingString:fileName];
    
    // 3.从文件中读取MJStudent对象
    id obj = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return obj;
}

@end
